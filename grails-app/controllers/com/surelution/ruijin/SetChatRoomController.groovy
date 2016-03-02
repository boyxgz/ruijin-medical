package com.surelution.ruijin

import grails.converters.JSON
import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.TextCustomerServiceMessage
import com.surelution.whistle.core.Auth2Util.AuthScope

class SetChatRoomController {

    def index() { }
	
	/**
	 * 聊天室设置
	 * @return
	 */
	private Doctor doctor
	def beforeInterceptor = {
		def userSn = request.getCookie('doctor-sn')
		
//		doctor = Doctor.get(1);
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
	
	def setChatRoom(){
		[doctor:doctor]
	}
	
	def remindOnOff(){
		if(doctor.remind == false){
			doctor.remind = true;
			doctor.msgRemind = true;
			doctor.attRemind = true;
		}else{
			doctor.remind = false;
			doctor.msgRemind = false;
			doctor.attRemind = false;
		}
		redirect(action:"setChatRoom");
	}
	
	def msgOnOff(){
		if(doctor.msgRemind == false){
			doctor.msgRemind = true;
			doctor.remind = true;
		}else{
			doctor.msgRemind = false;
		}
		redirect(action:"setChatRoom");
	}
	
	def attOnOff(){
		if(doctor.attRemind == false){
			doctor.attRemind = true;
			doctor.remind = true;
		}else{
			doctor.attRemind = false;
		}
		redirect(action:"setChatRoom");
	}
	
}
