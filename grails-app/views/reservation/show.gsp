
<%@ page import="com.surelution.ruijin.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reservation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.endReservation}">
				<li class="fieldcontain">
					<span id="endReservation-label" class="property-label"><g:message code="reservation.endReservation.label" default="End Reservation" /></span>
					
						<span class="property-value" aria-labelledby="endReservation-label"><g:formatDate date="${reservationInstance?.endReservation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="reservation.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${reservationInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationNum}">
				<li class="fieldcontain">
					<span id="reservationNum-label" class="property-label"><g:message code="reservation.reservationNum.label" default="Reservation Num" /></span>
					
						<span class="property-value" aria-labelledby="reservationNum-label"><g:fieldValue bean="${reservationInstance}" field="reservationNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationTime}">
				<li class="fieldcontain">
					<span id="reservationTime-label" class="property-label"><g:message code="reservation.reservationTime.label" default="Reservation Time" /></span>
					
						<span class="property-value" aria-labelledby="reservationTime-label"><g:formatDate date="${reservationInstance?.reservationTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.schedule}">
				<li class="fieldcontain">
					<span id="schedule-label" class="property-label"><g:message code="reservation.schedule.label" default="Schedule" /></span>
					
						<span class="property-value" aria-labelledby="schedule-label"><g:link controller="schedule" action="show" id="${reservationInstance?.schedule?.id}">${reservationInstance?.schedule?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservationInstance?.id}" />
					<g:link class="edit" action="edit" id="${reservationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
