<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<div class="modal-header" style="display:none;">
		<button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
		</div>
		<div class="modal-body" style="width:80%; height:80%; margin-top:10%; margin-left:10%;">
			<img style="width:100%; height:100%; margin-top:0; margin-left:0;" data-dismiss="modal" id="chatImage" src="${interation.message }" />
		</div>
		<div class="modal-footer" style="display:none;">
		</div>
	</body>
</html>
