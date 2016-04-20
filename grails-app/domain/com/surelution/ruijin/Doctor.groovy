package com.surelution.ruijin

class Doctor {
	
	static constraints = {
		subscriber nullable:true 
		image nullable:true
		inquiries nullable:true
		reservations nullable:true
		address nullable:true
	}
	
	/**
	 * 字段依次为：医生姓名、医生简介、擅长领域、医生职称、在线咨询量、
	 * 			挂号预约量、医生执业点、医生头像、医生的微信账户
	 * 				提醒，关注提醒，消息提醒
	 */
	String name			//姓名
	String description	//服务理念
	String skills		//擅长领域
	String title		//职称
	Integer workingYear	//从业年限
	int    inquiries	//在线咨询量
	int    reservations	//挂号预约量
	String address		//地址
	DynImage image		//头像
	Subscriber subscriber
	
	Boolean remind = false
	Boolean attRemind = false	//false表示关着，可以接收消息
	Boolean msgRemind = false	//false 表示关着，可以接收消息
    
}
