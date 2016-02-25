<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>我的关注</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<style>
	*{margin:0px; padding:0px;}
	body{background-color:#F0F0F0; height:70%; margin-bottom:200px;}
	.small-wid-td{width:90px;}
	.wid-td{width:110px;}
	.big-wid-td{width:190px;}
	.smal{border-buttom:1px solid red;}
	.hei-td{height:20px; color:#b2b2b2;}
</style>
</head>
<body>
<div>
	<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:190px;">
	<div style="width:100%; height:20px; border:1px solid red;"></div>
	<div class="center"style="border:0px solid red; width:98%; height:100%; margin-left:1%;">
		<div style="margin-top:2px; margin-left:10%; font-size:22px; font-weight:bold; color:red;">
			<g:if test="${flash.message }">${flash.message }</g:if>
		</div>
		<g:each in="${doctorpatient }" var="dp">
			<div style="background-color:#fff; border-radius:1em; margin-top:5px;">
				<table style="border-radius:1em;">
					<tr>
						<td rowspan="5" class="wid-td" align="center">
							<img src="${createLink(action:'showPic',controller:'Patient',id:dp?.doctor?.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:3px;"/>
						</td>
						<td class="big-wid-td">
							<strong class="name">${dp?.doctor?.name}</strong>&nbsp;&nbsp;<strong class="title"><small><small>${dp?.doctor?.title}</small></small></strong>
						</td>
						<td rowspan="3" class="small-wid-td" align="center">
						<g:form action="isFocusAc">
							<input type="hidden" name="dp" value="${dp.id }">
							<input type="submit" class="btn btn-default" value="取消关注" />
						</g:form>
						</td>
					</tr>
					<tr>
						<td  class="font_style hei-td">
							<small><small>预约量：${dp?.doctor?.reservations }</small></small>
						</td>
					</tr>
					<tr>
						<td class="hei-td">
							<g:if test="${dp?.doctor?.skills.length() < 7 }">
								<small><small>擅长领域：${dp?.doctor?.skills}</small></small>
							</g:if>
							<g:else>
								<small><small>擅长领域：${dp?.doctor?.skills.substring(0,7)}...</small></small>
							</g:else>
						</td>
					</tr>
					<tr>
						<td  class="hei-td">
							<small><small>关注时间：<g:formatDate date="${dp?.dateCreated }" format="yyyy.MM.dd HH:mm"/></small></small>
						</td>
						<td align="right"></td>
					</tr>
				</table>
			</div>
		</g:each>
	</div>
</div>
</body>
</html>