package com.surelution.ruijin

import com.surelution.whistle.push.GroupInfo;
import com.surelution.whistle.push.UserInfo;

class UnSubscribeAction extends RuijinBaseAction{
	private Doctor doctor
	public boolean accept(){
		if(getParam("Event") == "unsubscribe"){
			doctor = Doctor.findOrSaveBySubscriber(subscriber);
			println doctor
			if(doctor != null){
				return true;
			}
		}
		return false
	}
	
	public void execute(){
		GroupInfo.moveUserToGroup(doctor.subscriber.openId, AppVar.findByKey("defalut-group-id").value);
		doctor.subscriber = null;
		doctor.save();
		keepSilence();
	}
}
