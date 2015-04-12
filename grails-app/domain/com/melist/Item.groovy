package com.melist

class Item {
    String meliId
    String title
    String thumbnail
    BigDecimal price

    static hasMany = [contribution: Contribution]

    static constraints = {
        meliId blank: false, nullable: false
        title blank: false, nullable: false
        thumbnail blank: false, nullable: false
        price blank: false, nullable: false
        contribution blank: true
    }
}
