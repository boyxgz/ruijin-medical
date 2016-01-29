/**
 * 
 */
package com.surelution.ruijin

import com.surelution.whistle.core.Attribute

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
		doctor != null
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		def patiend = Patient.findOrSaveBySubscriber(subscriber)
		def dp = DoctorPatient.findOrSaveByDoctorAndPatient(doctor, patiend)
		
		put(new Attribute(Attribute.KEY_Content, "您已经关注医生：${doctor.name}"))
	}

}
