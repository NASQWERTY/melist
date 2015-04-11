package com.melist

public class WishList {
    Date startDate
    Date endDate
    User user
    List<Item> items
    WishListType wishListType


    static constraints = {
    }


    enum WishListType {
        MARRIAGE, CHARITY, BIRTHDAY
    }
}
