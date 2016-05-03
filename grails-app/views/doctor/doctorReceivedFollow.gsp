<!doctype html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<title></title>
		<link rel="styleSheet" href="${resource(file:'css/user-defined.css') }" />
	</head>
	<body>
		<div class="content-wrapper">
		<br /><br />
			<div class="box box-info">
				<h2>&nbsp;&nbsp;<g:message code="doctor.receivedFollow.label" default="Doctor Patient Number"/></h2>
				<br />
				<table class="table table-bordered table-respose">
					<thead><tr>
						<th><g:message code="doctor.name.label" default="Name" /></th>
						<th><g:message code="doctor.patientNum.label" default="Patient Number"/> </th>
					</tr></thead>
					<tbody>
						<g:each in="${dotorPatientNumList}" var="dpl">
							<tr>
								<td>${dpl[0]?.name }</td>
								<td>${dpl[1] }</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<br />
			</div>
			<div class="pagination">
				<g:paginate total="${doctorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>