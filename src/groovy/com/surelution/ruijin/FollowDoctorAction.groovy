/**
 * 
 */
package com.surelution.ruijin

import java.text.Format;

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.TemplateMessage
import com.surelution.whistle.push.UserInfo;

/**
 * 患者关注医生
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class FollowDoctorAction extends RuijinBaseAction {
	
	private Doctor doctor

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	public boolean accept() {
		def docId
		if(getParam("Event") == "subscribe") {
			def eventKey = getParam("EventKey")
			if(eventKey && eventKey.startsWith("qrscene_")) {
				docId = eventKey.substring("qrscene_".length())
			}
		} else if(getParam("Event") == "SCAN") {
			docId = getParam("EventKey")
		}
		doctor = Doctor.get(docId)
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		def patiend = Patient.findOrSaveBySubscriber(subscriber)
		DoctorPatient.findAllByPatient(patiend).each {dp->
			dp.patientPrefered = false
			dp.save(flush:true)
		}
		
		def dp = DoctorPatient.findOrCreateByDoctorAndPatient(doctor, patiend)
		
		dp.patientPrefered = true
		dp.isFocus = true
		dp.save(flush:true)
		String message = KeyedMessage.findByKey("FollowDoctor").message.replace("#doctor#",dp.doctor.name)
		put(new Attribute(Attribute.KEY_Content, message))
		
		def d = RecordTemplate.findByDoctor(doctor);
		def rt;
		if(d == null){
			rt = new RecordTemplate()
			rt.doctor = doctor;
			rt.save();
		}
		
//		d = RecordTemplate.findByDoctor(doctor);
		def name = patiend.name
		if(name == null){
			def ui = UserInfo.loadUserInfo(patiend.subscriber.openId)
			name = ui.nickname
		}
		if(dp.doctor.attRemind == false){
			d.isReadFollow = false;
			d.save();
			def tm = new TemplateMessage()
			//2zuwp379Jud28xgtxTOtg22KbJTGWxDDYAcyPnu0n6g	
			tm.templateId = "2zuwp379Jud28xgtxTOtg22KbJTGWxDDYAcyPnu0n6g"
			tm.url = "${rootPath}/doctorPortal/doctorPrefered/" + dp.id
			tm.toUser = dp.doctor.subscriber.openId
			tm.addEntry("first", "患者关注提醒", "#000")
			tm.addEntry("keyword1",name,"#000")
			tm.addEntry("keyword2",doctor.name,"#000")
			tm.addEntry("keyword3",new Date().format("yyyy-MM-dd HH:mm:ss"),"#000")
			tm.addEntry("remark","点击查看详情,并为患者进行备注","#000")
			tm.send()
		}
//		keepSilence()
	}

}
