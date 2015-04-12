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
			<h1>
				<g:if test="${wishListInstance?.name}">
					<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wishListInstance}" field="name"/></span>
				</g:if>
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wishList">

				<g:if test="${wishListInstance?.startDate}">
					<li class="fieldcontain">
						<span id="startDate-label" class="property-label"><g:message code="wishList.startDate.label" default="Fecha de Inicio" /></span>

						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${wishListInstance?.startDate}" /></span>

					</li>
				</g:if>

				<g:if test="${wishListInstance?.endDate}">
					<li class="fieldcontain">
						<span id="endDate-label" class="property-label"><g:message code="wishList.endDate.label" default="Fecha de Finalizacion" /></span>

						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${wishListInstance?.endDate}" /></span>

					</li>
				</g:if>
			
				<g:if test="${wishListInstance?.wishListType}">
				<li class="fieldcontain">
					<span id="wishListType-label" class="property-label"><g:message code="wishList.wishListType.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="wishListType-label"><g:fieldValue bean="${wishListInstance}" field="wishListType"/></span>
					
				</li>
				</g:if>

				<div role="complementary" class="ch-box panelItems">
					<h2>Items:</h2>
					<br/>
					<g:if test="${wishListInstance?.items}">
						<ul>
							<g:each in="${wishListInstance?.items}" status="index" var="item">
								<li>
									<g:img uri="${item.thumbnail}" ></g:img>
									<a href="${item.link}">${item.title}</a>
								</li>
							</g:each>
						</ul>
					</g:if>
				</div>

                <li class="fieldcontain">
                    <span id="wishListType-label" class="property-label"><g:message code="wishList.TotalAmount.label" default="Monto a Alcanzar" /></span>

                    <span class="property-value" aria-labelledby="wishListType-label">${wishListInstance.getTotalAmount()}</span>

                </li>

                <li class="fieldcontain">
                    <span id="wishListType-label" class="property-label"><g:message code="wishList.AmountArchived.label" default="Monto Logrado" /></span>

                    <span class="property-value" aria-labelledby="wishListType-label">${wishListInstance.getAmountArchived()}</span>

                </li>
			
			</ol>
            <g:message code="wishlist.share" default="Share"/><g:link controller="wishList" action="contribution" id="${wishListInstance.id}">Link</g:link>
			<g:form url="[resource:wishListInstance, action:'delete']" method="DELETE">
                <g:link class="ch-btn" action="edit" resource="${wishListInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="ch-btn" action="delete" value="${message(code: 'default.button.FinishList.label', default: 'TerminarLista')}" onclick="return confirm('${message(code: 'default.button.terminarlista.confirm.message', default: 'Estas seguro que deseas terminar la Lista?')}');" />
			</g:form>
		</div>
	</body>
</html>
