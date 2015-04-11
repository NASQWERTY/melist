import com.melist.Item
import com.melist.User

class BootStrap {

    def init = { servletContext ->
        // Adding test users.
        User user1 = new User (meliId : "1")
        User user2 = new User (meliId : "2")
        User user3 = new User (meliId : "3")
        user1.save(flush: true)
        user2.save(flush: true)
        user3.save(flush: true)

        //Adding test Items.
        Item item4 = new Item(meliId: "MLA552603966",
                                "Espumador de leche",
                                new URL("http://mla-s1-p.mlstatic.com/espumador-de-leche-fria-y-caliente-philips-saeco-hd701918-22060-MLA20222196451_012015-O.jpg"),
                                new BigDecimal(500.00f)))
        Item item5 = new Item(meliId: "MLA550061607",
                                "Leche en polvo entera x 25kg",
                                new URL("http://mla-s2-p.mlstatic.com/leche-en-polvo-entera-x-25kg-fabrica-de-helados-20689-MLA20195790221_112014-F.jpg"),
                                new BigDecimal(950.00f)))
        Item item6 = new Item(meliId: "MLA550114136",
                                "Tv Samsung Slim Led 55",
                                new URL("http://mla-s2-p.mlstatic.com/tv-samsung-slim-led-55-un-55-f8000-full-hd-smart-tv-3d-9820-MLA20022256368_122013-O.jpg"),
                                new BigDecimal(24299.91f)))
        item4.save(flush: true)
        item5.save(flush: true)
        item6.save(flush: true)


    }
    def destroy = {
    }
}
