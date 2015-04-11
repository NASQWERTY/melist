package melist

import com.mercadolibre.sdk.Meli

class AuthController {

    def meliObject

    def authenticate() {
        meliObject = new Meli(grailsApplication.metadata['application.id'],
                              grailsApplication.metadata['application.key'])
        String redirectURL = meliObject.getAuthUrl("http://localhost:8080/melist");
        redirect(url: redirectURL)
    }
}
