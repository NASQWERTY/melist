package com.melist

class Contribution {

    String mepaId
    User contributor
    BigDecimal amount
    WishList wishList

    static constraints = {
        mepaId blank: true, nullable: true
        contributor blank: true, nullable: true
        amount blank: false, nullable: false
        wishList blank: false, nullable: false
    }
}
