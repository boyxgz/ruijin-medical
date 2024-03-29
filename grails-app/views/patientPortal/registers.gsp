<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人中心</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${resource(dir:'js',file:'bootstrap.min.js') }"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.8.3.min.js') }"></script>
<style>
	*{margin:0; padding:0;}
	body{background-color:#F0F0F0;}
	.winput{width:100%;}
	.wtd{width:120px;}
	tr{line-height:50px;}
</style>
<script type="text/javascript">
function check(form){
	//姓名不为空校验
	if( form.name.value == ''){
		alert('请输入你的姓名。');
		return false;
	}
	else{
		var str = form.name.value;
		var pormpt;
		for(var i=0; i<form.name.value.length; i++){
			if(str[i] != ' '){
				pormpt = '';
			}
			else{
				pormpt = "您输入的是空格，请重新输入！";
			}
		}
		if(pormpt != ''){
			alert(pormpt);
			form.name.value = '';
			return false;
		}
	}
	
	//联系方式不为空校验 
	if(form.phoneNumb.value == ''){
		alert('请输入您的联系方式。');
		return false;
	}
	else{
		var str = form.phoneNumb.value;
		var pormpt;
		for(var i=0; i<form.phoneNumb.value.length; i++){
			if(str[i] != ' '){
				pormpt = '';
			}
			else{
				pormpt = "您输入的是空格，请重新输入您的联系方式！";
			}
		}
		if(pormpt != ''){
			alert(pormpt);
			form.phoneNumb.value = '';
			return false;
		}
	}
	//以下身份证号码校验
}
</script>
</head>
<body>
<div>
<img src="${resource(dir:'images',file:'hospital.jpg') }"  style="width:100%; height:30%;">
<div style="width:100%; height:20px;"></div>
<div style="border:0px solid #000; width:84%; margin-left:0%;">
	<g:form action="saveInformation">
	<table style="border:0px solid red; width:110%;">
	<tr>
		<td class="text-right wtd">姓名&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="name" value="${patient?.name }"/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">生日&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
		<g:if test="${patient?.dateOfBirth == null }">
		<input type="date" value="${patient?.dateOfBirth}" name="dateOfBirth" id="dateOfBirth" class="form-control"  style="width:230px;"/>
		</g:if>
		<g:else>
		<input type="date" value="<g:formatDate date="${patient?.dateOfBirth}" format="yyyy-MM-dd"/>" name="dateOfBirth" id="dateOfBirth" class="form-control" style="width:230px;" />
		</g:else>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">性别&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<g:if test="${patient?.sex == null }">
				<g:select name="sex" from="${com.surelution.ruijin.Patient?.Sex?.values()}" 
					keys="${com.surelution.ruijin.Patient?.Sex?.values()*.name()}" class="form-control" />
			</g:if>
			<g:else>
				<g:select name="sex" value="${patient?.sex.name() }" from="${com.surelution.ruijin.Patient.Sex.values()}" 
					keys="${com.surelution.ruijin.Patient.Sex.values()*.name()}" class="form-control" />
			</g:else>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">联系方式&nbsp;&nbsp;*&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="phoneNumb" value="${patient?.phoneNumb }"/>
		</td>
	</tr>
	<tr>
		<td class="text-right wtd">住院号&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>
			<input type="text" class="winput form-control input-sm" name="iDcard" value="${patient?.iDcard }"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="right"><input type="submit" class="btn btn-default" value="提交" onclick="return check(this.form)"/></td>
	</tr>
	</table>
	</g:form>
</div>
<div style="width:90%; margin-left:8%; margin-top:10px;">
<p class="lead">友情提示：请输入正确的住院号和您的姓名，以便专家能够更精确的了解到您的个人情况。</p>
</div>
</div>
</body>
</html>

<!-- 
只有屏幕大于768px的时候，添加类名“.dl-horizontal”才具有水平定义列表效果。其实现主要方式：
1、将dt设置了一个左浮动，并且设置了一个宽度为160px
2、将dd设置一个margin-left的值为180px，达到水平的效果
3、当标题宽度超过160px时，将会显示三个省略号 -->