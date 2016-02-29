package com.surelution.ruijin

import org.springframework.dao.DataIntegrityViolationException

class AppVarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [appVarInstanceList: AppVar.list(params), appVarInstanceTotal: AppVar.count()]
    }

    def create() {
        [appVarInstance: new AppVar(params)]
    }

    def save() {
        def appVarInstance = new AppVar(params)
        if (!appVarInstance.save(flush: true)) {
            render(view: "create", model: [appVarInstance: appVarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'appVar.label', default: 'AppVar'), appVarInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def appVarInstance = AppVar.get(id)
        if (!appVarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "list")
            return
        }

        [appVarInstance: appVarInstance]
    }

    def edit(Long id) {
        def appVarInstance = AppVar.get(id)
        if (!appVarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "list")
            return
        }

        [appVarInstance: appVarInstance]
    }

    def update(Long id, Long version) {
        def appVarInstance = AppVar.get(id)
        if (!appVarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (appVarInstance.version > version) {
                appVarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'appVar.label', default: 'AppVar')] as Object[],
                          "Another user has updated this AppVar while you were editing")
                render(view: "edit", model: [appVarInstance: appVarInstance])
                return
            }
        }

        appVarInstance.properties = params

        if (!appVarInstance.save(flush: true)) {
            render(view: "edit", model: [appVarInstance: appVarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'appVar.label', default: 'AppVar'), appVarInstance.id])
        redirect(action: "show", id: appVarInstance.id)
    }

    def delete(Long id) {
        def appVarInstance = AppVar.get(id)
        if (!appVarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "list")
            return
        }

        try {
            appVarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'appVar.label', default: 'AppVar'), id])
            redirect(action: "show", id: id)
        }
    }
}
