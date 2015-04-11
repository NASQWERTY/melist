package com.melist

public class WishList {
    Date startDate
    Date endDate
    User user
    WishListType wishListType

    static hasMany = [items: Item]

    static constraints = {
    }


    enum WishListType {
        MARRIAGE, CHARITY, BIRTHDAY
    }
}
