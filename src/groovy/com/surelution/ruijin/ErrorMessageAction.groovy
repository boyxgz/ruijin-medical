package com.surelution.ruijin

import com.surelution.whistle.core.Attribute

class ErrorMessageAction extends RuijinBaseAction{
	
	public boolean accept(){
		def msgType = getParam(Attribute.KEY_MsgType)
		
		if(msgType != Attribute.Msg_Type_TEXT || msgType != "image") {
			return true
		}
		
		return false
	}
	
	public void execute(){
		put(new Attribute(Attribute.KEY_Content,"亲爱的用户，非常抱歉，目前占时不支持此类消息的处理！"))
	}

}