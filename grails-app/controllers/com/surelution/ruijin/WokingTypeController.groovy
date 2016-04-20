package com.surelution.ruijin

import org.springframework.dao.DataIntegrityViolationException

class WokingTypeController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wokingTypeInstanceList: WokingType.list(params), wokingTypeInstanceTotal: WokingType.count()]
    }

    def create() {
        [wokingTypeInstance: new WokingType(params)]
    }

    def save() {
        def wokingTypeInstance = new WokingType(params)
        if (!wokingTypeInstance.save(flush: true)) {
            render(view: "create", model: [wokingTypeInstance: wokingTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wokingType.label', default: 'WokingType'), wokingTypeInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def wokingTypeInstance = WokingType.get(id)
        if (!wokingTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
            redirect(action: "list")
            return
        }

        [wokingTypeInstance: wokingTypeInstance]
    }

    def edit(Long id) {
        def wokingTypeInstance = WokingType.get(id)
        if (!wokingTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
            redirect(action: "list")
            return
        }

        [wokingTypeInstance: wokingTypeInstance]
    }

    def update(Long id, Long version) {
        def wokingTypeInstance = WokingType.get(id)
        if (!wokingTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wokingTypeInstance.version > version) {
                wokingTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wokingType.label', default: 'WokingType')] as Object[],
                          "Another user has updated this WokingType while you were editing")
               redirect(action: "list")
                return
            }
        }

        wokingTypeInstance.properties = params

        if (!wokingTypeInstance.save(flush: true)) {
            redirect(action: "list")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wokingType.label', default: 'WokingType'), wokingTypeInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def wokingTypeInstance = WokingType.get(id)
        if (!wokingTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
            redirect(action: "list")
            return
        }

        try {
            wokingTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wokingType.label', default: 'WokingType'), id])
           redirect(action: "list")
        }
    }
}
