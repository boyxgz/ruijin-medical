<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="modal-header">
			<h3>新建全局变量</h3>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
		<g:form action="save" >
		<div class="modal-body">
			<g:hasErrors bean="${appVarInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${appVarInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
		</div>
		<div class="modal-footer">
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
		</div>
		</g:form>
	</body>
</html>
