package com.melist

class Contribution {

    String mepaId
    User contributor
    BigDecimal amount
    WishList wishList

    static constraints = {
        mepaId blank: false, nullable: false
        contributor blank: false, nullable: false
        amount blank: false, nullable: false
        wishList blank: false, nullable: false
    }
}
