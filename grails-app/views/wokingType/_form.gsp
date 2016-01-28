<%@ page import="com.surelution.ruijin.WokingType" %>

<div class="fieldcontain ${hasErrors(bean: wokingTypeInstance, field: 'description', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="description">
		       <g:message code="wokingType.description.label" default="Description" />
        	</label>
		</dt>
		<dd>
			<div class="col-xs-8">
			    <g:textField name="description" value="${wokingTypeInstance?.description}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: wokingTypeInstance, field: 'name', 'error')} ">
		<dl class="dl-horizontal">
				<dt>
				   <label for="name">
		               <g:message code="wokingType.name.label" default="Name" />
	               </label>
				</dt>
				<dd>
					<div class="col-xs-8">
					    <g:textField name="name" value="${wokingTypeInstance?.name}" class="form-control"/>
					</div>
				</dd>
	   </dl>
</div>

