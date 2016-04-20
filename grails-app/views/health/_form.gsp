<%@ page import="com.surelution.ruijin.Health" %>
<style>
	.tables{ line-height: 45px; margin-left: 100px;}
</style>

<table class="tables">
  <tr>
    <td> 
    	<label for="fileUrl">
			<g:message code="health.name.label" default="Name" />&nbsp;&nbsp;&nbsp;
		</label>
	</td>
    <td>
		<g:textField class="form-control" name="name" value="${healthInstance?.name}"/>
	</td>
  </tr>
  <tr>
    <td> 
    	<label for="fileUrl">
			<g:message code="health.fileUrl.label" default="File Url" />&nbsp;&nbsp;&nbsp;
		</label>
	</td>
    <td>
		<textarea rows="" cols="" class="form-control" name="fileUrl" style="height:150px; width:250px;" >${healthInstance?.fileUrl}</textarea>
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


<%--<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'keyedMessage', 'error')} required">
	<label for="keyedMessage">
		<g:message code="health.keyedMessage.label" default="Keyed Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="keyedMessage" name="keyedMessage.id" from="${com.surelution.ruijin.KeyedMessage.list()}" optionKey="id" value="${healthInstance?.keyedMessage?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'fileUrl', 'error')} ">
	<label for="fileUrl">
		<g:message code="health.fileUrl.label" default="File Url" />
		
	</label>
	<g:textField name="fileUrl" value="${healthInstance?.fileUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="health.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${healthInstance?.name}"/>
</div>--%>

