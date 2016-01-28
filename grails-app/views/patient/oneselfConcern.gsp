<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人中心</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<style>
	*{margin:0px; padding:0px;}
	body{background-color:#F0F0F0;}
	.small-wid-td{width:90px;}
	.wid-td{width:90px;}
	.big-wid-td{width:190px;}
</style>
</head>
<body>
<div style="height:90%;">
<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:190px;">
<div style="width:100%; height:20px;"></div>
<div class="center"style="border:0px solid red; width:96%; height:100%; margin-left:2%;">


<g:each in="${doctorpatient}" var="doctorpatient">
      <a href="${createLink(action:'showDoctor',controller:'introDoctor',id:doctor.id)}">
		<div class="content">
      <div class="content_left"><img src="${createLink(action:'showPic',controller:'introDoctor',id:doctor.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:10px;margin-left:10px;"/></div>
      <div class="content_right">
          <div class="cr">
               <div style="width: 75%; float: left;"><strong class="name">${}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="title">${doctor.title }</strong></div>
               <div style="width: 20%; float: left; margin-top:5px;" class="btn btn-success btn-xs">有号</div>
          </div>
       <div class="cr"><span class="font_style">接诊量:${}</span></div>
       <div class="cr"><span class="font_style">擅长： ${}...</span></div>
	</div>
	</div>
	</a>
</g:each>


<%--<table style="background-color:#fff; border-bottom:1px solid #F2F2F2; border-radius:1em;">
<tr>
	<td rowspan="4" class="wid-td" align="center">
		<img src="${resource(dir:'images',file:'hospital.jpg')}" class="img-rounded" style="width: 80px; height:80px; margin-top:3px;"/>
	</td>
	<td class="big-wid-td">专家：${doctorpatient?.doctor?.name}</td>
	<td rowspan="2" align="center" class="small-wid-td"></td>
</tr>
<tr>
	<td>预约量：${doctorpatient?.doctor?.reservations }</td>
</tr>
<tr>
	<td>擅长领域：${doctorpatient?.doctor?.skills }</td>
	<td rowspan="2" class="small-wid-td" align="left"><input type="submit" class="btn btn-default" value="取消关注" /></td>
</tr>
<tr>
	<td>关注时间：${doctorpatient?.dateCreated }</td>
</tr>
</table>
--%>


</div>
</div>
</body>
</html>