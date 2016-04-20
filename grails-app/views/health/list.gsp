<%@ page import="com.surelution.ruijin.Health" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'health.label', default: 'Health')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.table{width:92%; margin-left:4%; margin-top:4%;}
			.modalstyle{width:500px; height:354px; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7;}
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
			<div>
				<g:link class="btn btn-default" action="create" data-toggle="modal" data-target="#createModal"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="modal" id="createModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>	
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</section>
		<section class="content">
			<div class="box box-info">
				<table class="table table-bordered table-repose">
					<thead>
						<tr>
						
							<%--<th><g:message code="health.keyedMessage.label" default="Keyed Message" /></th>--%>
						
							<g:sortableColumn class="alink" property="name" title="${message(code: 'health.name.label', default: 'Name')}" />
							
							<g:sortableColumn class="alink" property="fileUrl" title="${message(code: 'health.fileUrl.label', default: 'File Url')}" />
							
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${healthInstanceList}" status="i" var="healthInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${fieldValue(bean: healthInstance, field: "name")}</td>
							<%--<td><g:link action="show" id="${healthInstance.id}">${fieldValue(bean: healthInstance, field: "name")}</g:link></td>--%>
						
							<td><textarea style="width:515px; height:80px;" readonly="readonly">${fieldValue(bean: healthInstance, field: "fileUrl")}</textarea></td>
						
							<%--<td>${fieldValue(bean: healthInstance, field: "name")}</td>--%>
							<td>
								<a href="${createLink(action:'delete',controller:'health',id:healthInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a data-toggle="modal" href="${createLink(action:'edit',controller:'health',id:healthInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
							</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${healthInstanceTotal}" />
				</div>
			</div>
		</section>
	</div>
		<div class="modal" id="myModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>	
	</body>
</html>
