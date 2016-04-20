<!DOCTYPE HTML>
<html>
<head>
<title>健康宣教</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.min.css')}"/>
<link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap-switch.css')}"/>
<script src="${resource(file:'js/jquery.min.js') }"></script>
<script src="${resource(file:'js/bootstrap-switch.min.js') }"></script>
<script src="${resource(dir:'js',file:'jquery-1.9.0.min.js') }" type="text/javascript"></script>
<link href="${resource(dir:'css',file:'health.css') }" type="text/css" rel="stylesheet"/>
<style type="text/css">
	h2{line-height:1.7;}
</style>
<!-- body{background-color:#E8EBF0;} -->
</head>
<body>
	<div id="container">
	    <div class="t_top">
	        <h2>健康宣教</h2>
	    </div>
		<div id="List">
	    <g:each in="${healthInstand}" var="health">
		    <a href="${health.fileUrl}">
			    <table width="98%" border="0" align="center" class="ta">
			        <tr>
			            <td width="30" height="25" align="center">
			                <img src="${resource(dir:'images',file:'PointPic.png') }" alt="">
			           	</td>
			            <td valign="top">${health.name }</td>      
			            <td width="30"><span>&gt;&gt;</span></td> 
			        </tr>
			    </table>
		    </a>
	    </g:each>
    	<table width="98%" border="0" height="30px;" align="center"><tr><td></td></tr></table>
       </div>
</div>
</body>
</html>