/**
 * 
 */
package com.surelution.ruijin

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.TemplateMessage
import com.surelution.whistle.push.UserInfo;

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
		if(dp.doctorPrefered == false){
			put(new Attribute(Attribute.KEY_Content, "${dp.doctor.name}忙碌中。"))
			return
		}
		Interaction i = new Interaction()
		i.fromDoctor = false
		i.dp = dp
		i.isRead = false
		i.message = getParam(Attribute.KEY_Content)
		if(getParam(Attribute.KEY_MsgType) == "image") {
			i.msgType = "image"
			i.message = getParam("PicUrl")
		} else if(getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT) {
			i.msgType = "text"
			i.message = getParam(Attribute.KEY_Content)
		}
		i.save(flush:true)
		
		def tp = TempData.createCriteria().list {
			eq("dp",dp)
		}
		def isSend ;
		def newTemp = new TempData()
		if(tp[0] == null){
			isSend = 1;
			newTemp.newMessageId = i
			newTemp.dp = i.dp
			newTemp.save(flush:true)
		}else{
			isSend = tp[0].newMessageId.isRead
			tp[0].newMessageId = i
		}
		
		//留言姓名以医生备注姓名为准，若无备注姓名则返回微信昵称
		if(isSend){
			def name = dp.patient.name
			if(name == null){
				name = UserInfo.loadUserInfo(dp.patient.subscriber.openId).nickname
			}
			def tm = new TemplateMessage()
			tm.templateId = "A4ozynjfXMHOSiXsWXnlUI0gZJ1_XBmxNbdtk_tdsQM"
			tm.toUser = dp.doctor.subscriber.openId
			tm.url = "qiushengming.sh-hansi.com/doctorPortal/chat/" + dp.id
			tm.addEntry("first", "你收到一条新留言，请查看","#000")
			tm.addEntry("keyword1", name,"#000")
			tm.addEntry("keyword2", new Date().format("yyyy-MM-dd HH:mm:ss"),"#000")
			tm.addEntry("remark","如需回复，点击查看","#000")
			tm.send()
		}
		keepSilence()
	}

}
