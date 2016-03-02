<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
<head>
	<title>我的患者</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${resource(file:'css/bootstrap.min.css') }" ></link>
	<script src="${resource(file:'js/jquery.min.js') }"></script>
</head>
<style>
	*{margin:0; padding:0;}
	.img{height:60px; width:60px;}
	tr{height:50px;}
	table{width:100%;}
	td{border:1px solid red;}
	.font{font-size:16px; line-heght:20px; margin-top:10px;}
</style>
<body>
	<div>
		<table><g:each in="${dp }" var="pd"><g:link action="doctorPrefered" id="${pd.id }">
			<g:set var="ui" value="${UserInfo.loadUserInfo(pd?.patient?.subscriber?.openId) }"/>
			<tr><td style="border:1px solid red;">
				<div style="float:left;">
					<img src="${ui.headImgUrl }" class="img"/>
				</div>
				<div style="float:left; max-height:50px; margin-left:8px;">
					<p class="font">${ui.nickname }</p>
					<p class="font"><g:formatDate date="${pd?.dateCreated }" format="yyyy-MM-dd HH:mm:ss"/></p>
				</div>
				<div style="float:left; margin-left:8%; margin-top:20px;">
					<input type="button" id="${pd.id }" value="确认" class="btn btn-default" onclick="perfered('${createLink(controller:"doctorPortal",action:"perfered",id:pd.id)}',this)"/>
				</div>
			</td></tr>
		</g:link></g:each></table>
	</div>
	<script type="text/javascript">
	function perfered(t,id){
		$.getJSON(t);
		var th = document.getElementById(id);
		th.value = "成功";
	}
	</script>]
</body>
</html>
