package com.surelution.ruijin

import com.surelution.whistle.core.Attribute

class FollowWxAction extends RuijinBaseAction{
	public boolean accept(){
		if(getParam("Event") == "subscribe"){
			return true
		}
	}
	
	public void execute(){
		def message = FollowMessage.get(1);
		put(new Attribute(Attribute.KEY_Content,message.message));
	}
}
