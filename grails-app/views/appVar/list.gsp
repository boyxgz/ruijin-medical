
<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			th{color:#fff;}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>全局变量</h1>
				<div class="c1" style=" border-bottom: 1px solid #e5e5e5;margin-bottom:10px; margin-top:10px;">
		           	<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">新建全局变量</g:link>
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
					<thead>
						<tr>
							<g:sortableColumn property="key" title="${message(code: 'appVar.key.label', default: '关键字')}" class="alink"/>
						
							<g:sortableColumn property="description" title="${message(code: 'appVar.description.label', default: '描述')}" class="alink"/>
						
							<g:sortableColumn property="value" title="${message(code: 'appVar.value.label', default: '群组ID')}" class="alink"/>
						</tr>
					</thead>
					<tbody>
					<g:each in="${appVarInstanceList}" status="i" var="appVarInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${appVarInstance.id}">${fieldValue(bean: appVarInstance, field: "key")}</g:link></td>
						
							<td>${fieldValue(bean: appVarInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: appVarInstance, field: "value")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
				<g:paginate total="${appVarInstanceTotal}" />
			</div>
			</section>
		</div>
	</body>
</html>
