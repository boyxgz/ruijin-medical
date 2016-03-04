package com.surelution.ruijin

import com.surelution.whistle.core.Attribute
/**
 * 微信用户不是患者，或者是患者但是没有关注医生的时候回复消息。
 * @author <a herf="qiushemgming@sh-hansi.com"></a>
 *
 */
class UnFollowDoctorAction extends RuijinBaseAction{
	public boolean accept() {
		def p = Patient.findBySubscriber(subscriber);
		def dp = DoctorPatient.findByPatient(p);
		println dp
		if(p == null || dp == null){
			return true
		}
	};
	
	public void execute() {
		def msg = FollowMessage.findByIndexId(50);
		println msg
		put(new Attribute(Attribute.KEY_Content,msg.message));
	};
}
