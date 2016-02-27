
<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appVar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appVar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appVar">
			
				<g:if test="${appVarInstance?.key}">
				<li class="fieldcontain">
					<span id="key-label" class="property-label"><g:message code="appVar.key.label" default="Key" /></span>
					
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${appVarInstance}" field="key"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appVarInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="appVar.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${appVarInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appVarInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="appVar.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${appVarInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${appVarInstance?.id}" />
					<g:link class="edit" action="edit" id="${appVarInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
