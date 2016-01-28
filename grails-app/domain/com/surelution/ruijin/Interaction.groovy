package com.surelution.ruijin


/**
 * 消息互动
 * @author admin
 *
 */
class Interaction {

    static constraints = {
    }
	
	DoctorPatient dp   //医患关联
	Date dateCreated   //发送时间
	Boolean isRead    //是否已读
	String message    //消息
}
