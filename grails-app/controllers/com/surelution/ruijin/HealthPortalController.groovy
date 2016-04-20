package com.surelution.ruijin

class HealthPortalController {

    def index() { 
		redirect(action:'healthPortal')
	}
	
	def healthPortal(){
		[healthInstand:Health.list(params)]
	}
	
	def healthShowContent(long id){
		[healthInstand:Health.get(id)]
	}
}
