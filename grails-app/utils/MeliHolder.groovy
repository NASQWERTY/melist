import com.mercadolibre.sdk.Meli

/**
 * Created by darktemplar on 12/04/15.
 */
class MeliHolder {
    Meli meli

    MeliHolder(Long appId, String secretKey){
        meli = new Meli(appId, secretKey)
    }

    def refreshMeli(){
        //Log out
        meli = new Meli(grailsApplication.metadata['application.meli.appId'] as Long,
                grailsApplication.metadata['application.meli.secretKey'])
    }
}
