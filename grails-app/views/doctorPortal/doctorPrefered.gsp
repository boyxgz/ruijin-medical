<%@ page import="com.surelution.ruijin.Doctor" %>
<%@page import="com.surelution.whistle.push.UserInfo"%>
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
		.lefttd{align:left; width:32%; height:40px;}
		.font{font-weight:bold; font-size:18px;}
		tr{line-height:50px;}
		td{border-bottom: 1px solid #d7d7d7;}
	</style>
</head>
<body style="background-color:#d4d4d4;">
<g:form action="firstCom" id="${dp?.id }">
<div style="background-color:#fff; margin-top:20px;">
<table style="width:100%;">
	<tbody>
		<tr>
			<td class="lefttd font" align="right">微信昵称：</td>
			<td class="font">${UserInfo.loadUserInfo(dp?.patient?.subscriber?.openId).nickname }</td>
		</tr>
		<tr>
			<td class="lefttd font" align="right">姓名：</td>
			<td><label><input type="text" name="patientName" value="${dp?.patientName }" class="form-control"/></label></td>
		</tr>
		<tr>
			<td class="lefttd font" align="right">性别：</td>
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
			<td class="lefttd font" align="right" style="font-weight:bold; font-size:18px;">关注时间：</td>
			<td style="font-size:18px;">&nbsp;&nbsp;<g:formatDate date="${dp?.dateCreated }" format="yyyy-MM-dd HH:mm"/></td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#d7d7d7; height:20px;"></td>
		</tr>
		<tr>
			<td align="right" class="lefttd font" style=" border-bottom: 0px solid #d7d7d7;">备注内容：</td>
			<td style="border-bottom: 0px solid #d7d7d7;"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" style="border-bottom: 0px solid #d7d7d7;">
				<textarea id="textarea" rows="5" style="width:90%;"  class="form-control" onchange="changeTexArea()">${dp?.dTopComment }</textarea>
			</td>
		</tr>
	</tbody>
</table>
<div style="height:10px;"></div>
</div>
<input type="submit" id="btn" class="btn btn-info" value="提交" onclick="notarize()" style="width:90%; margin-left:5%; margin-top:15px; "/>
<input type="hidden" value="" id="hidden" name="comment"/>
</g:form>
<div style="height:20px;"></div>
<script>
function changeTexArea(){
	document.getElementById("hidden").value = document.getElementById("textarea").value;
	
}

function notarize(){
	alert("提交成功");
}

window.onload = function(){
	changeTexArea();
}
</script>
</body>
</html>
