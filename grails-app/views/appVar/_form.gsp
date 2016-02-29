<%@ page import="com.surelution.ruijin.AppVar" %>



<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'key', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
			<g:message code="appVar.key.label" default="Key" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="key" value="${appVarInstance?.key}"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'description', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
				<g:message code="appVar.description.label" default="Description" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="description" value="${appVarInstance?.description}"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'value', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
				<g:message code="appVar.value.label" default="Value" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="value" value="${appVarInstance?.value}"/>
			</div>
		</dd>
	</dl>
</div>

