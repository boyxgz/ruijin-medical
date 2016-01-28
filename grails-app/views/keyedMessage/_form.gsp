<%@ page import="com.surelution.ruijin.KeyedMessage" %>



<div class="fieldcontain ${hasErrors(bean: keyedMessageInstance, field: 'key', 'error')} ">
	<label for="key">
		<g:message code="keyedMessage.key.label" default="Key" />
		
	</label>
	<g:textField name="key" value="${keyedMessageInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyedMessageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="keyedMessage.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${keyedMessageInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyedMessageInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="keyedMessage.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${keyedMessageInstance?.message}"/>
</div>

