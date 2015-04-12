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
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li
			</ul>
		</div>

    <div role="complementary" class="ch-box panelItems">
        <h2>Buscar Productos</h2>
        <g:formRemote name="myForm" on404="alert('not found!')" update="updateMe"
                      url="[controller: 'wishList', action:'search']">
            <input name="id" type="text" />
            <button type="submit" class="ch-btn-skin ch-btn-small">Buscar</button>
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
                    <button type="submit" onclick="clearBox('bm${item.meliId}')" class="ch-btn">Seleccionar</button>
                </g:formRemote>
                </li>
            </g:each>
        </ul>
    </div>




    <div id="list-wishList" class="content scaffold-list" role="main" >
			<h1>Lista de Deseos</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
        <div id="itemsAdded" style="float: left; width: 60%" >
            <g:render template="add_items"/>
        </div>
        <div style="float: right">
            <g:form url="[action:'save']">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset>
                    <g:submitButton name="create" class="ch-btn" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>

		</div>
	</body>
</html>
