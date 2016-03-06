
<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h3>群组</h3>
				<div style=" border-bottom: 1px solid #e5e5e5;margin-bottom:10px; margin-top:10px;">
						<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
					<div class="modal fade" id="createModal" role="dialog">
			            <div class="modal-dialog">
				            <div class="modal-content"> 
				            </div>
			            </div>
	             	</div>
				</div>
			</section>
			<section class="content">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered table-respose">
					<thead><tr>
							<th>群组ID</th>
							<th>群组名称</th>
							<th>人数</th>
					</tr></thead>
					<tbody>
					<g:each in="${groups}" status="i" var="group">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${group.id }</td>
							<td>${group.name }</td>
							<td>${group.count }</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</section>
		</div>
	</body>
</html>
