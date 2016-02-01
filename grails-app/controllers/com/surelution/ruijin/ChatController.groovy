package com.surelution.ruijin

class ChatController {

    def index() { }
	
	def doctorList(){
		//医生列表
		def doctors = Doctor.list();
		println doctors;
		[doctors:doctors];

	}
	
	def startChat(long id){
		//开始聊天
	}
}
