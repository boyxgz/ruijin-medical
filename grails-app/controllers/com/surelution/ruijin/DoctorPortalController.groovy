package com.surelution.ruijin

import grails.converters.JSON
import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope

class DoctorPortalController {

	private Doctor doctor

	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('doctor-sn')
		
		doctor = DoctorCookie.findByCookieSn(userSn)?.doctor
		
		if(!doctor) {
			def requestUrl = request.forwardURI
			def baseUrl = Holders.config.grails.serverURL
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/autoLogin/doctor", requestUrl, AuthScope.BASE)
			response.deleteCookie('doctor-sn')
			redirect(url:url)
			return false
		}
		return true
	}

    def index() {
		
	}
	
	def fetchMsg() {
		def msgs = [
			[patientId:1,msg:'hello'],
			[patientId:2,msg:'hello2']
		]
		render msgs as JSON
	}
}
