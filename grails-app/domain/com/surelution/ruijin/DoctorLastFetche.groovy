package com.surelution.ruijin

class DoctorLastFetche {
	/**
	 * 医生最后一次拉取消息的时间，
	 * 处理医生是否在聊天室内，若消息拉取一次的时间低于5秒的时候则提醒。
	 */
    static constraints = {
		doctor unique:true
		lastFetchAt nullable:true
    }
	
	Doctor doctor		//医生
	
	/**
	 * 最后拉取消息的毫秒数
	 */
	Long lastFetchAt = 0;
	
}
