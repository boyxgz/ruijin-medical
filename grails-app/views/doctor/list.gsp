
<%@ page import="com.surelution.ruijin.Doctor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
		   .modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:65%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
	   </style>
		<script type="text/javascript">
	$(function(){
		$("a[data-target=#myModal]").click(function(event) {
			$(this).data('myModal',null)
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#myModal").load(target, function() { 
			    	$("#myModal").addClass("modalstyle")
	                $("#myModal").modal('show');  }); 				    	
			    });
		});
	</script>
	</head>
	<body>
		  <div class="content-wrapper">
         <section class="content-header">
				<h1>
					医生信息管理 <small></small>
				</h1>
				<div class="c1" style=" border-bottom: 1px solid #e5e5e5;margin-bottom:10px; margin-top:10px;">
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
			<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">新建医生</g:link>
			<!-- 新增台账的dialog -->	
			 <div class="modal fade" id="createModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>		
          </div>
				</section>
	<section class="content">
		<div id="list-doctor" class="content scaffold-list" role="main">
			<%--<h4><g:message code="default.list.label" args="[entityName]" /></h4>
			--%><g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
						
						<g:sortableColumn property="name" title="${message(code: 'doctor.name.label', default: 'Name')}" class="alink" />
					    
						<g:sortableColumn property="address" title="${message(code: 'doctor.address.label', default: 'Address')}" class="alink"/>
					
						<g:sortableColumn property="description" title="${message(code: 'doctor.description.label', default: 'Description')}" class="alink"/>
					
						<g:sortableColumn property="inquiries" title="${message(code: 'doctor.inquiries.label', default: 'Inquiries')}" class="alink"/>
					
						<g:sortableColumn property="reservations" title="${message(code: 'doctor.reservations.label', default: 'Reservations')}" class="alink"/>
					
						<g:sortableColumn property="skills" title="${message(code: 'doctor.skills.label', default: 'Skills')}" class="alink"/>
					   
					   <g:sortableColumn property="title" title="${message(code: 'doctor.title.label', default: 'Title')}" class="alink"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${doctorInstanceList}" status="i" var="doctorInstance">
					<tr>
						<td><g:link action="show" id="${doctorInstance.id}">${fieldValue(bean: doctorInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: doctorInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: doctorInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: doctorInstance, field: "inquiries")}</td>
					
						<td>${fieldValue(bean: doctorInstance, field: "reservations")}</td>
					
						<td>${fieldValue(bean: doctorInstance, field: "skills")}</td>
					    
					    <td>${fieldValue(bean: doctorInstance, field: "title")}</td>
					    <%--<td>
					        <a href="${createLink(action:'delete',controller:'doctor',id:doctorInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'doctor',id:doctorInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
					    </td>
					--%></tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${doctorInstanceTotal}" />
			</div>
		</div>
		</section>
		</div>
	</body>
</html>
