package com.melist

class Contribution {

    String mepaId
    User contributor
    BigDecimal amount
    WishList wishList
    Item item

    static constraints = {
        meliId blank: false, nullable: false
        contributor blank: false, nullable: false
        amount blank: false, nullable: false
        wishList blank: false, nullable: false
        item blank: false, nullable: false
    }
}
