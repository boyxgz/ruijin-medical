<!DOCTYPE html>
<html>
<head>
<r:layoutResources />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>瑞金微信管理后台</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: '')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: '')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: '')}">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'AdminLTE.min.css')}">
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'skin-blue.min.css')}">
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'all.css') }">
<script src="${resource(dir:'jarvis/js',file:'app.min.js') }"></script>
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'bootstrap-datetimepicker.min.css') }">
<script src="${resource(dir:'jarvis/js',file:'bootstrap-datetimepicker.min.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'bootstrap-datetimepicker.zh-CN.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'jquery-ui.min.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'jquery.cookie.js') }"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <g:layoutHead/>
  
  <style type="text/css">
     .current{ font-weight:bold}
  </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
         $(".treeview-menu li a").click(function(){
            	   $.cookie("navstation", $(this).html(), { path: "/" });           	   
             })
        })
</script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
            <!-- Logo -->
			<a href="" class="logo" style="background-color:#3C8DBC"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini" style="background-color:#3C8DBC"><b></b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg" style="background-color:#3C8DBC"><b></b></span>
			</a>
			
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				
				<div style="float: left; color: white; line-height: 100%; margin-left: 30%;"><h4 style="font-size:24px;">瑞金微信管理后台
				   </h4></div>
				<!-- Navbar Right Menu -->
				<div class="pull-right" style="margin-top:8px;">
					<span class="hidden-xs" style="font-size:16px; color:#fff;">当前用户：<sec:username /></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<g:link controller="user" action="updatepassword" class="btn btn-default" style="height:30px;; width:65px;"><p style="margin-left:-4px; font-size:12px;">修改密码</p></g:link>&nbsp;&nbsp;
					<g:link controller="logout" class="btn btn-default" style="height:30px; width:65px;"><p style="font-size:12px; margin-left:-4px;">退出登录</p></g:link>&nbsp;&nbsp;&nbsp;
				</div>
			</nav>
		</header>
		
		<aside class="main-sidebar">			
			<section class="sidebar">				
				<ul class="sidebar-menu">
					<%--<li class="header"></li>		
					
					--%><!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa  fa-map"></i>
							<span>医生管理</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="Doctor" action="list">医生信息</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa  fa-map"></i>
							<span>预约挂号</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="WokingType" action="list">班次种类管理</g:link></li>
						    <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="Schedule" action="list">排班管理</g:link></li>
						    <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="Reservation" action="list">预约时间管理</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
 <g:layoutBody/>
 
				
		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs"></div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2016 <a href="http://www.sh-hansi.com" target="_blank">上海悍思企业管理咨询有限公司</a>.
			</strong> All rights reserved.
		</footer>

		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.1.4 -->
	<br>
	<script type="text/javascript">
         var navstation = $.cookie("navstation");
        if(navstation != null){
            $(".treeview-menu li a").each(function(){
            if($(this).html() == navstation){
               $(this).parent().parent().css("display","block");   
             //  $(".treeview-menu li a").removeClass("current")
               $(this).addClass("current")
               $(this).css("color","white")
        }
    });
}
</script>
</body>
</html>
