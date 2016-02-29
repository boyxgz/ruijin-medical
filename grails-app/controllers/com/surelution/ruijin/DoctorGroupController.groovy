package com.surelution.ruijin

import com.surelution.whistle.push.GroupInfo;

class DoctorGroupController {
	
	def static doctorGroup = "100";
	def static restsGruop = "0";
	
    def list() {
		def groups = GroupInfo.listAll()
		[groups:groups]
	}
	
	def create(){
		 
	 }
	 
	 def save(){
		 def name = params.name
		 def c = GroupInfo.listAll().count {
			 it.name == name
		 }
		 if(c < 1) {
			 GroupInfo.create(name)
		 }
		 
		 GroupInfo.moveUserToGroup("", "") 	
		 
		 redirect(action:'list')
	 }
	 
	 def moveToDoctorGroup(String id){
		GroupInfo.moveUserToGroup(id, AppVar.findByKey("doctor-group-id")?.value);
		redirect(action:'list',controller:'Doctor')
	 }
	 
	 def moveToDefaultGroup(String id){
		 GroupInfo.moveUserToGroup(id, AppVar.findByKey("defalut-group-id")?.value);
		 redirect(action:'list',controller:'Doctor')
	 }
}
