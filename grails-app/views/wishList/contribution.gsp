<%@ page import="com.melist.WishList" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'wishList.label', default: 'WishList')}" />
	<title>Contribuir a la Lista</title>
</head>
<body>


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
				<span id="wishListType-label" class="property-label"><g:message code="wishList.wishListType.label" default="Tipo de Lista" /></span>

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
				<span id="wishListType-label" class="property-label"><g:message code="wishList.AmountArchived.label" default="Monto Logrado" /></span>

				<span class="property-value" aria-labelledby="wishListType-label">${wishListInstance.getAmountArchived()}</span>

			</li>

	</ol>

    <g:set var="contribution" value="${new com.melist.Contribution()}"/>
    <g:form url="[resource:contribution, action:'save']">
        <fieldset class="form">
            <g:hiddenField name="wishList" value="${wishListInstance.id}"/>
            <g:textField name="amount" required="true" value=""/>
        </fieldset>
        <fieldset>
            <!-- The user may not be the owner user -->
            <g:submitButton name="create" class="ch-btn" value="${message(code: 'contribute', default: 'Contribuir')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
