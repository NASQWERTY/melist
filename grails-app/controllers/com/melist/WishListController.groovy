package com.melist



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WishListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WishList.list(params), model:[wishListInstanceCount: WishList.count()]
    }

    def show(WishList wishListInstance) {
        respond wishListInstance
    }

    def create() {
        respond new WishList(params)
    }

    @Transactional
    def save(WishList wishListInstance) {
        if (wishListInstance == null) {
            notFound()
            return
        }

        if (wishListInstance.hasErrors()) {
            respond wishListInstance.errors, view:'create'
            return
        }

        wishListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'wishList.label', default: 'WishList'), wishListInstance.id])
                redirect wishListInstance
            }
            '*' { respond wishListInstance, [status: CREATED] }
        }
    }

    def edit(WishList wishListInstance) {
        respond wishListInstance
    }

    @Transactional
    def update(WishList wishListInstance) {
        if (wishListInstance == null) {
            notFound()
            return
        }

        if (wishListInstance.hasErrors()) {
            respond wishListInstance.errors, view:'edit'
            return
        }

        wishListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WishList.label', default: 'WishList'), wishListInstance.id])
                redirect wishListInstance
            }
            '*'{ respond wishListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WishList wishListInstance) {

        if (wishListInstance == null) {
            notFound()
            return
        }

        wishListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WishList.label', default: 'WishList'), wishListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'wishList.label', default: 'WishList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
