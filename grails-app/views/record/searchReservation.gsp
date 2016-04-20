<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>挂号记录</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${resource(dir:'css',file:'search.css')}"/>
</head>
<body>
    <div class="contain">
        <div class="top">
            <p style="margin-left:10px;">共2条预约信息</p>
        </div>
        
        <div class="content">
           <div class="content_left" style="margin-left:10px;">
               <dl>
                 <dt class="dt1"><img src="${resource(dir:'images',file:'huanzhe.png')}" class="img-rounded" style="width:70px; height: 70px;"/></dt>
                 <dd><a class="btn btn-success">已就诊</a></dd>
               </dl>
           </div>
           <div class="content_right">
                <p class="name">患者姓名：XXX</p>
                <p class="money">费用：100元</p>
                <span>预约时间：2016-1-29 10:10</span><br>
                <span>接诊时间：2016-1-29 12:10</span><br>
           </div>
        </div>      
        
        
        <div class="content">
           <div class="content_left" style="margin-left:10px;">
               <dl>
                 <dt class="dt1"><img src="${resource(dir:'images',file:'huanzhe.png')}" class="img-rounded" style="width:70px; height: 70px;"/></dt>
                 <dd><a class="btn btn-success">未就诊</a></dd>
               </dl>
           </div>
           <div class="content_right">
                <p class="name">患者姓名：XXX</p>
                <p class="money">费用：100元</p>
                <span>预约时间：2016-1-29 10:10</span><br>
                <span>接诊时间：未就诊</span><br>
           </div>
        </div>   
   </div>
</body>
</html>