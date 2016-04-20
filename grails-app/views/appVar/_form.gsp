<%@ page import="com.surelution.ruijin.AppVar" %>



<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'key', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
			<g:message code="appVar.key.label" default="关键字" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="key" value="${appVarInstance?.key}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'description', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
				<g:message code="appVar.description.label" default="描述" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="description" value="${appVarInstance?.description}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: appVarInstance, field: 'value', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
				<g:message code="appVar.value.label" default="群组ID" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="value" value="${appVarInstance?.value}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

