<%@ page import="com.melist.WishList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wishList.label', default: 'WishList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

    <div role="complementary" class="ch-box panelItems">
        <h2>Items</h2>
        <g:textField name="searchItem" value="" placeholder="Buscar Item"/>
        <a href="" class="ch-btn ch-btn-small ch-btn-skin ch-icon-search"></a>
        <ul>
            <g:each in="${items}" status="index" var="item">
                <li>
                    <g:remoteLink controller="wishList" action="addItems" params="[itemId: item.meliId, items: items]" update="[success:'itemsAdded',failure:'error']">
                        <g:img uri="${item.thumbnail}" ></g:img>
                        ${item.title}
                        %{--<g:checkBox name="check-item-${item.id}" />--}%
                    </g:remoteLink>
                </li>
            </g:each>
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
					
						<g:sortableColumn property="wishListType" title="${message(code: 'wishList.wishListType.label', default: 'Wish List Type')}" />

					</tr>
				</thead>
				<tbody>
                    <div id="itemsAdded" class="ch-box panelItems">
                        <g:render template="addItems"/>
                    </div>
				<g:each in="${wishListInstanceList}" status="i" var="wishListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${wishListInstance.id}">${fieldValue(bean: wishListInstance, field: "startDate")}</g:link></td>
					
						<td><g:formatDate date="${wishListInstance.endDate}" /></td>
					
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
