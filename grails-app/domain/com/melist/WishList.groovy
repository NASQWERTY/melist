package com.melist

public class WishList {
    String name
    Date startDate
    Date endDate
    User user
    WishListType wishListType

    static hasMany = [items: Item]

    static constraints = {
        name blank: false, nullable: false
        startDate blank: false, nullable: false
        endDate blank: false, nullable: false
        user blank: false, nullable: false
        wishListType blank: false, nullable: false
        items blank: true
    }


    enum WishListType {
        MARRIAGE, CHARITY, BIRTHDAY
    }
}
