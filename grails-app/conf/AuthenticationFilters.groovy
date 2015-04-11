import javax.naming.AuthenticationException

/**
 * Created by darktemplar on 11/04/15.
 */
class AuthenticationFilters {
    def filters = {
        loginCheck(controller: '*', action: '*') {
            before = {
                if (!session.auth_token) {
                    redirect(controller: "auth", action:"authenticate")
                    return false
                }
            }

            afterView = { AuthenticationException e ->

                if (e) {
                    log.debug "Reauthenticating user", e
                }
            }
        }
    }
}