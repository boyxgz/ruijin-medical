<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>设置</title>

<link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.min.css')}"/>
<link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap-switch.css')}"/>
<script src="${resource(file:'js/jquery.min.js') }"></script>
<script src="${resource(file:'js/bootstrap-switch.min.js') }"></script>
<style>
	tr{line-height:50px;}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#remind").bootstrapSwitch();
	$("#msg").bootstrapSwitch();
	$("#att").bootstrapSwitch();
})

function config(type, value) {
	if(value == true){
		var i = 1;
	}else if(value == false){
		i = 0;
	}
	var url = '${createLink(controller:'setChatRoom', action:'onOff')}?type=' + type + '&value=' + i;
	document.location.href = url;
}
</script>
</head>
<body>
	<div>
		<table style="width:60%; margin-left:20%;">
			<tr>
				<td>免打扰模式：</td>
				<td align="left">
				<div class="switch" data-on="primary" data-off="info">
				    <input type="checkbox" name="remind" id="remind" onchange="config('remind', ${!doctor?.remind })" <g:if test="${doctor.msgRemind && doctor.attRemind}">checked</g:if> />
				</div>
				<%--<g:if test="${doctor.remind == false}">
					<input class="btn btn-Info" id="remind" type="button" value="开启" onclick="remindOnOff('${createLink(controller:"setChatRoom",action:"remindOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="remind" type="button" value="关闭" onclick="remindOnOff('${createLink(controller:"setChatRoom",action:"remindOnOff")}')" />
				</g:else>--%>
				</td>
			</tr>
			<tr>
				<td>消息提醒开关：</td>
				<td align="left">
				<div class="switch" data-on="primary" data-off="info">
				    <input type="checkbox"  name="msg" id="msg" onchange="config('msg', ${!doctor?.msgRemind })" <g:if test="${doctor.msgRemind}">checked</g:if> />
				</div>
				<%--<g:if test="${doctor.msgRemind == false}">
					<input class="btn btn-Info" id="msg" type="button" value="开启" onclick="msgOnOff('${createLink(controller:"setChatRoom",action:"msgOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="msg" type="button" value="关闭" onclick="msgOnOff('${createLink(controller:"setChatRoom",action:"msgOnOff")}')" />
				</g:else>--%>
				</td>
			</tr>
			<tr>
				<td>关注提醒开关：</td>
				<td align="left">
				<div class="switch" data-on="primary" data-off="info">
				    <input type="checkbox"  name="att" id="att" onchange="config('att', ${!doctor?.attRemind })" <g:if test="${doctor?.attRemind }">checked</g:if> />
				</div>
				<%--<g:if test="${doctor.attRemind == false}">
					<input class="btn btn-Info" id="att" type="button" value="开启" onclick="attOnOff('${createLink(controller:"setChatRoom",action:"attOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="att" type="button" value="关闭" onclick="attOnOff('${createLink(controller:"setChatRoom",action:"attOnOff")}')" />
				</g:else>--%>
				</td>
			</tr>
		</table>
		<div style="width:80%; margin-left:10%; margin-top:50px;">
			<p>说明：您目前的身份是瑞金医院的${doctor?.name }，可以点击菜单网上诊室跟用户进行聊天。</p>
			<p>上方三个按钮用于控制是否接收微信消息通知提醒。</p>
		</div>
		
	</div>
</body>
</html>