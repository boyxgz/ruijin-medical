package com.surelution.ruijin


class IncomeMessage {

    static constraints = {
		content nullable:true
		msgId nullable:true
    }
	
	static transients = ['createAt']

	String msgId
	String fromUserName
	long createTime
	String content
	String toUserName
	String msgType
	
	public Date getCreateAt() {
		new Date(createTime * 1000)
	}
}
