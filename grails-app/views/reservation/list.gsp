
<%@ page import="com.surelution.ruijin.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="endReservation" title="${message(code: 'reservation.endReservation.label', default: 'End Reservation')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'reservation.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="reservationNum" title="${message(code: 'reservation.reservationNum.label', default: 'Reservation Num')}" />
					
						<g:sortableColumn property="reservationTime" title="${message(code: 'reservation.reservationTime.label', default: 'Reservation Time')}" />
					
						<th><g:message code="reservation.schedule.label" default="Schedule" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "endReservation")}</g:link></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationNum")}</td>
					
						<td><g:formatDate date="${reservationInstance.reservationTime}" /></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "schedule")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
