<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>科室简介</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${resource(dir:'css',file:'introDepart.css')}"/>
</head>
<body>
    <div class="contain">
        <div class="top">
            <img src="${resource(dir:'images',file:'hospital.jpg')}" style="width: 100%; height:200px;"/>
        </div>
        <div class="content">
             <div class="main">科室简介</div>
             <div class="con">
                 <table>
                    <tr>
                      <td>医院:</td>
                      <td>上海交通大学附属瑞金医院</td>
                    </tr>
                     <tr>
                     <td colspan="2">三级甲等</td>
                    </tr>
                     <tr>
                      <td>地址：</td>
                      <td>上海市卢湾区瑞金二路197号</td>
                    </tr>
                     <tr>
                      <td>擅长：</td>
                      <td>************</td>
                    </tr>
                    <tr>
                      <td>主治范围：</td>
                      <td>************</td>
                    </tr>
                 </table>
             </div>
        </div>
    </div>
</body>
</html>