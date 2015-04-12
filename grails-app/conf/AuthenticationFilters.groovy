import javax.naming.AuthenticationException

/**
 * Created by darktemplar on 11/04/15.
 */
class AuthenticationFilters {
    def meliObject

    def filters = {
        callbackFromMeli(url: "/"){
            before = {
                if (params.code && !session['meliCode']) {
                    //Callback from Meli with code
                    session['meliCode'] = params.code
                    meliObject.authorize(params.code as String, "http://localhost:8080/melist")
                }else if (!meliObject.getAccessToken() && !session['meliCode']){
                    //Authenticate if not logged
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliObject.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                    return false
                }
                if (session['originalURI']){
                    //once we have been redirected from Meli, redirect to the original page
                    redirect(uri: session['originalURI'])
                    session['originalURI'] = ""
                    return true
                }
            }
        }

        loginCheck(controller: 'wishList', action: '*') {
            before = {
                if (!meliObject.getAccessToken() && !session['meliCode']){
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliObject.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                    return false
                }
            }

            afterView = { AuthenticationException e ->

                if (e) {
                    session['meliCode'] = ""
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliObject.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                }
            }
        }
    }
}