
<%@page import="com.surelution.whistle.push.GroupInfo"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="styleSheet" href="${resource(file:'css/user-defined.css') }"/>
	</head>
	<body>
	<div class="content-wrapper">
		<br/>
		<div id="list-doctor" class="box box-info" role="main">
			<br />
			<h2>&nbsp;&nbsp;<g:message code="doctor.doctormanage.label" default="Doctor Manage"/></h2>
			<div class="c1 create-doctor-list">
	            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
				<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">
					<g:message code="doctor.createdoctor.label" default="Creaet Doctor"/>
				</g:link>
				 <div class="modal fade" id="createModal" role="dialog">
		             <div class="modal-dialog">
			             <div class="modal-content">
			             </div>
		             </div>
	             </div>		
          	</div>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'doctor.name.label', default: 'Name')}" class="alink" style="width:70px;"/>
					    
					    <g:sortableColumn property="title" title="${message(code: 'doctor.title.label', default: 'Title')}" class="alink" style="width:100px;"/>
					    
					    <g:sortableColumn property="workingYear" title="${message(code: 'doctor.workingYear.label', default: 'workingYear')}" class="alink" style="width:100px;"/>
					    
					    <g:sortableColumn property="description" title="${message(code: 'doctor.description.label', default: 'Description')}" class="alink"/>
						
					    <g:sortableColumn property="skills" title="${message(code: 'doctor.skills.label', default: 'Skills')}" class="alink" style="width:350px;"/>
					    
						<g:sortableColumn property="address" title="${message(code: 'doctor.address.label', default: 'Address')}" class="alink"/>
					
						<th style="width:100px;"><g:message code="doctor.weChatNickname.label" default="weChatNickname"/></th>
					
						<th><g:message code="default.operation.label" default="operation" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${doctorInstanceList}" status="i" var="doctorInstance"><tr>
						<td><g:link action="show" id="${doctorInstance.id}">${fieldValue(bean: doctorInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: doctorInstance, field: "title")}</td>
						
						<td>${doctorInstance?.workingYear }</td>
						<td>${fieldValue(bean: doctorInstance, field: "description")}</td>
						
						<td>${fieldValue(bean: doctorInstance, field: "skills")}</td>
						
						<td>${fieldValue(bean: doctorInstance, field: "address")}</td>
						
						<g:set var="userInfo"/>
						<g:if test="${doctorInstance.subscriber }">
							<g:set var="userInfo" value="${UserInfo.loadUserInfo(doctorInstance?.subscriber?.openId) }"/>
						</g:if>
						<td>${userInfo?.nickname }</td>
						<td>
							<g:set var="group"/>
							<g:if test="${doctorInstance.subscriber }">
								<g:set var="group" value="${GroupInfo.findGroupByOpenId(doctorInstance?.subscriber?.openId) }"></g:set>
							</g:if>
							<g:if test="${group != "100" && group != null }">
								<a href="${createLink(action:'moveToDoctorGroup',controller:'doctorGroup',id:doctorInstance?.subscriber?.openId) }" class="btn btn-default">加入医生组</a>
							</g:if>
							<g:elseif test="${group != null }">
								<a href="${createLink(action:'moveToDefaultGroup',controller:'doctorGroup',id:doctorInstance?.subscriber?.openId) }" class="btn btn-default">移出医生组</a>
							</g:elseif>
						</td>
				</tr></g:each>
				</tbody>
			</table>
			<br />
			<div class="pagination">
				<g:paginate total="${doctorInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>
