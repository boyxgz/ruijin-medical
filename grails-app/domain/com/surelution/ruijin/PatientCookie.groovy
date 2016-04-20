package com.surelution.ruijin

import java.util.Date;

class PatientCookie {

    static constraints = {
		patient unique:true
		cookieSn unique:true
    }

	Patient patient
	String cookieSn
	Date dateCreated
	Date lastUpdated

	public static PatientCookie populate(Patient patient) {
		def sc = PatientCookie.findOrCreateByPatient(patient)
		sc.cookieSn = UUID.randomUUID().toString()
		sc.save(flush:true)
		return sc
	}
}
