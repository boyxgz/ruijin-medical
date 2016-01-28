package com.surelution.ruijin

class PatientController {

	/*private Subscriber subscriber;
	*//**
	 * 自动登录
	 *//*
	def beforeInterceptor = {
		def userSn = request.getCookie('user-sn');
		
		subscriber = SubscriberCookie.findBySubscriberSn(userSn)?.subscriber;
		
		if(!subscriber) {
			def requestUrl = request.requestURI;
			def baseUrl = Holders.config.grails.serverURL;
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/subscriberPortal/autoLogin", requestUrl, AuthScope.BASE);
			response.deleteCookie('user-sn');
			redirect(url:url);
			return false;
		}
		return true;
	}*/
	
    def index() { }
	
	def personalCenter(){
		//个人中心
	}
	
	def registration(){
		//在线挂号
	}
	
	def handbook(){
		//预约指南
	}
	
	def information(){
		//个人资料
	}
	
	def saveInformation(){
		//保存个人资料
		def name = params.name;
		def age = params.int('age');
		def sex = params.sex;
		def IDcard = params.IDcard;
		def phoneNumb = params.phoneNumb;
		def datecareted = new Date();
		
		def patient = new Patient();
		patient.name = name;
		patient.age = age;
		patient.sex = sex;
		patient.IDcard = IDcard;
		patient.phoneNumb = phoneNumb;
		patient.dateCreated = datecareted;
		patient.save(flush:true);
		redirect(action:'information');
		
	}
	
	def oneselfRegistration(){
		//我的预约
	}
	
	def oneselfConcern(){
		//我的关注
		//TODO 获取用户的subscriber 然后再通过这个类找到患者的id
		def num = Subscriber.get(1);
		def patient = Patient.findBySubscriber(num);
		def doctorpatient = DoctorPatient.findByPatient(patient);
		println doctorpatient.doctor.name
		println doctorpatient.doctor.reservations
		println doctorpatient.dateCreated
		[doctorpatient:doctorpatient]
	}
}
