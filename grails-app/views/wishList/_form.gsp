<%@ page import="com.melist.WishList" %>



<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="wishList.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${wishListInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="wishList.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${wishListInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="wishList.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.melist.User.list()}" optionKey="id" required="" value="${wishListInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'wishListType', 'error')} required">
	<label for="wishListType">
		<g:message code="wishList.wishListType.label" default="Wish List Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="wishListType" from="${com.melist.WishList$WishListType?.values()}" keys="${com.melist.WishList$WishListType.values()*.name()}" required="" value="${wishListInstance?.wishListType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="wishList.items.label" default="Items" />
		
	</label>
	<g:select name="items" from="${com.melist.Item.list()}" multiple="multiple" optionKey="id" size="5" value="${wishListInstance?.items*.id}" class="many-to-many"/>

</div>

