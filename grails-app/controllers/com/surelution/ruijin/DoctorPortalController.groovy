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
			[patientId:it.dp.patient.id,
				openid:it.dp.patient.subscriber.openId, 
				msg:it.message, 
				msgId:it.id, 
				dateCreated:it.dateCreated.format("yyyy-MM-dd HH:mm:ss")]
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
		def openids = params.openids
		def ids

		if(openids) {
			ids = openids.split(",")
		}
		def msg = []
		ids?.each() {openid->
			def dp = DoctorPatient.createCriteria().get() {
				createAlias('patient', 'p')
				createAlias('p.subscriber', 's')
				eq('s.openId', openid)
				eq('doctor', doctor)
			}
			if(dp) {
				UserInfo ui = UserInfo.loadUserInfo(openid)
				if(ui)
					msg.add([openid:openid, nickname:ui.nickname, headUrl:ui.headImgUrl, name:dp.name])
			}
		}
		render msg as JSON
	}
}
