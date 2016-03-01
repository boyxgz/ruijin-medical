package com.surelution.ruijin


/**
 * 医患关联
 * @author admin
 *
 */
class DoctorPatient {

    static constraints = {
		illness nullable:true
		patientName nullable:true
		dTopComment nullable:true
		commentDate nullable:true
		doctor(unique:'patient')
    }
	
	Doctor doctor  //医生
	Date dateCreated  //关联时间
	/**
	 * 是否关注
	 */
	Boolean isFocus

	/**
	 * 医生备注的患者信息，包括姓名，和备注内容
	 */
	Patient patient 	//患者
	String patientName	//医生给患者备注姓名
	String dTopComment	//医生给患者的备注信息
	Date commentDate 	//备注时间
	DynImage illness //病历照片
	
	/**
	 * 是否是默认沟通联系的医生，由患者设置，每个患者只能设置不多于一个的医生为默认联系医生，
	 * 在患者给公众号发送消息时，患者的消息默认发送给这条指定的医生
	 */
	Boolean patientPrefered = true	//患者是否确认
	Boolean doctorPrefered = true	//医生是否确认
}
