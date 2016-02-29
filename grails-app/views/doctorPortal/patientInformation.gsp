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
	<table style="width:100%">
		<tr>
			<td><h3>患者：${dp?.patient?.name }</h3></td>
			<td align="right">
				<g:if test="${dp.doctorPrefered }">
				<g:link action="chatOnOff" id="${dp.id }" class="btn btn-default">阻止接收消息</g:link>
				</g:if>
				<g:else>
				<g:link action="chatOnOff" id="${dp.id }" class="btn btn-default">接收消息</g:link>
				</g:else>
			</td>
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
			<td class="lefttd" align="right"><label>电话：</label></td>
			<td><label><a href="tel://${dp?.patient?.phoneNumb }">${dp?.patient?.phoneNumb }</a></label></td>
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
			<td colspan="2" align="right"><textarea id="textarea" rows="5" style="width:90%;" onchange="changeTexArea()">${dp?.patient?.comment }</textarea></td>
		</tr>
	</tbody>
</table>
</div>
<div class="modal-footer">
<g:form action="updateCom" id="${dp?.id }">
<input type="hidden" value="" id="hidden" name="comment"/>
<input type="submit" id="btn" class="btn btn-default" value="提交"/>
 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
</g:form>
</div>
<script>
function changeTexArea(){
	document.getElementById("hidden").value = document.getElementById("textarea").value;
	
}
</script>
</body>
</html>
