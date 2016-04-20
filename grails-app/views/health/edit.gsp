<%@ page import="com.surelution.ruijin.Health" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'health.label', default: 'Health')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<g:form method="post" >
		<div class="modal-body">
			<g:hasErrors bean="${healthInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${healthInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:hiddenField name="id" value="${healthInstance?.id}" />
			<g:hiddenField name="version" value="${healthInstance?.version}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
		</div>
		<div class="modal-footer">
			<fieldset class="buttons">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<input type="button" class="btn btn-default" value="取消" data-dismiss="modal" />
			</fieldset>
		</div>
	</g:form>
	</body>
</html>
