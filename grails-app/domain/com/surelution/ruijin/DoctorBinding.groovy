package com.surelution.ruijin

import com.surelution.whistle.core.Attribute


/**
 * 生成临时二维码，用来给医生绑定其微信号
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class DoctorBinding extends TempQrCode {

    static constraints = {
    }
	
	Doctor doctor
	
	
	public Attribute scanedBy(Subscriber subscriber) {
		doctor.subscriber = subscriber
		doctor.save()
		new Attribute(Attribute.KEY_Content, "绑定成功")
	}
}
