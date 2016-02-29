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
		.lefttd{align:left; width:25%; height:40px;}
		tr{line-height:50px;}
	</style>
</head>
<body>
<div>
<table style="width:90%; margin-left:5%;">
	<tbody>
		<tr>
			<td colspan="2"><h3>患者：${dp?.patient?.name }</h3></td>
		</tr>
		<tr>
			<td class="lefttd" align="right"><label>性别：</label></td>
			<td><label><input type="text" value="${dp?.patient?.sex }" class="form-control"/></label></td>
		</tr>
		<tr>
			<td class="lefttd" align="right"><label>电话：</label></td>
			<td>
				<g:if test="${false }">
					<label><a href="tel://${dp?.patient?.phoneNumb }">${dp?.patient?.phoneNumb }</a></label>
				</g:if>
				<g:else><label>
					<input type="text" name="phoneNumb" class="form-control" />
				</label></g:else>
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
			<td colspan="2" align="right"><textarea id="textarea" rows="5" style="width:90%;"  class="form-control" onchange="changeTexArea()">${dp?.patient?.comment }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<g:form action="updateCom" id="${dp?.id }">
					<input type="hidden" value="" id="hidden" name="comment"/>
					<input type="submit" id="btn" class="btn btn-default" value="提交"/>
				</g:form>
			</td>
		</tr>
	</tbody>
</table>
</div>
<div>

</div>
<script>
function changeTexArea(){
	document.getElementById("hidden").value = document.getElementById("textarea").value;
	
}
</script>
</body>
</html>
