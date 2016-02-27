package com.surelution.ruijin

import com.surelution.whistle.push.GroupInfo;

class DoctorGroupController {

    def list() {
		def groups = GroupInfo.listAll()
		[groups:groups]
	}
	
	
}
