<!doctype html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<link rel="styleSheet" href="${resource(file:'css/user-defined.css') }" />
		<title></title>
	</head>
	<body>
		<div class="content-wrapper">
		<br /><br />
			<div class="box box-info">
				<h2>&nbsp;&nbsp;<g:message code="doctor.position.label" default=""/></h2>
				<br />
				<g:form action="updatePosition">
				<input type="submit" value="更新" class="btn btn-primary position-submit" id="submit"/>
				<br />
				<table class="table table-bordered table-respose">
					<thead><tr>
						<th><g:message code="doctor.name.label" default="Name" /></th>
						<th><g:message code="doctor.index.label" default="Index"/></th>
					</tr></thead>
					<tbody>
						<g:each in="${doctorList}" var="doctorInstance">
							<tr>
								<td>${doctorInstance?.name }</td>
								<td>
									<input type="text" name="doctor-index-${doctorInstance?.id }" value="${doctorInstance?.index }" id="index" class="form-control"/>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				</g:form>
				<br />
			</div>
			<div class="pagination">
				<g:paginate total="${doctorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>