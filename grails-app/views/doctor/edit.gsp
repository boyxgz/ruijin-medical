<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	  	<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">修改医生信息</h4>
        </div>
        <g:uploadForm action="update" method="post">
         <div class="modal-body">
				<g:hiddenField name="id" value="${doctorInstance?.id}" />
				<g:hiddenField name="version" value="${doctorInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				
				<dl class="dl-horizontal">
				<dt>
					<label for="image"> <g:message code="doctor.image.label"
							default="image" />
					</label>
				</dt>
				<dd>
					<div class="col-xs-8">
						<input type="file" name="doctorPic" class="form-control"/>
					</div>
				</dd>
			</dl>
		</div>			
        <div class="modal-footer">
        <g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
     </g:uploadForm>
	</body>
</html>
