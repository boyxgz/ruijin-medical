<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人中心</title>
<%--<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>--%>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<style>
	*{margin:0px; padding:0px;}
	body{background-color:#F0F0F0;}
	.wh{width:30%; height:20%; border:3px solid #aaa; background-color:#fff; margin:8%; float:left; border-radius:1em;}
	.imgwh{width:50px; height:40px;}
	.font{font-weight:bold;}
</style>
</head>
<body>
<div style="height:90%;">
<div>
	<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:190px;">
	<ul style="margin-top:10px; margin-left:6%;">
		<li class="wh">
			<div>
			<g:link action="information" id="">
			<img src="${resource(dir:'images',file:'home1.png') }" class="center-block">
			<p class="text-center font">个人资料</p>
			</g:link>
			</div>
		</li>
		<li class="wh">
			<div>
			<g:link action="oneselfRegistration" id="">
			<img src="${resource(dir:'images',file:'pingzi1.png') }" class="center-block">
			<p class="text-center font">我的预约</p>
			</g:link>
			</div>
		</li>
	</ul>
</div>
<div class="wh" style="margin-top:1px; margin-left:33%;">
	<g:link action="oneselfConcern">
	<img src="${resource(dir:'images',file:'doctor1.png') }" class="center-block">
	<p class="text-center font">我的关注</p>
	</g:link>
</div>
<div style="width:100%; height:120px;"></div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
  <div style="widht:100%; height:10px;"></div>
  <table style="width:100%; height:15px;">
  <tr>
  	<td class="text-center">
  		<g:link>关注此微信</g:link><!-- 如何关注微信 -->
  	</td>
  	<td class="text-center">
  		<g:link><span></span>推荐给朋友</g:link><!-- 转发的实现 -->
  	</td>
  </tr>
  </table>
  </div>
</nav>
</body>
</html>