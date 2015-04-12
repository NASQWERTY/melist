<%@ page import="com.melist.WishList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wishList.label', default: 'WishList')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wishList" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wishList">
			
				<g:if test="${wishListInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="wishList.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wishListInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishListInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="wishList.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${wishListInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishListInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="wishList.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${wishListInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishListInstance?.wishListType}">
				<li class="fieldcontain">
					<span id="wishListType-label" class="property-label"><g:message code="wishList.wishListType.label" default="Wish List Type" /></span>
					
						<span class="property-value" aria-labelledby="wishListType-label"><g:fieldValue bean="${wishListInstance}" field="wishListType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishListInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="wishList.items.label" default="Items" /></span>
					
						<g:each in="${wishListInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:wishListInstance, action:'delete']" method="DELETE">
                <g:link class="ch-btn" action="edit" resource="${wishListInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="ch-btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</g:form>
		</div>
	</body>
</html>
