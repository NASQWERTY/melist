package com.melist

public class User {

    long meliId
    String token
    String refreshToken

    static hasMany = [lists: WishList]

    static constraints = {
        meliId blank: false, nullable: false
        token blank: true, nullable: true
        refreshToken blank: true, nullable: true
        lists blank: true, nullable: true
    }
}
