<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>医生风采</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${resource(dir:'css',file:'intro.css')}"/>
<style>
	.title{font-weight:bold;}
</style>
</head>
<body>
    <div class="contain">
        <div class="top">
            <p style="margin-left:10px;">共${doctorInstanceTotal}名医生</p>
        </div>
        
        <g:each in="${doctorInstanceList}" var="doctor">
        <a href="${createLink(action:'showDoctor',controller:'introDoctor',id:doctor.id)}">
        <div class="content">
             <div class="content_left"><img src="${createLink(action:'showPic',controller:'introDoctor',id:doctor.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:10px;margin-left:10px;"/></div>
             <div class="content_right" style="width:70%; margin-left:10px;">
                 <div class="cr">
                      <div style="width: 75%; float: left;"><strong class="name">${doctor.name}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="title"></strong></div>
                      <%--<div style="width: 20%; float: left; margin-top:5px;" class="btn btn-success btn-xs">有号</div>--%>
                 </div>
	             <div class="cr"><span class="title">职称：${doctor.title }</span></div>
	             <g:if test="${doctor?.skills?.length() >= 13 }">
	             <div class="cr"><span class="font_style">从业年限 ：${doctor?.workingYear}年</span></div>
		         </g:if>
		         <g:else>
		         	 <div class="cr"><span class="font_style">从业年限：${doctor?.workingYear}</span></div>
		         </g:else>
		        </div>
		        
		</div>
		</a>
		</g:each>
   </div>
</body>
</html>