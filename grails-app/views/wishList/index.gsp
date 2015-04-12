<%@ page import="com.melist.WishList" %>
<!DOCTYPE html>
<html>
<script>
    function clearBox(elementID)
    {
        document.getElementById(elementID).innerHTML = "";
    }
    $("#cart_item").html("");
</script>
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
        <h2>Buscar Producto</h2>
        <g:formRemote name="myForm" on404="alert('not found!')" update="updateMe"
                      url="[controller: 'wishList', action:'search']">
            <input name="id" type="text" />
            <Button type="submit">Buscar</Button>
        </g:formRemote>
        <div id="updateMe"><g:render template="item_template"/></div>


        <h2>Favoritos</h2>
        <ul>
            <g:each in="${items}" status="index" var="item">
                <li id="bm${item.meliId}">
                <g:formRemote name="myForm" on404="alert('not found!')" update="itemsAdded"
                              url="[controller: 'wishList', action:'addItems']">
                    <g:img uri="${item.thumbnail}" ></g:img>
                    <h1>$${item.price}</h1>
                    <h1>${item.title}</h1>
                    <input type="hidden" name="itemId" value=${item.meliId}>
                    <input type="hidden" name="items" value=${items}>
                    <Button type="submit" onclick="clearBox('bm${item.meliId}')">Seleccionar</Button>
                </g:formRemote>
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
                    <div id="itemsAdded" >
                        <g:render template="add_items"/>
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
