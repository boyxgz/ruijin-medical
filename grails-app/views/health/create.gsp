<%@ page import="com.surelution.ruijin.Health" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'health.label', default: 'Health')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">新建</h4>
	</div>
	<g:form action="save" >
		<div class="modal-body">
			<g:hasErrors bean="${healthInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${healthInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
		</div>
	
		<div class="modal-footer">
			<g:submitButton name="create" class="btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			<input type="button" class="btn btn-default" data-dismiss="modal" value="取消" />
		</div>
	</g:form>
	</body>
</html>
