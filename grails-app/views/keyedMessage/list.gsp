<%@ page import="com.surelution.ruijin.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }">
		<style>
			.modalstyle{width:500px; height:400px; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
			.modal-backdrop{display:none;}
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
		</section>
		<section class="content">
			<div style="padding-bottom:15px;">
				<g:link class="btn btn-default" action="create" data-toggle="modal" data-target="#createModal">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
				<div class="modal fade in" id="createModal" role="dialog">
			            <div class="modal-dialog">
				            <div class="modal-content"> 
				            </div>
			            </div>
	             	</div>
			</div>
			<table class="table table-bordered table-repose">
				<thead>
					<tr>
					
						<g:sortableColumn class="alink" property="key" title="${message(code: 'keyedMessage.key.label', default: 'Key')}" />
					
						<g:sortableColumn class="alink" property="description" title="${message(code: 'keyedMessage.description.label', default: 'Description')}" />
					
						<g:sortableColumn class="alink" property="message" title="${message(code: 'keyedMessage.message.label', default: 'Message')}" style="width:600px;"/>
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${keyedMessageInstanceList}" status="i" var="keyedMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${keyedMessageInstance.id}">${fieldValue(bean: keyedMessageInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: keyedMessageInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: keyedMessageInstance, field: "message")}</td>
						
						<td>
							<a href="${createLink(action:'delete',controller:'keyedMessage',id:keyedMessageInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'keyedMessage',id:keyedMessageInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${keyedMessageInstanceTotal}" />
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
