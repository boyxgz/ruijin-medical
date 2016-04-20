package com.surelution.ruijin

import grails.util.Holders;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.surelution.ruijin.Subscriber;
import com.surelution.whistle.core.Auth2Util;
import com.surelution.whistle.push.GroupInfo;
import com.surelution.whistle.push.qrcode.QrCode;

class DoctorController {

    static allowedMethods = [save: "POST", update: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {   
        params.max = Math.min(max ?: 10, 100)
        [doctorInstanceList: Doctor.list(params), doctorInstanceTotal: Doctor.count()]
    }

    def create() {
        [doctorInstance: new Doctor(params)]
    }

    def save() {
        def doctorInstance = new Doctor(params)
		def image = new DynImage()
		CommonsMultipartFile photo =  request.getFile("doctorPic")
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}/${uuid}"
		
		if(photo && !photo.empty){
			def name = photo.getOriginalFilename()
			image.picUrl = picUrl
			image.originPicName = name
			image.enable = true
			image.save(flush:true)
			photo.transferTo(new File(picUrl))
		}
		
		
		   doctorInstance.image = image
		   println doctorInstance.save(flush: true)
		   if (!doctorInstance.save(flush: true)) {
            redirect(action:"list")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'doctor.label', default: 'Doctor'), doctorInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

		def db
		if(!doctorInstance?.subscriber) {
			db = new DoctorBinding()
			db.doctor = doctorInstance
			db.save()
		}
        [doctorInstance: doctorInstance, db:db]
    }

    def edit(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        [doctorInstance: doctorInstance]
    }

    def update(Long id, Long version) {
        def doctorInstance = Doctor.get(id);
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (doctorInstance.version > version) {
                doctorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'doctor.label', default: 'Doctor')] as Object[],
                          "Another user has updated this Doctor while you were editing")
                render(view: "edit", model: [doctorInstance: doctorInstance])
                return
            }
        }

        doctorInstance.properties = params;		//保存其他值
		
		
		CommonsMultipartFile photo =  request.getFile("doctorPic");
		if(!photo.empty){
			doctorInstance.image.enable = false;
			def image = new DynImage()
			def location = Holders.config.grails.dynImage.rootPath
			def uuid = UUID.randomUUID().toString()
			def picUrl = "${location}${uuid}"
			
			if(photo && !photo.empty){
				def name = photo.getOriginalFilename()
				image.picUrl = picUrl
				image.originPicName = name
				image.enable = true
				image.save(flush:true)
				photo.transferTo(new File(picUrl))
			}
			doctorInstance.image = image;
		}

        if (!doctorInstance.save(flush: true)) {
            render(view: "edit", model: [doctorInstance: doctorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'doctor.label', default: 'Doctor'), doctorInstance.id])
        redirect(action: "show", id: doctorInstance.id)
    }

    def delete(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        try{
            doctorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "show", id: id)
        }
    }
	
	//移出医生微信
	def removeSubscriber(long id){
		def doctor = Doctor.get(id);
		GroupInfo.moveUserToGroup(doctor.subscriber.openId, AppVar.findByKey("default-group-id")?.value);
		def doctorId = id;
		doctor.subscriber = null;
		doctor.save()
		redirect(action:"show",id:doctorId)
	}
	
	//显示图片的方法
	def showPic(long id){
		def doctor = Doctor.get(id)
		def pc = doctor.image
		
		if(pc.enable){
			def picUrl = pc.picUrl
			File file = new File(picUrl)
			def os = response.outputStream
			os << file.bytes
			os.flush()
			return
		}
	}
}
