package com.surelution.ruijin

import grails.util.Holders

import com.surelution.whistle.core.Auth2Util

class AutoLoginController {

    def doctor() {
		def subscriber = getSubscriber(params.code)
		
		def d = Doctor.findBySubscriber(subscriber)
		if(!d) {
			render(view:'invalidDoctor')
			return
		}
		
		def sc = DoctorCookie.populate(d)
		
		response.setCookie('doctor-sn', sc.cookieSn)
		redirect(url:"${Holders.config.grails.serverURL}${params.state}")
	}
	
	def patient() {
		def subscriber = getSubscriber(params.code)
		def p = Patient.findOrSaveBySubscriber(subscriber)
		println p
		def sc = PatientCookie.populate(p)
		
		response.setCookie('patient-sn', sc.cookieSn)
		redirect(url:"${Holders.config.grails.serverURL}${params.state}")
		
	}
	
	private Subscriber getSubscriber(String code) {
		def openId = Auth2Util.getOpenidByCode(code)
		def subscriber = Subscriber.findOrSaveByOpenId(openId)
		subscriber
	}
}
