package com.surelution.ruijin

import org.springframework.dao.DataIntegrityViolationException

class HealthController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [healthInstanceList: Health.list(params), healthInstanceTotal: Health.count()]
    }

    def create() {
        [healthInstance: new Health(params)]
    }

    def save() {
        def healthInstance = new Health(params)
        if (!healthInstance.save(flush: true)) {
            render(view: "create", model: [healthInstance: healthInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'health.label', default: 'Health'), healthInstance.id])
//        redirect(action: "show", id: healthInstance.id)
		redirect(actioni:"list")
    }

    def show(Long id) {
        def healthInstance = Health.get(id)
        if (!healthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'health.label', default: 'Health'), id])
            redirect(action: "list")
            return
        }

        [healthInstance: healthInstance]
    }

    def edit(Long id) {
        def healthInstance = Health.get(id)
        if (!healthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'health.label', default: 'Health'), id])
            redirect(action: "list")
            return
        }

        [healthInstance: healthInstance]
    }

    def update(Long id, Long version) {
        def healthInstance = Health.get(id)
        if (!healthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'health.label', default: 'Health'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (healthInstance.version > version) {
                healthInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'health.label', default: 'Health')] as Object[],
                          "Another user has updated this Health while you were editing")
                render(view: "edit", model: [healthInstance: healthInstance])
                return
            }
        }

        healthInstance.properties = params

        if (!healthInstance.save(flush: true)) {
            render(view: "edit", model: [healthInstance: healthInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'health.label', default: 'Health'), healthInstance.id])
//        redirect(action: "list", id: healthInstance.id)
		redirect(action:"list")
    }

    def delete(Long id) {
        def healthInstance = Health.get(id)
        if (!healthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'health.label', default: 'Health'), id])
            redirect(action: "list")
            return
        }

        try {
            healthInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'health.label', default: 'Health'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'health.label', default: 'Health'), id])
//            redirect(action: "show", id: id)
			redirect(action:'list')
        }
    }
}
