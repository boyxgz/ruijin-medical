<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人资料</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${resource(dir:'js',file:'bootstrap.min.js') }"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.min.js') }"></script>
<style>
	*{margin:0; padding:0;}
	body{background-color:#F0F0F0;}
	.winput{width:100%;}
	.wtd{width:120px;}
	tr{line-height:50px;}
</style>
</head>
<body>
<div>
<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:30%;">
<div style="width:100%; height:20px;"></div>
<div style="border:0px solid #000; width:84%; margin-left:0%;">
	<g:form action="">
	<table style="border:0px solid red; width:110%;">
	<tr>
		<td class="text-right wtd">姓名&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="name"  value="${patient?.name }" readonly/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">年龄&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="dateOfBirth"  
				value="<g:formatDate date="${patient?.dateOfBirth }" format="yyyy-MM-dd"/>" readonly/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">性别&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="sex" value="${patient?.sex }" readonly/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">联系方式&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="phoneNumb" value="${patient.phoneNumb }" readonly/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">身份证号&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="iDcard" value="${patient.iDcard }" readonly/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="right"><a href="${createLink(action:'registers') }">
			<input type="button" class="btn btn-default" value="编辑"/>
		</a></td>
	</tr>
	</table>
	</g:form>
</div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
  <div style="widht:100%; height:5px;"></div>
  <table style="width:100%; height:15px;">
  <tr>
  	<td class="text-center">
  		<g:link action="personalCenter">个人中心</g:link><!-- 如何关注微信 -->
  	</td>
  	  	<td class="text-center">
  		<g:link action="doctorList" controller="Chat">医生列表</g:link>
  	</td>
  </tr>
  </table>
  <div style="widht:100%; height:5px;"></div>
  </div>
</nav>
</body>
</html>

<!-- 
只有屏幕大于768px的时候，添加类名“.dl-horizontal”才具有水平定义列表效果。其实现主要方式：
1、将dt设置了一个左浮动，并且设置了一个宽度为160px
2、将dd设置一个margin-left的值为180px，达到水平的效果
3、当标题宽度超过160px时，将会显示三个省略号 -->