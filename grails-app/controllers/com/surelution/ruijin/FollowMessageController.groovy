package com.surelution.ruijin

import org.springframework.dao.DataIntegrityViolationException

class FollowMessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def fm = FollowMessage.get(1);
		println fm
		println "xiaoming"
        [followMessageInstanceList: fm, followMessageInstanceTotal: FollowMessage.count()]
    }

    def create() {
        [followMessageInstance: new FollowMessage(params)]
    }

    def save() {
        def followMessageInstance = new FollowMessage(params)
        if (!followMessageInstance.save(flush: true)) {
            render(view: "create", model: [followMessageInstance: followMessageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), followMessageInstance.id])
        redirect(action: "show", id: followMessageInstance.id)
    }

    def show(Long id) {
        def followMessageInstance = FollowMessage.get(id)
        if (!followMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "list")
            return
        }

        [followMessageInstance: followMessageInstance]
    }

    def edit(Long id) {
        def followMessageInstance = FollowMessage.get(id)
        if (!followMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "list")
            return
        }

        [followMessageInstance: followMessageInstance]
    }

    def update(Long id, Long version) {
        def followMessageInstance = FollowMessage.get(id)
        if (!followMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (followMessageInstance.version > version) {
                followMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'followMessage.label', default: 'FollowMessage')] as Object[],
                          "Another user has updated this FollowMessage while you were editing")
                render(view: "edit", model: [followMessageInstance: followMessageInstance])
                return
            }
        }

        followMessageInstance.properties = params

        if (!followMessageInstance.save(flush: true)) {
            render(view: "edit", model: [followMessageInstance: followMessageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), followMessageInstance.id])
        redirect(action: "show", id: followMessageInstance.id)
    }

    def delete(Long id) {
        def followMessageInstance = FollowMessage.get(id)
        if (!followMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "list")
            return
        }

        try {
            followMessageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'followMessage.label', default: 'FollowMessage'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def updates(long id){
		def fm = FollowMessage.get(id);
		fm.message = params.message;
		fm.save()
		redirect(action:'list')
	}
}
