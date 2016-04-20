package com.surelution.ruijin


/**
 * 预约时间类
 * @author admin
 *
 */
class Reservation{

    static constraints = {
    }
	
	Date reservationTime   //预约时间
	int  reservationNum   //预约量
	double price         //挂号费
	
	Date endReservation   //预约结束时间
	
	//TODO
	
	Schedule schedule    //排班信息
}
