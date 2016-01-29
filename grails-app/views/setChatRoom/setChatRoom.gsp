<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>设置</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${resource(dir:'css',file:'setChatRoom.css')}"/>

<script type="text/javascript">
    
</script>
</head>
<body>
    <div class="contain">
        <div class="top">
            <div class="content">
               <div style="padding-top:20px;float:left; font-size:16px; font-weight:bold; margin-left:10px;">是否接受咨询</div>
               <div style="margin-top:8px;float:right; ">
                  <img src="${resource(dir:'images',file:'kai.png')}" style="width: 130px; height:45px;" id="img1"/>
               </div>
            </div>
        </div>
        <div class="message">
                          如果关闭接受咨询，则用户无法向您发送新信息
        </div>
   </div>
</body>
</html>