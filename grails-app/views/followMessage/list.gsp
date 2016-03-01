<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'followMessage.label', default: 'FollowMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			th{color:#fff;}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>微信公众平台关注，平台自动给用户回复的消息。</h1>
			</section>
			<section class="content">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:form action="updates" id="${followMessageInstanceList?.id }">
				<table  class="table table-bordered table-respose" style="width:50%; margin-left:10%;">
					<tr>
						<g:sortableColumn property="message" title="${message(code: 'followMessage.message.label', default: '消息')}" />
						<td>
							<input type="submit" value="提交" class="btn btn-default">
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea style="width:300px; height:200px;" name="message">${followMessageInstanceList?.message}</textarea></td>
					</tr>
			</table>
			</g:form>
			</section>
		</div>
	</body>
</html>
