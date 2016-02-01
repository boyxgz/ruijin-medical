package com.surelution.ruijin

import grails.converters.JSON
import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo;

class DoctorPortalController {

	private Doctor doctor

	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('doctor-sn')
		
		doctor = Doctor.get(1)
//		doctor = DoctorCookie.findByCookieSn(userSn)?.doctor
//		
//		if(!doctor) {
//			def requestUrl = request.forwardURI
//			def baseUrl = Holders.config.grails.serverURL
//			def url = Auth2Util.buildRedirectUrl("${baseUrl}/autoLogin/doctor", requestUrl, AuthScope.BASE)
//			response.deleteCookie('doctor-sn')
//			redirect(url:url)
//			return false
//		}
		return true
	}

    def index() {
		
	}

	/**
	 * 获取聊天记录，所有isRead为false的聊天记录
	 * @return
	 */
	def fetchMsg() {
		def interations = Interaction.createCriteria().list {
			createAlias("dp", "d")
			eq("d.doctor", doctor)
			eq("isRead", false)
		}
		
		def msg = interations.collect() {
			[patientId:it.dp.patient.id, msg:it.message, sn:it.sn, dateCreated:it.dateCreated.format("yyyy-MM-dd HH:mm:ss")]
		}
		
		interations.each {
			it.isRead = true
			it.save()
		}

		render msg as JSON
	}

	/**
	 * 获取患者的信息，如微信昵称、头像、医生备注的其他信息等。为了提升效率，一次可以取一组信息<br/>
	 * 请求参数如下：
	 * patientIds=123,345,567……<br/>
	 * 返回结果为json
	 * @return
	 */
	def fetchPatientInfo() {
		def patientIds = params.patientIds
		def ids
		def msg
		if(patientIds) {
			ids = patientIds.split(",")
		}
		ids?.collect() {
			Patient p = Patient.get(it)
			if(p) {
				DoctorPatient dp = DoctorPatient.findByDoctorAndPatient(doctor, p)
				def openId = p.subscriber?.openId
				if(openId) {
					UserInfo ui = UserInfo.loadUserInfo(openId)
					return [nickname:ui.nickname, headUrl:ui.headImgUrl, name:dp.name]
				}
			}
		}
		render msg as JSON
	}
}
