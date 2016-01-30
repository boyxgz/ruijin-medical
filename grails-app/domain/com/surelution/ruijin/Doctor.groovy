package com.surelution.ruijin

class Doctor {
	
	static constraints = {
		subscriber nullable:true 
		image nullable:true
	}
	
	String name   //姓名
	String description  //医生简介
	String skills   //医生擅长
	String title    //医生职称
	int    inquiries //在线咨询量
	int    reservations //挂号预约量
	String address    //医生执业点
	
	DynImage image   //医生头像
	
	Subscriber subscriber //微信用户
    
}
