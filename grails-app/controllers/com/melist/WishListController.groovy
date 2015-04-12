package com.melist

import com.ning.http.client.FluentStringsMap
import com.ning.http.client.Response
import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WishListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def meliObject

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def items = []

        //Bookmarks
        FluentStringsMap paramsBookmarks = new FluentStringsMap()
        paramsBookmarks.add("access_token", meliObject.getAccessToken())
        Response bookmarksResponse = meliObject.get("/users/me/bookmarks",paramsBookmarks)
        String bookmarksResponseStr = bookmarksResponse.getResponseBody()
        def o = JSON.parse(bookmarksResponseStr)

        //Items
        o.each {bookmark ->
            def itemId =  bookmark.item_id
            Response itemsResponse = meliObject.get("/items/"+itemId)
            String itemsResponseStr = itemsResponse.getResponseBody()
            def item = new Item()
            def itemObject = JSON.parse(itemsResponseStr)
            item.meliId = itemObject.id
            item.title = itemObject.title
            item.price = itemObject.price
            item.thumbnail = itemObject.thumbnail
            items << item
        }

        //params.max = Math.min(max ?: 10, 100)

        
        def url = "/sites/MLA/search?";
        FluentStringsMap params = new FluentStringsMap();
        params.add("access_token", meliObject.getAccessToken());
        params.add("q", "ipod");
        params.add("attributes", "results");
        Response response = meliObject.get(url,params)
        String responseStr = response.getResponseBody()
        def result = JSON.parse(responseStr)
        def results = result.getAt("results")

        results.each { aux ->
            def item = new Item()
            item.meliId = aux.id
            item.price = aux.price
            item.thumbnail = aux.thumbnail
            item.title = aux.title
            items << item
        }

        respond WishList.list(params), model:[wishListInstanceCount: WishList.count(), items: items]
    }

    def show(WishList wishListInstance) {
        respond wishListInstance
    }

    def create() {
        def wishList = new WishList(params)
        wishList.user = session['loggedUser']
        respond wishList
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

    def contribution(WishList wishListInstance) {
        respond wishListInstance
    }
}
