<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>医生风采</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'showDoctor.css')}"/>
<style>
   .top{background-image: url("${resource(dir:'images',file:'banner-1.jpg')}");}
  .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus{background-color:#5cb85c;}
</style>
</head>
<body>
    <div class="contain">
        <div class="top">
           <div class="top_left">
             <img src="${createLink(action:'showPic',controller:'introDoctor',id:doctor.id)}" class="img-rounded" style="width: 80px; height:80px; margin-top:10px;margin-left:10px;"/>
           </div>
           <div class="top_right" style="margin-left:10px;">
               <div style="height:60%;">
               <div class="r_l">
                  <div class="name">${doctor.name }</div>
                  <div class="title">从业${doctor?.workingYear }年</div>
                  <div class="title">${doctor.title }</div>
               </div>
               <%--<div class="r_r">
                  <dl class="zixun">
                    <dt class="dd1">${doctor.reservations}</dt>
                    <dd class="dt1">预约量</dd>
                  </dl>
                  <dl class="yuyue">
                    <dt class="dd1">${doctor.inquiries}</dt>
                    <dd class="dt1">咨询量</dd>
                  </dl>
               </div>--%>
               </div>
               <div style="height:30%; ">
               </div>
           </div>
        </div>

		<div class="middle" style="margin-top:10px;">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active" style="width:50%;"><a href="#introduction" data-toggle="tab" class="btn btn-default">医生介绍</a></li>
				<li style="width:50%;"><a href="#reservations" data-toggle="tab" class="btn btn-default">医生排班</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="introduction">
					<div class="zhiyedian">
					   <div class="mi" style="padding-top:15px;"><img src="${resource(dir:'images',file:'shan-chang.png')}" style="width: 20px; height:20px; "/><span style="font-size:16px; margin-left:5px;">擅长领域</span></div> 
					   <div style="margin-top:10px; padding-bottom:8px;">
					      <p class="mi font_style">${doctor.skills}</p>
					   </div>
					</div>
					
					<div class="zhiyedian">
					   <div class="mi" style="padding-top:15px;"><img src="${resource(dir:'images',file:'jian-jie.png')}" style="width: 20px; height:20px; "/><span style="font-size:16px; margin-left:5px;">服务理念</span></div> 
					   <div style="margin-top:10px;padding-bottom:8px;">
					      <p class="mi font_style">${doctor.description }</p>
					   </div>
					</div>
			  </div>
				<div class="tab-pane fade " id="reservations">
					<table class="table table-bordered table-respose tab">
						<tr>
							<td rowspan="2" class="t1">
							   <p style="margin-top:10px;">周一 </p>
							   <p>01-28</p>
							</td>
							<td class="t1">上午(08:00-11:00)</td>
						</tr>
						<tr>
							<td class="t1">下午(14:00-17:00)</td>
						</tr>
						<tr>
							<td rowspan="2" class="t1">
							   <p style="margin-top:10px;">周二</p>
							   <p>01-28</p>
							</td>
							<td class="t1">上午(08:00-11:00)</td>
						</tr>
						<tr>
							<td class="t1">下午(14:00-17:00)</td>
						</tr>
					</table>
				</div>
			</div>
		</div><!-- middle结束 -->
		
		<div class="foot navbar navbar-fixed-bottom">
		    <%--<div class="home">
		         <dl>
		            <dt class="dt2"><img src="${resource(dir:'images',file:'home.png')}" style="height: 35px;width: 35px;"/></dt>
		            <dd class="dt2">首页</dd>
		         </dl>
		    </div>
		    <div class="mime">
		        <dl>
		            <dt class="dt2"><img src="${resource(dir:'images',file:'mime.png')}" style="height: 35px;width: 35px;"/></dt>
		            <dd class="dt2">个人中心</dd>
		         </dl>
		    </div>
		--%></div>
	</div>
</body>
</html>