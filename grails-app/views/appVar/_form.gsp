<%@ page import="com.surelution.ruijin.AppVar" %>



<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'key', 'error')} ">
	<label for="key">
		<g:message code="appVar.key.label" default="Key" />
		
	</label>
	<g:textField name="key" value="${appVarInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="appVar.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${appVarInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="appVar.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${appVarInstance?.value}"/>
</div>

