package com.surelution.ruijin

class Doctor {
	
	static constraints = {
		subscriber nullable:true 
		image nullable:true
	}
	
	/**
	 * 字段依次为：医生姓名、医生简介、医生特长、医生职称、在线咨询量、
	 * 			挂号预约量、医生执业点、医生头像、医生的微信账户
	 * 				提醒，关注提醒，消息提醒
	 */
	String name
	String description
	String skills
	String title
	int    inquiries
	int    reservations
	String address
	DynImage image
	Subscriber subscriber
	
	Boolean remind = false
	Boolean attRemind = false
	Boolean msgRemind = false
    
}
