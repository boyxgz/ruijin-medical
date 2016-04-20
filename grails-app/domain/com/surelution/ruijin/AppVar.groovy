package com.surelution.ruijin

class AppVar {

    static constraints = {
		key unique:true
		description nullable:true
    }

	static mapping = {
		key column:'_key'
		value column:'_value', type:'text'
	}

	String key
	String value
	String description
}
