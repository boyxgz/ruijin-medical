
<%@ page import="com.surelution.ruijin.WokingType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'wokingType.label', default: 'WokingType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<style>
		   .modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:45%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
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
					医生班次种类 <small></small>
				</h1>
				<div class="c1" style=" border-bottom: 1px solid #e5e5e5;margin-bottom:10px; margin-top:10px;">
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
			<g:link class="create" action="create" data-toggle="modal" data-target="#createModal">新建班次种类</g:link>
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
		<div id="list-wokingType" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
						<g:sortableColumn property="description" title="${message(code: 'wokingType.description.label', default: '描述')}" class="alink"/>
						<g:sortableColumn property="name" title="${message(code: 'wokingType.name.label', default: '班种')}" class="alink"/>
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${wokingTypeInstanceList}" status="i" var="wokingTypeInstance">
					<tr>
					
						<td>${fieldValue(bean: wokingTypeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: wokingTypeInstance, field: "name")}</td>
					    <td>
					        <a href="${createLink(action:'delete',controller:'wokingType',id:wokingTypeInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							   &nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'wokingType',id:wokingTypeInstance.id) }" data-target="#myModal" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="编辑"></a>
					    </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="modal" id="myModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>	
			<div class="pagination">
				<g:paginate total="${wokingTypeInstanceTotal}" />
			</div>
		</div>
		</section>
		</div>
	</body>
</html>
