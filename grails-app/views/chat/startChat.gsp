<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>咨询室</title>
<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
<style>
	body{background-color:#e2e2e2;}
	.wd-inp{width:90%;}
	.mess{background-color:#00EE00; font-weight:bold; height:80px; border-radius:1em;}
	div{border:1px solid #000;}
</style>
<script type="text/javascript">
	function send(){
		alert("1");
		var message = document.getElementById('message');
		var divBody = document.getElementById('divbody');
		var divNew = document.createElement('div');
		var para = document.createElement('p');   //产生一个新的p标签节点 
		para.innerHTML = message.value;
		divNew.style.color = "red";
		divNew.style.
		divNew.appendChild(para);
		divBody.appendChild(divNew);
		alert("4");
	}
</script>
</head>
<body>
<div style="border:1px solid red; height:90%;" id="divbody">

</div>
<nav class="navbar navbar-default navbar-fixed-bottom" >
	<div style="widht:100%; height:12px;"></div>
	<div class="container">
		<div style="float:left; width:83%;"><input type="text" class="form-control " id="message" ></div>
		<div style="float:right;"><input type="button" class="btn btn-success" value="发送" onclick="send()"></div>
	</div>
	<div style="widht:100%; height:13px;"></div>
</nav>
</body>
</html>