package com.surelution.ruijin


/**
 * 医患关联
 * @author admin
 *
 */
class DoctorPatient {

    static constraints = {
		illness nullable:true
    }
	
	Doctor doctor  //医生
	Patient patient //患者
	DynImage illness //病历照片
	Date dateCreated  //关联时间
}
