import com.mercadolibre.sdk.Meli

// Place your Spring DSL code here
beans = {
    meliObject(Meli) { beanDefinition ->
        beanDefinition.constructorArgs = [grailsApplication.metadata['application.id'] as Long,
                                          grailsApplication.metadata['application.key']]
    }
}
