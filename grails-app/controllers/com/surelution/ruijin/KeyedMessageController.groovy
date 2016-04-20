package com.surelution.ruijin

import org.springframework.dao.DataIntegrityViolationException

class KeyedMessageController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [keyedMessageInstanceList: KeyedMessage.list(params), keyedMessageInstanceTotal: KeyedMessage.count()]
    }

    def create() {
        [keyedMessageInstance: new KeyedMessage(params)]
    }

    def save() {
        def keyedMessageInstance = new KeyedMessage(params)
        if (!keyedMessageInstance.save(flush: true)) {
            render(view: "create", model: [keyedMessageInstance: keyedMessageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), keyedMessageInstance.id])
//        redirect(action: "show", id: keyedMessageInstance.id)
		redirect(action:"list")
    }

    def show(Long id) {
        def keyedMessageInstance = KeyedMessage.get(id)
        if (!keyedMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "list")
            return
        }

        [keyedMessageInstance: keyedMessageInstance]
    }

    def edit(Long id) {
        def keyedMessageInstance = KeyedMessage.get(id)
        if (!keyedMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "list")
            return
        }

        [keyedMessageInstance: keyedMessageInstance]
    }

    def update(Long id, Long version) {
        def keyedMessageInstance = KeyedMessage.get(id)
        if (!keyedMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (keyedMessageInstance.version > version) {
                keyedMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'keyedMessage.label', default: 'KeyedMessage')] as Object[],
                          "Another user has updated this KeyedMessage while you were editing")
                render(view: "edit", model: [keyedMessageInstance: keyedMessageInstance])
                return
            }
        }

        keyedMessageInstance.properties = params

        if (!keyedMessageInstance.save(flush: true)) {
            render(view: "edit", model: [keyedMessageInstance: keyedMessageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), keyedMessageInstance.id])
//        redirect(action: "show", id: keyedMessageInstance.id)
		redirect(action:"list")
    }

    def delete(Long id) {
        def keyedMessageInstance = KeyedMessage.get(id)
        if (!keyedMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "list")
            return
        }

        try {
            keyedMessageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'keyedMessage.label', default: 'KeyedMessage'), id])
            redirect(action: "show", id: id)
        }
    }
}
