import javax.naming.AuthenticationException

/**
 * Created by darktemplar on 11/04/15.
 */
class AuthenticationFilters {
//    def meliObject

    def filters = {
        loginCheck(controller: '*', action: '*') {
            before = {
                if (!meliObject || !meliObject.getAccessToken()) {
                    redirect(controller: "auth", action:"authenticate")
                    return false
                }
            }

            afterView = { AuthenticationException e ->

                if (e) {
                    redirect(controller: "auth", action:"authenticate")
                    return false
                }
            }
        }
    }
}