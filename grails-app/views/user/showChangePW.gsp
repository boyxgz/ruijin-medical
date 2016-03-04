<%@ page import="com.surelution.ruijin.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>修改密码</title>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>修改密码</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
			</section>
			<section class="content">
				<g:form method="post"action="changePw" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<dl class="dl-horizontal">
						<dt>
							<label for="password">
							原密码：
							<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:passwordField name="password" required=""/>
							</div>
						</dd>
					</dl>
				</div>
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<dl class="dl-horizontal">
						<dt>
							<label for="password">
							新密码：
							<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:passwordField name="newPw1" required=""/>
							</div>
						</dd>
					</dl>
				</div>
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<dl class="dl-horizontal">
						<dt>
							<label for="pw1">
							确认密码：
							<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:passwordField name="newPw2" required=""/>
							</div>
						</dd>
					</dl>
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="changePw" value="修改"  class="btn btn-default"/>
				</fieldset>
			</g:form>
			</section>
		</div>
	</body>
</html>
