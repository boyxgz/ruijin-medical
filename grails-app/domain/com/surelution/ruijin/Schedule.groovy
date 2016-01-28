package com.surelution.ruijin


/**
 * 排班表
 * @author admin
 *
 */
class Schedule {

    static constraints = {
    }
	
	Doctor doctor //医生
    Date  wokingTime //开始工作时间
	WokingType wokingType  //班种（专家班，普通班）
	 
	Date endDate    //上班结束时间
}
