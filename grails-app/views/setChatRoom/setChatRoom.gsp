<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>设置</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.min.css')}"/>
<script src="${resource(file:'js/jquery.min.js') }"></script>
<style>
	tr{line-height:50px;}
</style>

<script type="text/javascript">
function remindOnOff(trage){
	$.getJSON(trage);
	if($("#remind").val() == "开启"){
		$("#remind").val("关闭");
		$("#remind").removeClass("btn-Info");
		$("#remind").addClass("btn-Warning");
		$("#msg").val("关闭");
		$("#msg").removeClass("btn-Info");
		$("#msg").addClass("btn-Warning");
		$("#att").val("关闭");
		$("#att").removeClass("btn-Info");
		$("#att").addClass("btn-Warning")
	}else{
		$("#remind").val("开启");
		$("#remind").removeClass("btn-Warning");
		$("#remind").addClass("btn-Info");
		$("#msg").val("开启");
		$("#msg").removeClass("btn-Warning");
		$("#msg").addClass("btn-Info");
		$("#att").val("开启");
		$("#att").removeClass("btn-Warning");
		$("#att").addClass("btn-Info");
	}
}

function msgOnOff(trage){
	$.getJSON(trage);
	if($("#msg").val() == "开启"){
		$("#remind").val("关闭");
		$("#remind").removeClass("btn-Info");
		$("#remind").addClass("btn-Warning");
		$("#msg").val("关闭");
		$("#msg").removeClass("btn-Info");
		$("#msg").addClass("btn-Warning");
	}else{
		$("#msg").val("开启");
		$("#msg").removeClass("btn-Warning");
		$("#msg").addClass("btn-Info");
	}
}

function attOnOff(trage){
	$.getJSON(trage);
	if($("#att").val() == "开启"){
		$("#remind").val("关闭");
		$("#remind").removeClass("btn-Info");
		$("#remind").addClass("btn-Warning");
		$("#att").val("关闭");
		$("#att").removeClass("btn-Info");
		$("#att").addClass("btn-Warning");
	}else{
		$("#att").val("开启");
		$("#att").removeClass("btn-Warning");
		$("#att").addClass("btn-Info");
	}
}
</script>
</head>
<body>
	<div>
		<table style="width:60%; margin-left:20%;">
			<tr>
				<td>开启免打扰模式：</td>
				<td align="left">
				<g:if test="${doctor.remind == false}">
					<input class="btn btn-Info" id="remind" type="button" value="开启" onclick="remindOnOff('${createLink(controller:"setChatRoom",action:"remindOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="remind" type="button" value="关闭" onclick="remindOnOff('${createLink(controller:"setChatRoom",action:"remindOnOff")}')" />
				</g:else>
				</td>
			</tr>
			<tr>
				<td>消息提醒开关：</td>
				<td align="left">
				<g:if test="${doctor.msgRemind == false}">
					<input class="btn btn-Info" id="msg" type="button" value="开启" onclick="msgOnOff('${createLink(controller:"setChatRoom",action:"msgOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="msg" type="button" value="关闭" onclick="msgOnOff('${createLink(controller:"setChatRoom",action:"msgOnOff")}')" />
				</g:else>
				</td>
			</tr>
			<tr>
				<td>关注提醒开关：</td>
				<td align="left">
				<g:if test="${doctor.attRemind == false}">
					<input class="btn btn-Info" id="att" type="button" value="开启" onclick="attOnOff('${createLink(controller:"setChatRoom",action:"attOnOff")}')" />
				</g:if>
				<g:else>
					<input class="btn btn-Warning" id="att" type="button" value="关闭" onclick="attOnOff('${createLink(controller:"setChatRoom",action:"attOnOff")}')" />
				</g:else>
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>