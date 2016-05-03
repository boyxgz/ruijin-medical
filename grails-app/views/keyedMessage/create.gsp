<%@ page import="com.surelution.ruijin.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<style type="text/css">
		</style>
	</head>
	<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title"><g:message code="default.new.label" default="New"/></h4>
	</div>
	<g:form action="save" >
		<div class="modal-body">
			<g:hasErrors bean="${keyedMessageInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${keyedMessageInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<table style="line-height: 50px; margin-left:70px;">
				<tr>
					<td align="right"><g:message code="keyedMessage.key.label" default="Key" />&nbsp;&nbsp;&nbsp;</td>
					<td align="left"><g:textField class="form-control" name="key" value="${keyedMessageInstance?.key}"/></td>
				</tr>
				<tr>
					<td align="right"><g:message code="keyedMessage.description.label" default="Description" />&nbsp;&nbsp;&nbsp;</td>
					<td align="left"><g:textField class="form-control" name="description" value="${keyedMessageInstance?.description}"/></td>
				</tr>
				<tr>
					<td align="right"><g:message code="keyedMessage.message.label" default="Message" />&nbsp;&nbsp;&nbsp;</td>
					<td align="left"><textarea style="height:97px; width:270px; " class="form-control" name="message">${keyedMessageInstance?.message}</textarea></td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<fieldset class="buttons">
				<g:submitButton name="save" class="btn btn-default " value="${message(code: 'default.button.create.label', default: 'Create')}" />
				<input type="button" class="btn btn-default" value="取消" data-dismiss="modal" />
			</fieldset>
		</div>
	</g:form>
	</body>
</html>
