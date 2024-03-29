/**
 * 
 */
package com.surelution.ruijin

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.TemplateMessage
import com.surelution.whistle.push.UserInfo
/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class PatientSendingMessageAction extends RuijinBaseAction {
	
	private Patient patient
	private DoctorPatient dp

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	public boolean accept() {
		def msgType = getParam(Attribute.KEY_MsgType)
		if(msgType == Attribute.Msg_Type_TEXT || msgType == "image") {
			patient = Patient.findBySubscriber(subscriber)
			if(patient)
				dp = DoctorPatient.findByPatientAndPatientPrefered(patient, true)
			return dp.patientPrefered
		}
		return false
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		if(dp.isDPrefered == false){
			def message = KeyedMessage.findByKey("isDPrefered").message.replace("#doctor#",dp.doctor.name)
			put(new Attribute(Attribute.KEY_Content,message))
			return 
		}
		
		if(dp.doctorPrefered == false && dp.isDPrefered){
			def message = KeyedMessage.findByKey("doctorPreferedFalse").message.replace("#doctor#",dp.doctor.name)
			put(new Attribute(Attribute.KEY_Content, message))
			return
		}
		def message
		Interaction i = new Interaction()
		i.fromDoctor = false
		i.dp = dp
		i.isRead = false
		i.message = getParam(Attribute.KEY_Content)
		if(getParam(Attribute.KEY_MsgType) == "image") {
			RemoteMedia rm = new RemoteMedia()
			rm.url = getParam("PicUrl")
			rm.save(flush:true)

			i.msgType = "image"
			i.message = "${rootPath}/dynImage/patientUpload/${rm.id}"
			message = "[图片]"
		} else if(getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT) {
			i.msgType = "text"
			i.message = getParam(Attribute.KEY_Content)
			message = getParam(Attribute.KEY_Content)
		}
		
		i.save(flush:true)
		
		def df = DoctorLastFetche.findByDoctor(dp.doctor);
		def isDate;
		if(df == null){
			isDate = 1000;
		}else{
			isDate = (System.currentTimeMillis() - df.lastFetchAt)/1000;
		}
		
		def d = RecordTemplate.findByDoctor(dp.doctor);
		if(dp.doctor.msgRemind == false && isDate > 2 && d.isReadMsg){
			d.isReadMsg = false
			d.save(flush:true)
			def name = dp.patient.name
			if(name == null){
				name = UserInfo.loadUserInfo(dp.patient.subscriber.openId).nickname
			}
			println name
			println name == null
			def tm = new TemplateMessage()
			//pPsmrYfBwR2RNxWSOYZw9tpMc0KRaOPP26nxItgbezs
			tm.templateId = "pPsmrYfBwR2RNxWSOYZw9tpMc0KRaOPP26nxItgbezs"
			tm.toUser = dp.doctor.subscriber.openId
			tm.url = "${rootPath}/doctorPortal/chat/" + dp.id
			tm.addEntry("first", "你收到一条新留言，请查看","#000")
			tm.addEntry("user", name,"#000")
			tm.addEntry("ask", message,"#000")
			tm.addEntry("remark","如需回复，点击查看","#000")
			tm.send()
		}
		keepSilence()
	}

}
