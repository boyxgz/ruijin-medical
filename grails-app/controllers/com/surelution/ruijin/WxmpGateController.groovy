package com.surelution.ruijin

import javax.servlet.ServletInputStream

import com.surelution.whistle.core.Configure
import com.surelution.whistle.core.IncomeMessageDegister
import com.surelution.whistle.core.RequestProcessingChain
import com.surelution.whistle.core.WxmpHelper

class WxmpGateController {

    def index = {
		def method = request.method
		println method
		if("GET" == method) {
			
			String signature = request.getParameter("signature")
			String timestamp = request.getParameter("timestamp")
			String nonce = request.getParameter("nonce")
			String echostr = request.getParameter("echostr")
			Configure config = Configure.config()
			String token = config.getToken()
			println token
			if(WxmpHelper.checkSignature(token, timestamp, nonce, signature))
				render(echostr)
		
		} else if("POST" == method) {
			def paramsMap = request.parameterMap
			ServletInputStream is = request.getInputStream()
			Map<String, String> map = IncomeMessageDegister.parse(paramsMap, is)
			RequestProcessingChain chain = RequestProcessingChain.getInstance(this.getClass().getClassLoader(), "whistle.xml")
			String ret = chain.getContent(map)
			println ret
			render(ret)
			return
		} 
		render("hello")
	}
	
}
