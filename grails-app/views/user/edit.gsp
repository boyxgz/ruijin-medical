<%@ page import="com.surelution.ruijin.User" %>
<!DOCTYPE html>
<html>
<head>
<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<script src="${resource(dir:'js',file:'bootstrap.js') }"></script>
<style>
	.move{margin-left:320px;}
</style>	
</head>

<body>
	<div class="modal-header" style="height:20px; border:0px solid #000; text-align:center; font-size:20px; font-weight:bold;">用户编辑</div>
	
	<g:form method="post" >
	<div class="modal-body" style="margin-top:30px;">
	
		<g:hiddenField name="id" value="${userInstance?.id}" />
		<g:hiddenField name="version" value="${userInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<br>
	</div>
	<div class="modal-footer">
	<fieldset class="buttons">
		<g:actionSubmit class="save move btn btn-default" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
			
		<input type="button" class="btn btn-default" data-dismiss="modal" value="取消" />
		 
		</fieldset>
	</div>
	
	</g:form>

</body>
</html>
