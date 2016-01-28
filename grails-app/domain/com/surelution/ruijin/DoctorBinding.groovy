package com.surelution.ruijin

import com.surelution.whistle.core.Attribute

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
