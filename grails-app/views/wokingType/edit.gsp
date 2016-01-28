<%@ page import="com.surelution.ruijin.WokingType" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'wokingType.label', default: 'WokingType')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	    <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">修改医生班次种类</h4>
        </div>
        <g:uploadForm action="update" method="post">
         <div class="modal-body">
				<g:hiddenField name="id" value="${wokingTypeInstance?.id}" />
				<g:hiddenField name="version" value="${wokingTypeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
		 </div>			
        <div class="modal-footer">
          <g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
     </g:uploadForm>
	</body>
</html>
