
<%@ page import="com.surelution.ruijin.Schedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schedule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schedule">
			
				<g:if test="${scheduleInstance?.doctor}">
				<li class="fieldcontain">
					<span id="doctor-label" class="property-label"><g:message code="schedule.doctor.label" default="Doctor" /></span>
					
						<span class="property-value" aria-labelledby="doctor-label"><g:link controller="doctor" action="show" id="${scheduleInstance?.doctor?.id}">${scheduleInstance?.doctor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="schedule.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${scheduleInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.wokingTime}">
				<li class="fieldcontain">
					<span id="wokingTime-label" class="property-label"><g:message code="schedule.wokingTime.label" default="Woking Time" /></span>
					
						<span class="property-value" aria-labelledby="wokingTime-label"><g:formatDate date="${scheduleInstance?.wokingTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.wokingType}">
				<li class="fieldcontain">
					<span id="wokingType-label" class="property-label"><g:message code="schedule.wokingType.label" default="Woking Type" /></span>
					
						<span class="property-value" aria-labelledby="wokingType-label"><g:link controller="wokingType" action="show" id="${scheduleInstance?.wokingType?.id}">${scheduleInstance?.wokingType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${scheduleInstance?.id}" />
					<g:link class="edit" action="edit" id="${scheduleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
