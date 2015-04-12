import com.mercadolibre.sdk.Meli
import org.springframework.beans.factory.config.BeanDefinition

// Place your Spring DSL code here
beans = {
    meliHolder(MeliHolder) { beanDefinition ->
        beanDefinition.constructorArgs = [grailsApplication.metadata['application.meli.appId'] as Long,
                                          grailsApplication.metadata['application.meli.secretKey']]
    }
}
