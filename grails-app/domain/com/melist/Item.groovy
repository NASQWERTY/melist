package com.melist

class Item {
    String meliId
    String name
    URL pictureURL
    BigDecimal price

    static hasMany = [contribution: Contribution]

    static constraints = {
        meliId blank: false, nullable: false
        name blank: false, nullable: false
        pictureURL blank: false, nullable: false
        price blank: false, nullable: false
        hasMany blank: true
    }
}
