import com.melist.User
import com.mercadolibre.sdk.Meli
import com.ning.http.client.FluentStringsMap
import com.ning.http.client.Response
import grails.converters.JSON

import javax.naming.AuthenticationException

/**
 * Created by darktemplar on 11/04/15.
 */
class AuthenticationFilters {
    def meliHolder

    def filters = {
        callbackFromMeli(url: "/"){
            before = {
                if (params.code && !session['meliCode']) {
                    //Callback from Meli with code
                    session['meliCode'] = params.code
                    meliHolder.meli.authorize(params.code as String, "http://localhost:8080/melist")
                }else if (!meliHolder.meli.getAccessToken() && !session['meliCode']){
                    //Authenticate if not logged
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliHolder.meli.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                    return true
                }
                if (session['originalURI']){
                    //once we have been redirected from Meli, redirect to the original page
                    redirect(uri: session['originalURI'])
                    session['originalURI'] = ""
                }else if (session['originalURI'] == "/") {
                    render (view: '/index')
                }
                return true
            }

            afterView = { AuthenticationException e ->

                if (meliHolder.meli.getAccessToken()) {
                    //Check if the user exist, if it doesn't then create it
                    FluentStringsMap meliParams = new FluentStringsMap();
                    meliParams.add("access_token", meliHolder.meli.getAccessToken());
                    Response response = meliHolder.meli.get("/users/me", meliParams);
                    String responseStr = response.getResponseBody()
                    def meliId = JSON.parse(responseStr).id
                    def meliNickname = JSON.parse(responseStr).nickname

                    User myUser = User.findByMeliId(meliId)
                    if (!myUser){
                        myUser = new User(meliId: meliId,
                                refreshToken: meliHolder.meli.getRefreshToken(),
                                accessToken: meliHolder.meli.getAccessToken(),
                                nickname: meliNickname)
                        myUser.save flush: true
                    }
                    session['loggedUser'] = myUser
                }
            }
        }

        loginCheck(controller: 'wishList', action: 'create') {
            before = {
                if (!meliHolder.meli.getAccessToken() && !session['meliCode']){
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliHolder.meli.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                    return false
                }
            }

            afterView = { AuthenticationException e ->

                if (e) {
                    session['meliCode'] = ""
                    session['originalURI'] = request.forwardURI.replace("/melist", "")
                    String redirectURL = meliHolder.meli.getAuthUrl("http://localhost:8080/melist");
                    redirect(url: redirectURL)
                }
            }
        }

        clearMeliObjectBeforePayment(controller: 'wishList', action: 'contribution'){
            before = {
                if (meliHolder.meli) {
                    meliHolder.refreshMeli()
                }
            }
        }
    }
}