import javax.naming.AuthenticationException

/**
 * Created by darktemplar on 11/04/15.
 */
class AuthenticationFilters {
    def meliObject

    def filters = {
        loginCheck(controller: '*', action: '*') {
            before = {
                if (actionName.equals('authenticate')){
                    return true
                }
                if (!meliObject.getAccessToken() && params.code){
                    meliObject.authorize(params.code as String, "http://localhost:8080/melist")
                    session['meliCode'] = params.code
                    return true
                }else if (!params.code && !session['meliCode']) {
                    redirect(controller: "auth", action:"authenticate")
                    return false
                }
            }

            afterView = { AuthenticationException e ->

                if (e) {
                    session['meliCode'] = ""
                    redirect(controller: "auth", action:"authenticate")
                    return false
                }
            }
        }
    }
}