<%@ page import="com.melist.WishList" %>



<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="wishList.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${wishListInstance?.name}"/>
</div>

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

<g:hiddenField id="user" name="user.id" optionKey="id" required="" value="${wishListInstance?.user?.id}"/>

<div class="fieldcontain ${hasErrors(bean: wishListInstance, field: 'wishListType', 'error')} required">
	<label for="wishListType">
		<g:message code="wishList.wishListType.label" default="Wish List Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="wishListType" from="${com.melist.WishList$WishListType?.values()}" keys="${com.melist.WishList$WishListType.values()*.name()}" required="" value="${wishListInstance?.wishListType?.name()}" />

</div>

