import com.melist.User
import com.ning.http.client.FluentStringsMap
import com.ning.http.client.Response
import grails.converters.JSON

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

                if (meliObject.getAccessToken()) {
                    //Check if the user exist, if it doesn't then create it
                    FluentStringsMap meliParams = new FluentStringsMap();
                    meliParams.add("access_token", meliObject.getAccessToken());
                    Response response = meliObject.get("/users/me", meliParams);
                    String responseStr = response.getResponseBody()
                    def meliId = JSON.parse(responseStr).id
                    def meliNickname = JSON.parse(responseStr).nickname

                    User myUser = User.findByMeliId(meliId)
                    if (!myUser){
                        myUser = new User(meliId: meliId,
                                refreshToken: meliObject.getRefreshToken(),
                                accessToken: meliObject.getAccessToken(),
                                nickname: meliNickname)
                        myUser.save flush: true
                    }
                    session['loggedUser'] = myUser
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