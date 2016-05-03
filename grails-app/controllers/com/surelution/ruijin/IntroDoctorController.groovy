package com.surelution.ruijin

class IntroDoctorController {

    def index() { }
	
	//介绍医生
	def introDoctor(){
		def doctorInstanceList = Doctor.createCriteria().list([sort:"index", order:"asc"]){
			gt("index",0)
		}
		
		[doctorInstanceList:doctorInstanceList,doctorInstanceTotal: Doctor.count()]
	}
	
	//医生的详细信息
	def showDoctor(long id){
		def doctor = Doctor.get(id)
		
		[doctor:doctor]
	}
	
	def showPic(long id){
	   def doctor = Doctor.get(id)
	   def pc = doctor.image
	  
	  if(pc.enable){
			def picUrl = pc.picUrl
			File file = new File(picUrl)
			def os = response.outputStream
			os << file.bytes
			os.flush()
			return
		}
	}
}
