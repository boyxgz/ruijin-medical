<%@ page import="com.surelution.ruijin.FollowMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'followMessage.label', default: 'FollowMessage')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="modal-hearde">
			<h3>编辑</h3>
		</div>
		<g:form method="post" >
		<div class="modal-body">
			<g:hiddenField name="id" value="${followMessageInstance?.id}" />
			<g:hiddenField name="version" value="${followMessageInstance?.version}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
		</div>
		<div class="modal-footer">
			<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
		</div>
		</g:form>
	</body>
</html>
