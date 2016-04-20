package com.surelution.ruijin

class ArticleController {

    def redirectTo(String id) {
		KeyedMessage msg = KeyedMessage.findByKey(id)
		if(msg && msg.message) {
			redirect(url:msg.message)
		}
	}
}
