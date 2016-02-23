package com.surelution.ruijin

import com.surelution.whistle.core.Auth2Util;
import com.surelution.whistle.core.Auth2Util.AuthScope;

import grails.util.Holders;

class PatientController {

	//private Subscriber subscriber;
	/**
	 * 自动登录
	 */
/*	def beforeInterceptor = {
		def userSn = request.getCookie('user-sn');
		
		subscriber = SubscriberCookie.findBySubscriberSn(userSn)?.subscriber;
		
		if(!subscriber) {
			def requestUrl = request.forwardURI;
			def baseUrl = Holders.config.grails.serverURL;
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/subscriberPortal/autoLogin", requestUrl, AuthScope.BASE);
			response.deleteCookie('user-sn');
			redirect(url:url);
			return false;
		}
		return true;
	}*/
	
    def index() { }
	
	def personalCenter(){
		//个人中心
	}
	
	def registration(){
		//在线挂号
	}
	
	def handbook(){
		//预约指南
	}
	
	def information(){
		//个人资料
		def subID = Subscriber.get(2);	//subscriber.id
		def patient = Patient.findBySubscriber(subID);
		if(patient != null && patient.name != null){
			redirect(action:'showInformation');
		}
		else{
			redirect(action:'registers');
		}
	}
	
	def registers(){
		//注册
		def subID = Subscriber.get(2);	//subscriber.id
		def patient = Patient.findBySubscriber(subID);
		[patient:patient];
	}
	
	def showInformation(){
		//显示个人资料
		def subID = Subscriber.get(2);	//subscriber.id
		def patient = Patient.findBySubscriber(subID);
		[patient:patient];
	}
	
	def saveInformation(){
		//保存个人资料
		def patient;
		def name = params.name;
		def dateOfBirth = params.date('dateOfBirth','yyyy-MM-dd')
		def sex = params.sex;
		def iDcard = params.iDcard;
		def phoneNumb = params.phoneNumb;
		def datecareted = new Date();
		def subID = Subscriber.get(2);	//subscriber.id
		def patientSub = Patient.findBySubscriber(subID);
		if(patientSub != null){
			patient =patientSub;
		}
		else{
			patient = new Patient();
		}
		patient.name = name;
		patient.dateOfBirth = dateOfBirth;
		patient.sex = sex;
		patient.iDcard = iDcard;
		patient.phoneNumb = phoneNumb;
		patient.dateCreated = datecareted;
		patient.subscriber = 2;
		patient.save(flush:true);
		redirect(action:'showInformation');
		
	}
	
	def oneselfRegistration(){
		//我的预约
	}
	
	def selectDoctor(){
		//选择医生
		def num = Subscriber.get(2);//subscriber.id
		def patient = Patient.findBySubscriber(num);
		def dpCheckBox = new DoctorPatient();
		def doctorpatient = DoctorPatient.createCriteria().list {
			if(patient){
				eq('patient',patient);
			}
		}
		
		def dp = [];
		for(def i=0; i<doctorpatient.size(); i++){
			if(doctorpatient[i].isFocus){
				dp.add(doctorpatient[i]);
			}
			
			if(doctorpatient[i].patientPrefered){
				dpCheckBox = doctorpatient[i];
				println dpCheckBox
			}
		}
		
		if(dp[0] == null){
			flash.message = "您暂时未关注任何一位医生！";
		}
		else{
			flash.message ="";
		}
		
		[doctorpatient:dp,dpCheckBox:dpCheckBox]
	}
	
	def oneselfConcern(){
		//我的关注
		//TODO 获取用户的subscriber 然后再通过这个类找到患者的id
		def num = Subscriber.get(2);	//subscriber.id
		def patient = Patient.findBySubscriber(num);
		def doctorpatient = DoctorPatient.createCriteria().list {
			if(patient){
				eq('patient',patient);
			}
		}
		def dp = [];
		for(def i=0; i<doctorpatient.size(); i++){
			if(doctorpatient[i].isFocus){//为啥会出现下划线
				dp.add(doctorpatient[i]);
			}
		}
		if(dp[0] == null){
			flash.message = "您暂时未关注任何一位医生！";
		}
		else{
			flash.message ="";
		}
		[doctorpatient:dp]
	}
	
	def isFocusAc(){
		//取消关注
		def dp = params.dp;
		def doctorpatient = DoctorPatient.get(dp);
		doctorpatient.isFocus = false;
		redirect(action:'oneselfConcern');
	}
	
	def selectDoc(){
		def dp = DoctorPatient.get(params.dp);
		def p = DoctorPatient.createCriteria().list {
			eq("patient",dp.patient);
		}
		
		p.each {
			it.patientPrefered = false;
		}
		
		
		dp.patientPrefered = true;
		redirect(action:'selectDoctor');
	}
	
	def showPic(long id){
		def doctor = Doctor.get(id)
		def pc = doctor.image
		
		if(pc.enable){
			def picUrl = pc.picUrl
			File file = new File(picUrl)
			def os = response.outputStream
			os << file.bytes
			os.flush()
			return
		}
	}
}


