/**
 * 
 */
package com.surelution.ruijin

import com.surelution.whistle.core.Attribute;

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
		if(msgType == Attribute.Msg_Type_TEXT) {
			patient = Patient.findBySubscriber(subscriber)
			println patient
			if(patient)
				dp = DoctorPatient.findByPatient(patient)
			return dp.patientPrefered
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		Interaction i = new Interaction()
		i.fromDoctor = false
		i.dp = dp
		i.isRead = false
		i.message = getParam(Attribute.KEY_Content)
		i.sn = Counters.getNextValue("interation@doctor-patient=${dp.id}")
		i.save(flush:true)
		keepSilence()
	}

}
