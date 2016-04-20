package com.surelution.ruijin

import com.sun.org.apache.bcel.internal.generic.FMUL;
import com.surelution.whistle.core.Attribute

class ErrorMessageAction extends RuijinBaseAction{
	
	public boolean accept(){
		def msgType = getParam(Attribute.KEY_MsgType)
		if(msgType != Attribute.Msg_Type_TEXT && msgType != "image") {
			return true
		}
		
		return false
	}
	
	public void execute(){
		def fm = KeyedMessage.findByKey("ErrorMessage")
		put(new Attribute(Attribute.KEY_Content,fm.message))
	}

}