package com.surelution.ruijin

import org.apache.commons.lang3.RandomUtils

import com.surelution.whistle.core.Attribute

/**
 * 系统中可能需要为了多种不同的目的产生不同的临时二维码，为了避免不同目的生成的二维码在生成、解析的时候出现冲突、错误，<br/>
 * 设置这个类，用来区分不同的二维码。<br/>
 * 每种目的的二维码生成，都应该实现一个这个类的子类。qr code一直都会增长，可能会有一个上限，临时二维码的编号是一个32位的整数，如果超出这个范围，延迟解决这个问题。
 *
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class TempQrCode {

	/**
	 * 临时二维码的起始点。根据腾讯的规则，永久二维码的个数是10万，为了预留足够的未来修改的空间，将起始点设置为100000000万
	 */
	public static final Integer QR_ID_START_FROM = 100000000
	
	/**
	 * 为了更安全（？），预留一位作为校验位
	 */
	public static final Integer MAX_REFUSING_NUM = 10

    static constraints = {
		qrKey nullable:true
    }

	static mapping = {
		tablePerHierarchy false
		qrKey index:'qr_key_index'
	}

	def afterInsert() {
		def r = RandomUtils.nextInt(0, MAX_REFUSING_NUM)
		//不知道搞毛，担心RandomUtils.nextInt不可靠
		if(r > 9 || r < 0) {
			r = 0
		}
		qrKey = id * MAX_REFUSING_NUM + r + QR_ID_START_FROM
		save()
	}

	String qrKey

	Date dateCreated
	
	/**
	 * TODO
	 * 好吧，这儿有一坨狗屎<br/>
	 * 当用户用微信扫描二维码后，在action中，这个方法被执行，并返回一个Attribute<br/>
	 * 这个方法将是一个非常重的方法，可能会需要调用到其他层次的东西，transaction等……没想好该咋搞，以后再说
	 * @param subscriber
	 * @return
	 */
	public Attribute scanedBy(Subscriber subscriber) {
		
	}
}
