
<%@ page import="com.surelution.ruijin.Schedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		  <div class="content-wrapper">
         <section class="content-header">
				<h1>
					医生信息管理 <small></small>
				</h1>
				<div class="c1" style=" border-bottom: 1px solid #e5e5e5;margin-bottom:10px; margin-top:10px;">
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
			<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">新建医生</g:link>
			<!-- 新增台账的dialog -->	
			 <div class="modal fade" id="createModal" role="dialog">
	             <div class="modal-dialog">
		             <div class="modal-content"> 
		             </div>
	             </div>
             </div>		
          </div>
				</section>
	<section class="content">
		<div id="list-doctor" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead><tr>
					<th><g:message code="schedule.doctor.label" default="医生" /></th>
					<g:sortableColumn property="wokingTime" title="${message(code: 'schedule.wokingTime.label', default: '上班时间')}" class="alink"/>
					<g:sortableColumn property="endDate" title="${message(code: 'schedule.endDate.label', default: '下班时间')}" class="alink"/>
					<th><g:message code="schedule.wokingType.label" default="工作类别" /></th>
					<th>操作</th>
				</tr></thead>
				<tbody><g:each in="${scheduleInstanceList}" status="i" var="scheduleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${scheduleInstance.id}">${fieldValue(bean: scheduleInstance, field: "doctor")}</g:link></td>
						<td><g:formatDate date="${scheduleInstance.endDate}" /></td>
						<td><g:formatDate date="${scheduleInstance.wokingTime}" /></td>
						<td>${fieldValue(bean: scheduleInstance, field: "wokingType")}</td>
						<td>
							<a href="${createLink(action:'delete',controller:'user',id:userInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'user',id:userInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
						</td>	
					</tr>
				</g:each></tbody>
			</table>
		</div>
		</section>
		</div>
	</body>
	<body>
</html>
