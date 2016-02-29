<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<div class="modal-header">
			<h3>新建组</h3>
		</div>
		<g:form action="save" >
		<div class="modal-body">
		<dl class="dl-horizontal">
			<dt>
				<label for="name">
				<g:message code="doctorGroup.name.label" default="Name" />
		        	<span class="required-indicator">*</span>
		        </label>
			</dt>
			<dd>
				<div class="col-xs-8">
					<g:textField name="name"/>
				</div>
			</dd>
		</dl>
		</div>
		<div class="modal-footer">
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
		</div>
		</g:form>
	</body>
</html>
