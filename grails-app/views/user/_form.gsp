<%@ page import="com.surelution.ruijin.User" %>

<style>
	.div_1{float:left; width:150px;}
</style>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
<dl class="dl-horizontal">
	<dt>
		<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:textField name="username" required="" value="${userInstance?.username}"/><!-- userInstance?,中的?是判断userInstance id 是否存在如果存在就把值给取出来 -->
		</div>
	</dd>
</dl>
</div> 

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required"  style="line-height:50px;">
<dl class="dl-horizontal">
	<dt> 
		<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:textField name="password" required="" value=""/>
		</div>
	</dd>
</dl>
</div>

<div style="margin-left:125px;">
	<div class="div_1 fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
		<label for="accountExpired">
			<g:message code="user.accountExpired.label" default="Account Expired" />
		</label>
		<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
	</div>
	
	<div class="div_1 fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} " >
		<label for="accountLocked">
			<g:message code="user.accountLocked.label" default="Account Locked" />
		</label>
		<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
	</div>
			
	<div class="div_1 fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} " >
		<label for="enabled">
				<g:message code="user.enabled.label" default="Enabled" />
		</label>
		<g:checkBox name="enabled" value="${userInstance?.enabled}" />
	</div>
			
	<div class="div_1 fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} " >
		<label for="passwordExpired">
			<g:message code="user.passwordExpired.label" default="Password Expired" />
		</label>
		<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	</div>
</div>