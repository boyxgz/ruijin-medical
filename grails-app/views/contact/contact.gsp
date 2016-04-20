<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>联系我们</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'intro.css')}"/>
<wx:registerJsapi apiList="'openLocation'" />
    <script type="text/javascript">
		function openLocation() {
			wx.ready(function(){
				wx.openLocation({
				    latitude: 31.211902, // 纬度，浮点数，范围为90 ~ -90
				    longitude: 121.467177, // 经度，浮点数，范围为180 ~ -180。
				    name: '瑞金二路197号', // 位置名
				    address: '上海市黄浦区永嘉路瑞金二路197号', // 地址详情说明
				    //scale: 1, // 地图缩放级别,整形值,范围从1~28。默认为最大
				    infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
				});
			})
		}
    </script>
<style>
	body{background-color:#E8EBF0;}
	p{margin-left:10px;}
</style><%--
body{background-image:url(${resource(dir:'images',file:'mubanbackground.png')});}
--%></head>
<body>
    <div class="container">
    	<h3>上海交通大学医学院附属瑞金医院-心外科室</h3>
    	<div class="content-header">
    		<br>
    		<p>地址：上海市瑞金二路197号（永嘉路口）</p>
    		<p>邮编：200025</p>
    		<p>公交路线：17、24、36、41、96、104、128、146、780、786路、隧道一线、隧道八线等</p>
    		<p>地铁路线： 1号线（陕西南路站）、9号线（打浦桥站）</p>
    		<p><a href="javascript:openLocation()"><img src="${resource(file:'images/ditu.png') }" style="margin-left:8%; width:80%;"/></a></p>
    		<p style="color:red; margin-left:8%;">注：点击图片进行导航。</p>
    		<p>如果您对我们的工作有建议或投诉，可致电客服电话：<a href="tel:64370045">64370045</a>转<a href="tel:600505">600505</a>分机，我们会根据您的来电（来信）内容迅速处理并及时答复。</p>
    		<br>
    	</div>
    </div>
    <br>
</body>
</html>