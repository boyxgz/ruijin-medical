<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>医生选择</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<style>
	*{margin:0px; padding:0px;}
	body{background-color:#F0F0F0;}
	.small-wid-td{width:90px;}
	.wid-td{width:110px;}
	.big-wid-td{width:190px;}
	.smal{border-buttom:1px solid red;}
	.hei-td{height:20px; color:#b2b2b2;}
</style>
<script>
window.onload = function(){
	var i = 0;
	if(i != 0){
		return;
	}
	
	i++;
	var dpCheckBox = document.getElementById("dpCheckBox");
	var dpId = "checkBox_" + dpCheckBox.value;
	var check = document.getElementsByName(dpId);
 	check[0].checked = true;
}

function changeBox(id){
	var checkBox = document.getElementById(id);
	checkBox.checked = false;
	var cheBox = document.getElementsByName("checkBox");
	for(var i=0; i<cheBox.length; i++){
		if(cheBox[i].id == id){
			cheBox[i].checked = true;
		}else{
			cheBox[i].checked = false;
		}
	}
	var dpId = "dpId_"+id;
	var dpIdGet = document.getElementById(dpId);
	var dpSend = document.getElementById("dp");
	dpSend.value = dpIdGet.value;
}
</script><%--

--%></head>
<body>
<input type="hidden" name="dpCheckBox" value="${dpCheckBox?.doctor?.id }" id="dpCheckBox">
<div style="height:90%;">
<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:190px;">
<div style="width:100%; height:20px;"></div>
<div class="center"style="border:0px solid red; width:98%; height:100%; margin-left:1%;">
<div style="margin-top:2px; margin-left:10%; font-size:22px; font-weight:bold; color:red;">
	<g:if test="${flash.message }">${flash.message }</g:if>
</div>
<div style="width:100%; height:50px; margin-left: 90%; margin-top: 6px;">
	<g:form action="selectDoc">
		<input type="hidden" name="dp" value="" id="dp">
		<input type="submit" class="btn btn-default" value="确认" />
	</g:form>
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
			<input type="checkbox" name="checkBox_${ dp?.doctor?.id}" onchange ="changeBox(this.id)" id="${dp?.doctor?.id }"/>
			<input type="hidden" name="dpId" id="dpId_${dp?.doctor?.id }" value="${dp?.id }"/>
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