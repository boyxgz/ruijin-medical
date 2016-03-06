package com.surelution.ruijin

class RecordTemplate {

    static constraints = {
    }
	/**
	 * 记录医生是否读了模板消息，
	 * 当产生一条模板消息的时候，将模板消息中new一个实例，
	 * 并且将isRead标记为false，当读模板消息那么将isRead设置为true。
	 */
	Doctor doctor
	Boolean isReadMsg = true;
	Boolean isReadFollow = true;
}
