
<%@ page import="com.surelution.ruijin.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-keyedMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-keyedMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'keyedMessage.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'keyedMessage.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="message" title="${message(code: 'keyedMessage.message.label', default: 'Message')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${keyedMessageInstanceList}" status="i" var="keyedMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${keyedMessageInstance.id}">${fieldValue(bean: keyedMessageInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: keyedMessageInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: keyedMessageInstance, field: "message")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${keyedMessageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
