package com.surelution.ruijin

import java.util.Date;

class DoctorCookie {

    static constraints = {
		doctor unique:true
		cookieSn unique:true
    }

	Doctor doctor
	String cookieSn
	Date dateCreated
	Date lastUpdated
	
	public static DoctorCookie populate(Doctor doctor) {
		def sc = DoctorCookie.findOrCreateByDoctor(doctor)
		sc.cookieSn = UUID.randomUUID().toString()
		sc.save(flush:true)
		return sc
	}
}
