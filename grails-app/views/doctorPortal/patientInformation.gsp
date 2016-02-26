<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
	</script>
	<style>
		.lefttd{align:left; width:=40%; height:40px;}
	</style>
</head>
<body>
<div class="modal-header" >
	<table>
		<tr>
			<td><h3>患者：${dp?.patient?.name }</h3></td>
			<td><g:link><input type="button" class="btn btn-default" value="阻止来消息"/></g:link></td>
		</tr>
	</table>
</div>
<div class="modal-body">
<table style="width:100%">
	<tbody>
		<tr>
			<td class="lefttd" align="right"><label>性别：</label></td>
			<td><label><input type="text" value="${dp?.patient?.sex }" readonly/></label></td>
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
			<td colspan="2" align="right"><textarea id="textarea" rows="5" style="width:300px;" onchange="changeTexArea()">${dp?.patient?.comment }</textarea></td>
		</tr>
	</tbody>
</table>
</div>
<div class="modal-footer">
<g:form action="updateCom" id="${dp?.patient?.id }">
<input type="hidden" value="" id="hidden" name="comment"/>
<input type="submit" id="btn" class="btn btn-default" value="提交"/>
</g:form>
</div>
<script>
function changeTexArea(){
	document.getElementById("hidden").value = document.getElementById("textarea").value;
	
}
</script>
</body>
</html>
