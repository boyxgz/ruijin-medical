package com.surelution.ruijin

import grails.util.Holders

import com.surelution.whistle.core.js.JsApiContext


class WxTagLib {
	static namespace = "wx"

	def registerJsapi = {attrs->
		def debug = attrs['debug']
		if(!debug) {
			debug = false
		}
		def url = attrs['url']
		if(!url) {
			url = "${Holders.config.grails.serverURL}${request.forwardURI}"
		}
		println url
		def apiList = attrs['apiList']
		def context = JsApiContext.build(url)
		def content = """
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
  wx.config({
      debug: false,
      appId: '${context.appId}',
      timestamp: ${context.timestamp},
      nonceStr: '${context.nonceStr}',
      signature: '${context.signature}',
      jsApiList: [${apiList}
]
  });
</script>
"""
		out << content
	}
}
