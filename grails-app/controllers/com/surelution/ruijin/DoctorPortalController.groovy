package com.surelution.ruijin

import grails.converters.JSON
import com.surelution.whistle.core.Attribute
import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.TextCustomerServiceMessage
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo
import com.surelution.ruijin.FollowDoctorAction
class DoctorPortalController {

	private Doctor doctor

	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('doctor-sn')
		
//		doctor = Doctor.get(1);
		doctor = DoctorCookie.findByCookieSn(userSn)?.doctor
//		
		if(!doctor) {
			def requestUrl = request.forwardURI
			def baseUrl = Holders.config.grails.serverURL
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/autoLogin/doctor", requestUrl, AuthScope.BASE)
			response.deleteCookie('doctor-sn')
			redirect(url:url)
			return false
		}
		return true
	}

    def index() {
		
	}

	/**
	 * 
	 * @param DoctorPatient id
	 * @return
	 */

	def chat(Long id) {
		/**
		 * def rt = RecordTemplate.findByDoctor(doctor).isReadMsg = true;
		 * 		rt.save()
		 */
		def rt = RecordTemplate.findByDoctor(doctor);
		if(rt != null){
			rt.isReadMsg = true;
			rt.save()
		}
		
		def dp = DoctorPatient.get(id)
		/*if(id == null){
			dp = DoctorPatient.get( );
		}else{
		}*/
		if(dp?.doctor?.id == doctor.id) {
			return [dp:dp]
		}
		
		render(view:'error')
	}

	def sendMessage(Long id) {
		def dp = DoctorPatient.get(id)
		if(dp?.doctor?.id == doctor.id) {
			def cont = params.content;
			def temp = 0;
			for(def i=0; i<cont.size(); i++){
				if(cont[i] == '?'){
					temp++;
				}
			}
			def content = doctor.name;
			content += "回复：";
			content += cont;
			def interation = new Interaction()
			interation.dp = dp
			interation.fromDoctor = true
			interation.isRead = false
			interation.message = content
			interation.save(flush:true)
			TextCustomerServiceMessage csm = new TextCustomerServiceMessage()
			csm.content = content
			csm.touser = dp.patient.subscriber.openId
			csm.send()
			render loadMessages() as JSON
			return
		}
	}

	/**
	 * 获取聊天记录，所有isRead为false的聊天记录
	 * @return
	 */
	def fetchMsg() {
		render loadMessages() as JSON
		
	}

	/**
	 * 获取患者的信息，如微信昵称、头像、医生备注的其他信息等。为了提升效率，一次可以取一组信息<br/>
	 * 请求参数如下：
	 * id=123,345,567……<br/>
	 * 返回结果为json
	 * @return
	 */
	def fetchPatientInfo(String id) {
		def ids

		if(id) {
			ids = id.split(",")
		}
		def msg = []
		ids?.each() {dpId->
			def dp = DoctorPatient.get(dpId)
			if(dp?.doctor?.id == doctor.id && dp?.patient?.subscriber) {
				UserInfo ui = UserInfo.loadUserInfo(dp.patient.subscriber.openId)
				if(ui)
					msg.add([doctorPatientId:dp.id, nickname:ui.nickname, headUrl:ui.headImgUrl, name:dp.patientName])
			}
		}
		render msg as JSON
	}
	
	private List loadMessages() {
		
		def d = DoctorLastFetche.findOrCreateByDoctor(doctor);
		d.lastFetchAt = System.currentTimeMillis();
		d.save(flush:true);
		
		def interations = Interaction.createCriteria().list {
			createAlias("dp", "d")
			eq("d.doctor", doctor)
			eq("isRead", false)
		}
		
		def msg = interations.collect() {
			[doctorPatientId:it.dp.id,
				msg:it.message,
				msgId:it.id,
				inOrOut:it.fromDoctor?"0":"1", //if message sent by doctor, it's 'out' message, so it's '0'
				dateCreated:it.dateCreated.format("yyyy-MM-dd HH:mm:ss"),
				isRead: it.isRead?"1":"0",
				doctorName : it.dp.doctor.name,
				msgType : it.msgType]
		}
		
		interations.each {
			it.isRead = true
			it.save()
		}
		return msg
	}
	
	//
	def patientInformation(long id){
		def dp = DoctorPatient.get(id);
		[dp:dp]
	}
	
	def updateCom(long id){
		def dpId = id;
		
		def dp = DoctorPatient.get(id);
		dp.dTopComment = params.comment;
		dp.save();
		
		redirect(action:'chat',id:dpId);
	}
	
	//医生备注页面
	def doctorPrefered(long id){
		def rt = RecordTemplate.findByDoctor(doctor);
		if(rt != null){
			rt.isReadFollow = true;
			rt.save();
		}
		
		def dp = DoctorPatient.get(id);
		[dp:dp]
	}
	
	//医生备注页面表单提交 
	def firstCom(long id){
		def dpId = id;
		def dp = DoctorPatient.get(id);
		dp.isDPrefered = true;
		dp.doctorPrefered = true;
		dp.dTopComment = params.comment;
		dp.patientName = params.patientName;
		dp.patient.sex = params.sex;
		dp.commentDate = new Date();
		dp.save();
		TextCustomerServiceMessage csm = new TextCustomerServiceMessage()
		csm.content = dp.doctor.name + "医生以确认，您可以能正常与他沟通。"
		csm.touser = dp.patient.subscriber.openId
		csm.send()
		redirect(action:'doctorPrefered',id:dpId);
	}
	
	//医生控制患者来消息
	def chatOnOff(long id){
		def dpId = id;
		def dp = DoctorPatient.get(id);
		dp.doctorPrefered = dp.doctorPrefered ? false:true;
		/*if(dp.doctorPrefered == true){
			dp.doctorPrefered = false;
		}else{
			dp.doctorPrefered = true;
		}*/
		dp.save()
		redirect(action:'chat',id:dpId)
	}
	
	//点击图片放大的modal页面
	def showImg(){
		
	}
	
	def doctorPreferedList(){
		def dp = DoctorPatient.createCriteria().list {
			eq("doctor",doctor);
//			eq("doctorPrefered",false);
			order('doctorPrefered')
		}
		
		[dp:dp]
	}
	
	def perfered(Long id){
		def dp = DoctorPatient.get(id);
		dp.doctorPrefered = true;
		dp.save(flush:true)
	}
}
