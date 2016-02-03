
<%@ page import="com.surelution.ruijin.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<script src="${resource(dir:'js',file:'bootstrap-tooltip.js') }"></script>
	<style>
		td{width:200px;}
		tr{line-height:30px;}
		li{list-style:none;}
		 .modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:55%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
	</style>
	<script type="text/javascript">
	$(function(){
		$("a[data-target=#myModal]").click(function(event) {
			$(this).data('myModal',null)
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#myModal").load(target, function() { 
			    	$("#myModal").addClass("modalstyle")
	                $("#myModal").modal('show');  }); 				    	
			    });
		});
	</script>
</head>
<body>
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>用户管理</h1>
		</section>
		<section class="content">
			<div class="box box-info">
				<div id="list-user" class="content scaffold-lis" role="main">
			<span>
				<g:link class="create glyphicon glyphicon-plus" action="create" style="color:#000; font-weight:bold;" data-toggle="modal" data-target="#myModal" >&nbsp;新建用户<%--<g:message code="default.new.label" args="[entityName]" />--%></g:link>
			</span>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div style="height:10px;"></div>
			<table class = "table-bordered table-striped">
				<thead>
					<tr style=" background-color:#3C8DBD;">
						<th><g:message code="user.username.label" default="Username"/></th>
        				<th><g:message code="user.accountExpired.label" default="Account Expired"/></th>
        				<th><g:message code="user.accountLocked.label" default="Account Locked"/></th>
        				<th><g:message code="user.enabled.label" default="Enabled"/></th>
        				<th><g:message code="user.passwordExpired.label" default="Password Expired"/></th>
        				<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
					
						<%--<td>${fieldValue(bean: userInstance, field: "password")}</td>
					
						--%><td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
						
						<td>
							<a href="${createLink(action:'delete',controller:'user',id:userInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'user',id:userInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
						</td>
					</tr>
					</g:each>
				</tbody>
			</table>
			<div style="height:10px;"></div>
			</div>
			</div>
		</section>
		</div>
		<%--<div class="pagination">
			<g:paginate total="${userInstanceTotal}" />
		</div>
		--%>
		<div class="modal fade" id="myModal">
   			<div class="modal-dialog">
      		<div class="modal-content">
      		</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
</body>
</html>
