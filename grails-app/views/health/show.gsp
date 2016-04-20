
<%@ page import="com.surelution.ruijin.Health" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'health.label', default: 'Health')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
			.tables{ line-height: 45px; margin-left: 160px;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<div style="height:20px;"></div>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<table style="width:30%;">
				<tr>
					<td><g:link class="btn btn-default" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></td>
				</tr>
			</table>
		<div id="show-health" class="content scaffold-show" role="main">
			<table class="tables">
			  <tr>
			    <td> 
			    	<label for="fileUrl">
						<g:message code="health.name.label" default="Name" />
					</label>
				</td>
			    <td>
					<g:textField class="form-control" name="name" value="${healthInstance?.name}"/>
				</td>
			  </tr>
			  <tr>
			    <td> 
			    	<label for="fileUrl">
						<g:message code="health.fileUrl.label" default="File Url" />
					</label>
				</td>
			    <td>
					<g:textField class="form-control" name="fileUrl" value="${healthInstance?.fileUrl}"/>
				</td>
			  </tr>
			  <%--<tr>
			    <td> 
			    	<label for="fileUrl">
						<g:message code="health.keyedMessage.label" default="Keyed Message" />
					</label>
				</td>
			    <td>
					<g:select value="${healthInstance?.keyedMessage?.key}" class="form-control" id="keyedMessage" name="keyedMessage.id" from="${com.surelution.ruijin.KeyedMessage.list()}" optionKey="id" optionvalue="key"  />
				</td>
			  </tr>--%>
			</table>
			<%--<ol class="property-list health">
			
				<g:if test="${healthInstance?.keyedMessage}">
				<li class="fieldcontain">
					<span id="keyedMessage-label" class="property-label"><g:message code="health.keyedMessage.label" default="Keyed Message" /></span>
					
						<span class="property-value" aria-labelledby="keyedMessage-label"><g:link controller="keyedMessage" action="show" id="${healthInstance?.keyedMessage?.id}">${healthInstance?.keyedMessage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${healthInstance?.fileUrl}">
				<li class="fieldcontain">
					<span id="fileUrl-label" class="property-label"><g:message code="health.fileUrl.label" default="File Url" /></span>
					
						<span class="property-value" aria-labelledby="fileUrl-label"><g:fieldValue bean="${healthInstance}" field="fileUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${healthInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="health.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${healthInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>--%>
			<%--<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${healthInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${healthInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
		</div>
	</div>
	</body>
</html>
