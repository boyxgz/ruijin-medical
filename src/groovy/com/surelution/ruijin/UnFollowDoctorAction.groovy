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
		def dp = DoctorPatient.createCriteria().list {
			eq("patientPrefered",true)
			eq("patient",p)
		}
		if(dp[0] == null || p == null){
			return true
		}
	};
	
	public void execute() {
		def msg = KeyedMessage.findByKey("UnFollowDoctor");
		put(new Attribute(Attribute.KEY_Content,msg.message));
	};
}
