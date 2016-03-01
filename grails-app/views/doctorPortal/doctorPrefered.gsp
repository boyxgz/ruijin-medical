<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" ></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" ></meta>
	<title>信息备注</title>
	<link rel="stylesheet" type="text/css" href="${resource(file:'css/bootstrap.min.css') }" ></link>
	<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
	<script type="text/javascript">
	</script>
	<style>
		.lefttd{align:left; width:30%; height:40px;}
		tr{line-height:40px;}
	</style>
</head>
<body>
<div>
<g:form action="firstCom" id="${dp?.id }">
<table style="width:90%; margin-left:5%; ">
	<tbody>
		<tr style="line-height:50px;">
			<td class="lefttd" align="right"><label>姓名：</label></td>
			<td><label><input type="text" name="patientName" value="${dp?.patientName }" class="form-control"/></label></td>
		</tr>
		<tr style="line-height:50px;">
			<td class="lefttd" align="right"><label>性别：</label></td>
			<td>
				<g:if test="${dp?.patient?.sex == "Unknown" }">
				<label><g:select name="sex" from="${com.surelution.ruijin.Patient?.Sex?.values()}" 
					keys="${com.surelution.ruijin.Patient?.Sex?.values()*.name()}" class="form-control" style="width:185px;"/></label>
				</g:if>
				<g:else>
				<label><g:select name="sex" value="${dp?.patient?.sex.name() }" from="${com.surelution.ruijin.Patient.Sex.values()}" 
					keys="${com.surelution.ruijin.Patient.Sex.values()*.name()}" class="form-control" style="width:185px;;"/></label>
				</g:else>
			</td>
		</tr>
		<tr>
			<td class="lefttd" align="right"><label>关注时间：</label></td>
			<td><label><g:formatDate date="${dp?.dateCreated }" format="yyyy-MM-dd HH:mm"/></label></td>
		</tr>
		<tr>
			<td align="right" class="lefttd"><label>备注内容：</label></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<textarea id="textarea" rows="5" style="width:90%;"  class="form-control" onchange="changeTexArea()">${dp?.dTopComment }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="hidden" value="" id="hidden" name="comment"/>
				<input type="submit" id="btn" class="btn btn-default" value="提交" onclick="notarize()"/>
			</td>
		</tr>
	</tbody>
</table>
</g:form>
</div>
<div>

</div>
<script>
function changeTexArea(){
	document.getElementById("hidden").value = document.getElementById("textarea").value;
	
}

function notarize(){
	alert("确认提交");
}

window.onload = function(){
	changeTexArea();
}
</script>
</body>
</html>
