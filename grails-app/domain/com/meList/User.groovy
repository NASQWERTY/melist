package com.melist

public class User {

    long meliId

    static hasMany = [lists: WishList]

    static constraints = {
    }
}
