package com.surelution.ruijin

class SubscriberCookie {

    static constraints = {
		subscriber unique:true
		subscriberSn unique:true
    }

	Subscriber subscriber
	String subscriberSn
	Date dateCreated
	Date lastUpdated
	
	public static SubscriberCookie populate(Subscriber subscriber) {
		def sc = SubscriberCookie.findOrCreateBySubscriber(subscriber)
		sc.subscriberSn = UUID.randomUUID().toString()
		sc.save(flush:true)
		return sc
	}
}
