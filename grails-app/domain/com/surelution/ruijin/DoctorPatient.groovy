package com.surelution.ruijin


/**
 * 医患关联
 * @author admin
 *
 */
class DoctorPatient {

    static constraints = {
		illness nullable:true
		illness nullable:true
		doctor(unique:'patient')
    }
	
	Doctor doctor  //医生
	Patient patient //患者
	DynImage illness //病历照片
	Date dateCreated  //关联时间
	Boolean isFocus		//是否关注
	
	/**
	 * 是否是默认沟通联系的医生，由患者设置，每个患者只能设置不多于一个的医生为默认联系医生，
	 * 在患者给公众号发送消息时，患者的消息默认发送给这条指定的医生
	 */
	Boolean patientPrefered = true
}
