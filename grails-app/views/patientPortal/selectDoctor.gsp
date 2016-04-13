<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>在线咨询</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<style>
	*{margin:0px; padding:0px; border:0px solid red;}
	body{background-color:#F0F0F0;height:70%; margin-bottom:200px;}
	.small-wid-td{width:90px;}
	.wid-td{width:110px;}
	.big-wid-td{width:190px;}
	.smal{border-buttom:1px solid red;}
	.hei-td{height:20px; color:#b2b2b2;}
</style>
<script>
window.onload = function(){
	//此处是为了将name="dp"的标签值的value设置为当前选中医生的
	var dpCheckBox = document.getElementById("dpCheckBox");
	var dpId = "checkBox_" + dpCheckBox.value;
	var check = document.getElementsByName(dpId);
	
 	var dp = document.getElementById("dp");
 	dp.value = dpCheckBox.value;
}

function changeBox(id){
	var checkBox = document.getElementById(id);
	var cheBox = document.getElementsByClassName("checkBox");
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

function confirm(){
	var dp = document.getElementById("dp");
	if(dp.value == ""){
		alert("您没有选中任何医生！！");
		return false
	}else{
		var	nameId = "docotorName_"+dp.value;
		var doctorName = document.getElementById(nameId);
		alert("您可以向"+doctorName.innerHTML+"咨询了！");
		return true;
	}
}
</script>
</head>
<body>
<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:50%;">
<div style="width:100%; height:20px;"></div>
<div class="center"style="border:0px solid red; width:98%; height:100%; margin-left:1%;">
<div style="margin-top:2px; margin-left:10%; font-size:22px; font-weight:bold; color:red;">
	<g:if test="${flash.message }">${flash.message }如有疑问请点击
		<a href="http://mp.weixin.qq.com/s?__biz=MzIwMzI1NjYwMQ==&mid=401723315&idx=1&sn=1ab2e2d01f9d1be0125918009208a1af#rd">
			使用说明
		</a>
	</g:if>
</div>
<g:if test="${isNull == false}">
<table style="width:100%; height:50px; ">
		<tr>
		<td align="center" >
			<input type="hidden" name="dpCheckBox" value="${dpCheckBox?.doctor?.id }" id="dpCheckBox" />
				<p style="margin-top:5px; width:160px; font-size:12px;">请选择其中一名专家进行咨询，如有疑问请点击
					<a href="http://mp.weixin.qq.com/s?__biz=MzIwMzI1NjYwMQ==&mid=401723315&idx=1&sn=1ab2e2d01f9d1be0125918009208a1af#rd">
						使用说明
					</a>
				</p>
		</td>
		<td>
		<g:form action="selectDoc" id="${dp?.id }"  onsubmit="return confirm();">
			<input type="hidden" name="dp" value="" id="dp">
			<g:if test="${ isNull != null}">
				<input type="submit" class="btn btn-default" value="确认" id="submit"/>
			</g:if>
		</g:form>
		</td>
	</tr>
</table>
</g:if>
<g:each in="${doctorpatient }" var="dp">
<g:link action="showDoctor" controller="introDoctor" id="${dp?.doctor?.id }">
<div style="background-color:#fff; border-radius:1em; margin-top:5px;">
	<table style="border-radius:1em;">
	<tr>
		<td rowspan="5" class="wid-td" align="center">
			<img src="${createLink(action:'showPic',id:dp?.doctor?.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:3px;"/>
		</td>
		<td class="big-wid-td">
			<strong class="name" id="docotorName_${dp?.doctor?.id}">${dp?.doctor?.name}</strong>&nbsp;&nbsp;<strong class="title"><small><small>${dp?.doctor?.title}</small></small></strong>
		</td>
		<td rowspan="3" class="small-wid-td" align="center">
		<g:if test="${dp?.doctorPrefered }">
			<input type="checkbox" class="checkBox" name="checkBox_${ dp?.doctor?.id}" ${dp?.patientPrefered?'checked':'' } onchange ="changeBox(this.id)" id="${dp?.doctor?.id }"/>
			<input type="hidden" name="dpId" id="dpId_${dp?.doctor?.id }" value="${dp?.id }"/>
		</g:if>
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
		<td align="center">
			<g:if test="${dp?.doctorPrefered}">
				可咨询
			</g:if>
			<g:else>
				待确认
			</g:else>
		</td>
	</tr>
	</table>
</div>
</g:link>
</g:each>
</div>
<div style="position:fixed; left:0; bottom:20px; width:100%; height:auto; z-index:100;"></div>
</body>
</html>