package com.melist

public class User {

    String meliId
    String accessToken
    String refreshToken
    String nickname

    static hasMany = [lists: WishList]

    static constraints = {
        meliId blank: false, nullable: false
        accessToken blank: true, nullable: true
        refreshToken blank: true, nullable: true
        lists blank: true, nullable: true
    }
}
