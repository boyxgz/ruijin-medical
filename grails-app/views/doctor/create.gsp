<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript">
		$("#document").ready(function(){
			
			$("#sub").prop('disabled',true);
			
			$('#name').change(function(){
				if($('#name').val() != '' && $('#doctorPic').val() != '' ){
					$("#sub").prop('disabled',false);
				}
			});
			$('#doctorPic').change(function(){
				if($('#name').val() != '' && $('#doctorPic').val() != '' ){
					$("#sub").prop('disabled',false);
				}
			});
			
		});
		</script>
	</head>
	<body>
	     <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">新建医生</h4>
        </div>
        <g:uploadForm action="save" method="post">
        
         <div class="modal-body">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>	
				
				<dl class="dl-horizontal">
				<dt>
					<label for="image"> <g:message code="doctor.image.label"
							default="image" />
					</label>
					<span class="required-indicator">*</span>
				</dt>
				<dd>
					<div class="col-xs-8">
						<input type="file" id="doctorPic" name="doctorPic" class="form-control" required=""/>
					</div>
				</dd>
			</dl>
			<p style="margin-left:30%; color:red; font-weight:bold;">温馨提示：星号标记为必填！</p>
		</div>			
        <div class="modal-footer">
          <g:submitButton name="create" id="sub" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
     </g:uploadForm>
	</body>
</html>
