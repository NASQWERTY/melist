package com.melist

class Item {
    String meliId
    String name
    URL pictureURL
    BigDecimal price

    static hasMany = [contribution: Contribution]

    static constraints = {
    }
}
