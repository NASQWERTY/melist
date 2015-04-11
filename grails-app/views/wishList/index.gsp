
<%@ page import="com.melist.WishList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wishList.label', default: 'WishList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-wishList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-wishList" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'wishList.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'wishList.endDate.label', default: 'End Date')}" />
					
						<th><g:message code="wishList.user.label" default="User" /></th>
					
						<g:sortableColumn property="wishListType" title="${message(code: 'wishList.wishListType.label', default: 'Wish List Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wishListInstanceList}" status="i" var="wishListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wishListInstance.id}">${fieldValue(bean: wishListInstance, field: "startDate")}</g:link></td>
					
						<td><g:formatDate date="${wishListInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: wishListInstance, field: "user")}</td>
					
						<td>${fieldValue(bean: wishListInstance, field: "wishListType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wishListInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
