
<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h3>编辑</h3>
			</section>
			<section class="content">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered table-respose">
					<tr>
						<td>key</td>
						<td>
							<g:if test="${appVarInstance?.key }">
								<g:fieldValue bean="${appVarInstance}" field="key"/>
							</g:if>
						</td>
					</tr>
					<tr>
						<td>Description</td>
						<td>
							<g:if test="${appVarInstance?.description }">
								<g:fieldValue bean="${appVarInstance }"  field="description"/>
							</g:if>
						</td>
					</tr>
					<tr>
						<td>Value</td>
						<td>
							<g:if test="${appVarInstance?.value}">
								<g:fieldValue bean="${appVarInstance}" field="value"/>
							</g:if>
						</td>
					</tr>
				</table>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${appVarInstance?.id}" />
						<g:link class="edit btn btn-default" action="edit" id="${appVarInstance?.id}">编辑</g:link>
						<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</section>
		</div>
		<div id="show-appVar" class="content scaffold-show" role="main">
			
		</div>
	</body>
</html>
