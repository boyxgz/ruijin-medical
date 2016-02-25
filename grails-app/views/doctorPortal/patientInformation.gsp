<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
	</script>
	<style>
		.righttd{align:right;}
		.lefttd{align:left; width:=40%; height:40px;}
	</style>
</head>
<body>
<div class="modal-header" >患者：${patient?.name }</div>
<div class="modal-body">
<table>
	<tbody>
		<tr>
			<td class="lefttd" align="right"><label>性别：</label></td>
			<td class="righttd"><label><input type="text" value="${patient?.sex }" readonly/></label></td>
		</tr>
		<tr>
			<td class="lefttd"><label>关注时间：</label></td>
			<td class="righttd"><label><input type="text" value="<g:formatDate data="${patient?.dateCreated }" format="yyyy-MM-dd HH:mm"/>"/></label></td>
		</tr>
	</tbody>
</table>
	<dl class="dl-horizontal">
		<dt>
			<label><b>备注内容：</b></label>
		</dt>
		<dd><div class="col-xs-8">
			<textarea id="textarea" rows="5" style="width:300px;" onchange="changeTexArea()">${patient?.comment }</textarea>
			
		</div></dd>
	</dl>
</div>
<div class="modal-footer">
<g:form action="updateCom" id="${patient?.id }">
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
