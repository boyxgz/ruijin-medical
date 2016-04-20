<%@ page import="com.surelution.ruijin.FollowMessage" %>



<div class="fieldcontain ${hasErrors(bean: followMessageInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="followMessage.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${followMessageInstance?.message}"/>
</div>

