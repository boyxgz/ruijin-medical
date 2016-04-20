package com.surelution.ruijin

import com.surelution.whistle.core.Attribute

class FollowWxAction extends RuijinBaseAction{
	public boolean accept(){
		if(getParam("Event") == "subscribe"){
			return true
		}
	}
	
	public void execute(){
		def message = KeyedMessage.findByKey("FollowWx");
		put(new Attribute(Attribute.KEY_Content,message.message));
	}
}
