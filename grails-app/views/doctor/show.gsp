
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css">
			th{width:50%;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
         <section class="content-header">
				<h1>
					医生信息管理 
					<small><a data-toggle="modal" href="${createLink(action:'edit',controller:'doctor',id:doctorInstance.id) }" data-target="#myModal" class="btn btn-default" data-toggle="tooltip" style="width:50px; height:30px; font-size:10px;">编辑</a></small>
				</h1>
				</section>
	<section class="content">
		<div id="show-doctor" class="content scaffold-show" role="main">
			<%--<h4><g:message code="default.show.label" args="[entityName]" /></h4>
			--%><g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			 
			 <table class="table table-bordered table-respose">
			      <thead>
			         <tr>
			            <th>名称</th>
			            <th>内容</th>
			         </tr>
			      </thead>
			      <tbody>
			      	<g:if test="${doctorInstance?.name}">
			        <tr>
			            <th><span id="name-label" class="property-label"><g:message code="doctor.name.label" default="Name" /></span></th>
			            <td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${doctorInstance}" field="name"/></span></td>
			        </tr>
			         </g:if>
			         
			         <g:if test="${doctorInstance?.title}">
			         <tr>
			            <th><span id="title-label" class="property-label"><g:message code="doctor.title.label" default="Title" /></span></th>
			            <td><span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${doctorInstance}" field="title"/></span></td>
			         </tr>
			         </g:if>
			         			         
			         <g:if test="${doctorInstance?.skills}">
			            <th><span id="skills-label" class="property-label"><g:message code="doctor.skills.label" default="Skills" /></span></th>
			            <td><span class="property-value" aria-labelledby="skills-label"><g:fieldValue bean="${doctorInstance}" field="skills"/></span></td>
			         </g:if>
			         
			         <g:if test="${doctorInstance?.description}">
			         <tr>
			            <th><span id="description-label" class="property-label"><g:message code="doctor.description.label" default="Description" /></span></th>
			            <td><span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${doctorInstance}" field="description"/></span></td>
			       	</tr>
			        </g:if>
			        
			        <g:if test="${doctorInstance?.address}">
			          <tr>
			            <th><span id="address-label" class="property-label"><g:message code="doctor.address.label" default="Address" /></span></th>
			            <td><span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${doctorInstance}" field="address"/></span></td>
			          </tr>
			         </g:if>
			         
			         <g:if test="${doctorInstance?.inquiries}">
			         <tr>
			             <th><span id="inquiries-label" class="property-label"><g:message code="doctor.inquiries.label" default="Inquiries" /></span></th>
			             <td><span class="property-value" aria-labelledby="inquiries-label"><g:fieldValue bean="${doctorInstance}" field="inquiries"/></span></td>
			         </tr>
			         </g:if>
			         <g:if test="${doctorInstance?.reservations}">
			         <tr>
			             <th><span id="reservations-label" class="property-label"><g:message code="doctor.reservations.label" default="Reservations" /></span></th>
			             <td><span class="property-value" aria-labelledby="reservations-label"><g:fieldValue bean="${doctorInstance}" field="reservations"/></span></td>
			         </tr>
			         </g:if>
			         
			         
			      </tbody>
			 </table>
			 <table class="table table-bordered">
			 	<tr style="font-weight:bold;">
			 		<td><g:message code="doctor.qr.label" default="Qr" /></td>
			 		<td><g:message code="doctor.image.label" default="image" /></td>
			 		<td>
			 		<g:if test="${!doctorInstance.subscriber }">
			 			<g:message code="doctor.bindingImage.label" default="Qr Image" />
			 		</g:if>
			 		<g:else>
			 			<g:message code="doctor.subscriber.label" default="Subscriber" />
			 		</g:else>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td><img src="${createLink(action:'qr',controller:'qrImage',id:doctorInstance.id)}" class="img-rounded" style="width: 200px; height:200px "/></td>
			 		<td><img src="${createLink(action:'showPic',controller:'doctor',id:doctorInstance.id)}" class="img-rounded" style="width: 200px; height:200px "/></td>
			 		<td>
			 			<g:if test="${!doctorInstance.subscriber }">
			 			<img src="${createLink(action:'tempQr',controller:'qrImage',id:db.qrKey)}" class="img-rounded" style="width: 200px; height:200px "/>
			 			</g:if>
			 			<g:else>
			 			<g:set var="ui" value="${UserInfo.loadUserInfo(doctorInstance.subscriber.openId) }"/>
			 			<img src="${ui.headImgUrl}" class="img-rounded" style="width: 200px; height:200px "/>
						<br/>${ui.nickname }
						<g:link action="removeSubscriber" id="${doctorInstance?.id}"><input type="button" class="btn btn-default" value="解除绑定" style="margin-top:6px;" /></g:link>
			 			</g:else>
			 			
			 		</td>
			 	</tr>
			 </table>
		    <div class="modal" id="myModal">
   			    <div class="modal-dialog">
      		      <div class="modal-content">
      		      </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
		   </div>
		</div>
		</section>
		</div>
	</body>
</html>
