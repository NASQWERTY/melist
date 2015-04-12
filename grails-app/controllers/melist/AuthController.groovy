package melist

class AuthController {

    def meliObject

    def authenticate() {
        String redirectURL = meliObject.getAuthUrl("http://localhost:8080/melist");
        redirect(url: redirectURL)
    }

    def index(){
        render view: '/index'
    }
}
