package com.melist

public class User {

    long meliId

    static hasMany = [lists: WishList]

    static constraints = {
        meliId blank: false, nullable: false
        lists blank: true, nullable: true
    }
}
