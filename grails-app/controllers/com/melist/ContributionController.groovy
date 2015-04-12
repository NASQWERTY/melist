package com.melist

import com.mercadopago.MP
import grails.transaction.Transactional
import org.codehaus.jettison.json.JSONObject

@Transactional(readOnly = true)
class ContributionController {

    static allowedMethods = [save: "POST"]

    def meliObject

    @Transactional
    def save(Contribution contribution){
        //The access Token should actually be the one on the wishlist
        MP mercadoPago = new MP(contribution.wishList?.user.accessToken)
        mercadoPago.sandboxMode(true)
        JSONObject preference = mercadoPago.createPreference(
                "{'items':[{'title':$contribution.wishList.name,'quantity':1,'currency_id':'ARS','unit_price':$contribution.amount}]}");

        String paymentURL = preference.getJSONObject("response").getString("sandbox_init_point")
        //We assume that contributions are made
        contribution.save flush: true
        redirect(url: paymentURL)
    }
}
