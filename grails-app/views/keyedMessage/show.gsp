
<%@ page import="com.surelution.ruijin.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
			.td-1{width:160px;}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<div id="show-keyedMessage" class="content scaffold-show" role="main">
				<table class="table table-bordered table-respose">
					<tr>
						<td class="td-1"><span id="key-label" class="property-label"><g:message code="keyedMessage.key.label" default="Key" /></span></td>
						<td><span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${keyedMessageInstance}" field="key"/></span></td>
					</tr>
					<tr>
						<td class="td-1"><span id="description-label" class="property-label"><g:message code="keyedMessage.description.label" default="Description" /></span></td>
						<td><span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${keyedMessageInstance}" field="description"/></span></td>
					</tr>
					<tr>
						<td class="td-1"><span id="message-label" class="property-label"><g:message code="keyedMessage.message.label" default="Message" /></span></td>
						<td><span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${keyedMessageInstance}" field="message"/></span></td>
					</tr>
				</table>
				<div>
					<g:link class="btn btn-default" action="list">返回列表</g:link>
				</div>
				<%--<ol class="property-list keyedMessage">
				
					<g:if test="${keyedMessageInstance?.key}">
					<li class="fieldcontain">
						<span id="key-label" class="property-label"><g:message code="keyedMessage.key.label" default="Key" /></span>
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${keyedMessageInstance}" field="key"/></span>
					</li>
					</g:if>
				
					<g:if test="${keyedMessageInstance?.description}">
					<li class="fieldcontain">
						<span id="description-label" class="property-label"><g:message code="keyedMessage.description.label" default="Description" /></span>
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${keyedMessageInstance}" field="description"/></span>
					</li>
					</g:if>
				
					<g:if test="${keyedMessageInstance?.message}">
					<li class="fieldcontain">
						<span id="message-label" class="property-label"><g:message code="keyedMessage.message.label" default="Message" /></span>
						
							<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${keyedMessageInstance}" field="message"/></span>
						
					</li>
					</g:if>
				
				</ol>--%>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${keyedMessageInstance?.id}" />
						<%--<g:link class="edit" action="edit" id="${keyedMessageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
