package com.surelution.ruijin


/**
 * 患者类
 * @author admin
 *
 */
class Patient {

    static constraints = {
		subscriber unique:true
		name nullable:true
		dateOfBirth nullable:true
		iDcard nullable:true
		phoneNumb nullable:true
		comment nullable:true
		commentDat nullable:true
    }
	
	 String name //患者姓名
//	 int age     //年龄 commented by xuguangzong
	 Date dateOfBirth //生日
	 Sex sex = Sex.Unknown   //性别

	 String iDcard
	 String phoneNumb
	 
	 enum  Sex{
		 Man,Woman,Unknown
		 
	   public String toString() {
			 KeyedMessage.findByKey("Sex-" + name())?.message
		 }
	 }
	 
	 String comment		//备注信息
	 Date commentDat	//备注时间
	 
	 Date dateCreated  
	 Subscriber subscriber //微信用户
}
