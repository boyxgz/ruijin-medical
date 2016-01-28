package com.surelution.ruijin


class Subscriber {

    static constraints = {
		medicalCardNum nullable:true
		userName nullable:true
		idCardNum nullable:true
    }
	
	static mapping = {
		openId unique:true	
	}
	
	String openId
	Date dateCreated
	String medicalCardNum  //绑定医疗卡卡号
	String userName   //绑定的患者姓名
	String idCardNum   //绑定的身份证信息
}
