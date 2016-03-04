<%@ page import="com.surelution.ruijin.AppVar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'followMessage.label', default: 'FollowMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			th{color:#fff;}
			.textarea{width:300px; height:100px;};
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>自动回复内容设置</h1>
			</section>
			<section class="content">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:form action="updates" id="${fmOne?.id }">
				<table  class="table table-bordered table-respose" style="width:50%; margin-left:10%;">
					<tr>
						<g:sortableColumn property="message" title="${message(code: 'followMessage.message.label', default: '首次关注回复内容 ')}" />
						<td>
							<input type="hidden" value="1" name="indexId">
							<input type="submit" value="提交" class="btn btn-default">
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="textarea" name="message">${fmOne?.message}</textarea></td>
					</tr>
				</table>
				</g:form>
				<g:form action="updates" id="${fmTwo?.id }">
					<table  class="table table-bordered table-respose" style="width:50%; margin-left:10%;">
					<tr>
						<g:sortableColumn property="message" title="${message(code: 'followMessage.message.label', default: '未关注医生时回复')}" />
						<td>
							<input type="hidden" value="2" name="indexId">
							<input type="submit" value="提交" class="btn btn-default">
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="textarea" name="message">${fmTwo?.message}</textarea></td>
					</tr>
				</table>
				</g:form>
				<g:form action="updates" id="${fmThere?.id }">
					<table  class="table table-bordered table-respose" style="width:50%; margin-left:10%;">
					<tr>
						<g:sortableColumn property="message" title="${message(code: 'followMessage.message.label', default: '不支持消息类型回复 ')}" />
						<td>
							<input type="hidden" value="3" name="indexId">
							<input type="submit" value="提交" class="btn btn-default">
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="textarea" name="message">${fmThere?.message}</textarea></td>
					</tr>
				</table>
				</g:form>
			</section>
		</div>
	</body>
</html>
