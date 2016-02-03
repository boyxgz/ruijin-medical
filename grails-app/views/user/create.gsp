<%@ page import="com.surelution.ruijin.User" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<style>
			.move{margin-left:320px;}
		</style>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="modal-header" style="height:20px; border:0px solid #000; text-align:center; font-size:20px; font-weight:bold;">新建用户</div>
			<g:form action="save" >
			<div class="modal-body" style="margin-top:30px;">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
			</div>
			<div class="modal-fonter">
				<fieldset class="buttons">
					<g:submitButton name="create" class="save move btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消" />
				</fieldset>
			</div>
			</g:form>
		</div>
	</body>
</html>
