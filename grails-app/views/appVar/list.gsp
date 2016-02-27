
<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appVar.label', default: 'AppVar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-appVar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-appVar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'appVar.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'appVar.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'appVar.value.label', default: 'Value')}" />
					
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
		</div>
	</body>
</html>
