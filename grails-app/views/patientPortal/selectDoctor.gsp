<%@page import="com.surelution.ruijin.KeyedMessage"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>在线咨询</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<wx:registerJsapi apiList="'onMenuShareTimeline','onMenuShareAppMessage'"/>
<style>
	*{margin:0px; padding:0px; border:0px solid red;}
	body{background-color:#E8EBF0;height:70%; margin-bottom:200px;}
	.small-wid-td{width:90px;}
	.wid-td{width:110px;}
	.big-wid-td{width:190px;}
	.smal{border-buttom:1px solid red;}
	.hei-td{height:20px; color:#b2b2b2;}
	.text-content{
	    margin-top: 10px;
	    width: 98%;
	    margin-left: 3%;
	    font-size:20px;
	    font-weight:bold;
	}
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
	document.getElementsByName("formDoctor")[0].submit()
	return true
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
function close(){
	wx.ready(function(){
		wx.closeWindow();
	})
}

</script>
</head>
<body>
<%--<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:50%;">--%>
	<div class="center" style="border:0px solid red; width:98%; height:100%; margin-left:1%;">
		<g:if test="${isNull == true }">
			<div class="text-content">
				<div style="width:92%; margin-left:4%;">
					<p style="background-color:#d5d5d5;  font-weight:bold; font-size:16px; line-height:30px; color:#000;">&nbsp;&nbsp;&nbsp;友情提示</p>
					<div style="background-color:#fff; margin-top:-10px;">
						<div style="width:96%; margin-left:3%; font-size:16px;">
							<br>
							<p>${KeyedMessage.findByKey("selectDoctor-zero").message }</p>
							<br>
						</div>
					</div>
				</div>	
			</div>
		</g:if>
		<g:else>
			<div>
				<%--<p style="font-weight:bold; font-size:18px;  color:#fff; background-color:#1F629C;" align="center"></p>--%>
				<div style="margin-top:0px; border:0px solid red; width:92%; margin-left:4%;">
					<p style="position:relative; top:60px; width:50%; left:5%; font-size:16px; font-weight:bold;"><%--你目前正在和${dpCheckBox?.doctor?.name }医生进行互动。</p>--%></p>
					<img src="${resource(file:'images/aa.jpg') }" style="width:100px; height:100px; position:relative; left:65%; " />
					<%--<div style="border:0px solid red; width:50%; margin-top:-50px; margin-left:5%; font-weight:bold;">
						<g:if test="${doctorpatient.size() > 0 }">
							您目前关注多名医生，点击选择框选择向哪位医生进行咨询
						</g:if>
					</div>--%>
				</div>
				<div style="height:10px;"></div>
				<div>
					<div style="width:92%; margin-left:4%;">
						<p style="background-color:#d5d5d5;  font-weight:bold; font-size:16px; line-height:30px; color:#000;">&nbsp;&nbsp;&nbsp;使用指南</p>
						<div style="background-color:#fff; margin-top:-10px;">
							<div style="width:96%; margin-left:3%; font-size:16px;">
								<p>1、请<span><a href="javascript:close()" >关闭当前页面</a></span>返回微信号。</p>
								<p>2、点击图片中箭头所指按钮，切到输入模式，即可发送消息与医生进行互动。<span><img src="${resource(file:'images/selectDoctor.jpg') }" style="width:200px; margin-left:30px;"/></span></p>
								<p>3、目前向医生发送消息所支持的类型两种：纯文字和图片。</p>
								<p>4、您同时只能与一位医生进行咨询，如需切换医生咨询，请在下方列表中选择。</p>
							</div>
						</div>
					</div>	
					<div style="width:92%; margin-left:4%; margin-top:20px;">
						<p style="background-color:#d5d5d5;  font-weight:bold; font-size:16px; line-height:30px; color:#000;">&nbsp;&nbsp;医生列表（当前咨询医生：${dpCheckBox?.doctor?.name }）</p>
						<div style="background-color:#fff; margin-top:-10px;">
							<g:form action="selectDoc" id="${dp?.id }"  name="formDoctor" onsubmit="return changeBox()">
								<input type="hidden" name="dp" value="" id="dp">
							</g:form>
							<g:each in="${doctorpatient }" var="dp">
								<g:link action="showDoctor" controller="introDoctor" id="${dp?.doctor?.id }">
									<div style="background-color:#fff; border-radius:1em;">
										<table style="border-radius:1em;">
											<tr>
												<td rowspan="5" class="wid-td" align="center">
													<img src="${createLink(action:'showPic',id:dp?.doctor?.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:3px;"/>
												</td>
												<td class="big-wid-td">
													<strong class="name" id="docotorName_${dp?.doctor?.id}">${dp?.doctor?.name}</strong>&nbsp;&nbsp;<strong class="title"><small><small>${dp?.doctor?.title}</small></small></strong>
												</td>
												<td rowspan="2" class="small-wid-td" align="center">
												<g:if test="${dp?.doctorPrefered }">
													<input type="checkbox" class="checkBox" name="checkBox_${ dp?.doctor?.id}" ${dp?.patientPrefered?'checked':'' } onchange ="changeBox(this.id)" id="${dp?.doctor?.id }"/>
													<input type="hidden" name="dpId" id="dpId_${dp?.doctor?.id }" value="${dp?.id }"/>
												</g:if>
												</td>
											</tr>
											<tr>
												<td class="hei-td" >
													<small><small>从业年限：${dp?.doctor?.workingYear }</small></small>
												<%--<g:if test="${dp?.doctor?.skills.length() < 7 }">
													<small><small>擅长领域：${dp?.doctor?.skills}</small></small>
												</g:if>
												<g:else>
													<small><small>擅长领域：${dp?.doctor?.skills.substring(0,7)}...</small></small>
												</g:else>--%>
											</td>
											</tr>
											<tr style="height:10px;">
												<td  class="hei-td" style="height:10px;">
													<small><small>关注时间：<g:formatDate date="${dp?.dateCreated }" format="yyyy.MM.dd"/></small></small>
												</td>
												<td align="center" style="height:10px;">
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
									<div style="height:2px; background-color:#d5d5d5; border-radius:0.5;"></div>
								</g:link>
							</g:each>
						</div>
					</div>
				</div>
			</div>
		</g:else>
	</div>
</body>
</html>