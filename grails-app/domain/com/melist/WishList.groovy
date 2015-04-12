package com.melist

public class WishList {
    String name
    Date startDate
    Date endDate
    User user
    WishListType wishListType
    static hasMany = [items: Item, contributions: Contribution]

    static constraints = {
        name blank: false, nullable: false
        startDate blank: false, nullable: false
        endDate blank: false, nullable: false
        user blank: false, nullable: false
        wishListType blank: false, nullable: false
        items blank: true
        contributions blank: true
    }


    enum WishListType {
        CASAMIENTO, DONACION, CUMPLEANOS, VAQUITA
    }

    public def getTotalAmount() {
        BigDecimal totalAmount = new BigDecimal(0f)
        if(items && !items.isEmpty()){
            for ( item in items ) {
                totalAmount = totalAmount.add(item.getPrice())
            }
        }
        return totalAmount
    }

    public def getAmountArchived() {
        BigDecimal totalAmount = new BigDecimal(0f)
        if(contributions && !contributions.isEmpty()){
            for ( contribution in contributions ) {
                  totalAmount = totalAmount.add(contribution.amount)
            }
        }
        return totalAmount
    }

}
