<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<g:set var="doctor" value="${UserInfo.loadUserInfo(dp.doctor.subscriber.openId) }"/>
<g:set var="patient" value="${UserInfo.loadUserInfo(dp.patient.subscriber.openId) }"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--<meta name="viewport" content="width=device-width, initial-scale=1"/>
--%><meta http-equiv="Content-Type" content="text/html; charset=gb2312" ></meta>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" ></meta>
<title>与${patient.nickname }的互动</title>
<!--讨论区滚动条begin-->
<link rel="stylesheet" type="text/css" href="${resource(file:'css/jscrollpane1.css') }" ></link>
<link rel="stylesheet" type="text/css" href="${resource(file:'css/bootstrap.min.css') }" ></link>
<link rel="stylesheet" type="text/css" href="${resource(file:'css/jquery-ui.css') }" ></link>
<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
<script type="text/javascript" src="${resource(file:'js/jquery-ui.js') }"></script>
<script type="text/javascript" src="${resource(file:'js/jquery.jscrollpane.min.js')}"></script>
<script type="text/javascript" src="${resource(file:'js/scroll-startstop.events.jquery.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'web-sql4chat.js?v=2') }"></script>
<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
	<style>
		h3{margin-top:5px;}
		body{line-height:0px;}
		div.myImage{display: none; width:100%; height:100%;}
	</style>
	<script type="text/javascript">
		var lastMessageId = 0;
		$( document ).ready(function() {
		    initDb();
			
		    var height = 0;
		    $('#jp-container div').each(function(i, value){
		        height += parseInt($(this).height());
		    });

		    height += '';

		    $('#jp-container').animate({scrollTop: height});

		    fm();
		    changeColor();
		});

		
		function fm() {
			fetchMessage('${createLink(controller:"doctorPortal", action:"fetchMsg")}');
			showNewMessage();
			var count = 0;
			updateCount(${dp.id}, count);
			setTimeout(fm, 2000);
		}

		 var lastMsgId = 0;
		function showNewMessage() {
			var sql = 'select msg_id, content, msg_type, messaged_at, in_or_out, is_read from messages where doctor_patient_id = ? and msg_id > ? order by msg_id';
		
			function onsuccess(tx, rs) {
		        var len = rs.rows.length;
		        
		        for(var i = 0; i < len; i++) {
		        	var row = rs.rows.item(i);
		        	if(row.msg_id > lastMsgId){
			        	var read = 1;
			        	var msgId = row.msg_id;
			        	updateRead(msgId, read);
			        	lastMsgId = row.msg_id;
			        	var content = row.content;
			        	if(row.in_or_out == 0 ){
			        		var dn = "${dp?.doctor?.name}" + "回复：";
				        	content = content.substr(dn.length,content.length);
			        		var c = buildContent(row.in_or_out, content, row.messaged_at, row.msg_id, row.msg_type);
				        }else{
				        	var c = buildContent(row.in_or_out, content, row.messaged_at, row.msg_id, row.msg_type);
					    }
					    
			        	console.log($("#jp-container"));
			        	$("#jp-container").append(c);
			        	sorcllIntoView();
			        }
		        	
		        }
		    }
			
		    function onerror(tx, error) {
			    console.log(error);
		    }
			
		    db.transaction(function (tx) {
		        tx.executeSql(sql, [${dp.id}, lastMessageId], onsuccess, onerror);
		        
		    })		   
		}
		
		
		function buildContent(inOrOut, content, messagedAt, msgId, msgType) {
			var ic = '<div style=" height:auto; overflow:auto;" class="';
			var msgAt = messagedAt.substr(0,16);
			if(inOrOut == 1) {
				ic += 'talk_recordbox';
			} else {
				ic += 'talk_recordboxme';
			}
			ic += '" id="';
			ic += msgId;
			ic += '"><div class="user">';
			
			if(inOrOut == 1){
				ic += '<g:link action="patientInformation" id="${dp?.id}"  data-toggle="modal" data-target="#patientModal"><img src="';
			}else{
				ic += '<img src="';
			}
			
			if(inOrOut == 1) {
				ic += '${patient.headImgUrl }';
			} else {
				ic += '${doctor.headImgUrl }';
			}
			ic += '" width="45" height="45"/></g:link>';
			ic += '</div><div class="talk_recordtextbg">&nbsp;</div><div class="talk_recordtext" style="height:;" id="recordtext_';
			ic += msgId;
			ic += '">'; 
			if(msgType == "text") {
				ic += '<h3>';
				ic += content;
				ic += '</h3>'; 
			}else if(msgType == "image"){
				ic += '<g:link action="showImg" data-toggle="modal" data-target="#showimg"><img class="preview" id="previe_';
				ic += msgId;
				ic += '" src="';
				ic += content;
				ic += '" width="30%" height="30%" onclick="showPic(\'';
				ic += content
				ic += '\')"/></g:link>';
			}
			ic += '<span class="talk_time">';
			ic += msgAt;
			ic += '</span></div></div><div style="width:100%; height:30px;"></div>';
			return ic;
		}
	    
		function sorcllIntoView(){
			var talkRecord = document.getElementById("talk_record");
			talkRecord.scrollTop = talkRecord.scrollHeight;
		}

		$(function(){
			$("a[data-target=#patientModal]").click(function(event) {
				$(this).data('patientModal',null)
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#patientModal").load(target, function() { 
				    	$("#patientModal").addClass("modalstyle")
		                $("#patientModal").modal('show');  }); 				    	
				    });
			});
	</script>
<!--讨论区滚动条end-->
</head>
<body>
<div class="talk">
	<div class="talk_title"><span id="newMessage"></span></div>
	<div class="modal modalstyle" id="patientModal" role="dialog">
	<div class="modal-dialog">
     	<%--Modal content --%>
	    <div class="modal-content"> 
	    </div>
    </div>
</div>
	<div class="talk_record" style="overflow:auto; width:100%;" id="talk_record">
	<div>
		<div id="jp-container" class="jp-container">
		
		</div>
		<div class="modal fade" id="showimg" role="dialog">
            <div class="modal-dialog">
	            <div class="modal-content"> 
	            </div>
            </div>
        </div>
	</div>
	</div>
	
	<div class="talk_word">
		<div style="width:100%; height:8px;"></div>
		<input id="txtMessage" class="messages emotion" placeholder="在这里输入文字" style="float:left;"></input>
		<input class="talk_send" id="send" type="button" title="发送" value="发送" onclick="sendMsg()" style="float:right;" ></input>
	</div>
</div>

<script type="text/javascript">
function showPic(imgUrl) {
	$('#chatImage').attr('src', imgUrl);
}
function sendMsg() {
	
	var msg = $('#txtMessage').val();
	if(msg.length != 0){
		var len;
		for(var i=msg.lenth-1; i<0; i++){
			if(msg[i] != " "){
				len = i;
			}
		}
		msg.substr(0,len);
		$('#txtMessage').val(msg);
		for(var i=0; i<msg.length; i++){
			if(msg[i] != " "){
				sendMessage('${createLink(controller:"doctorPortal", action:"sendMessage", id:dp.id)}', $('#txtMessage').val());
				$('#txtMessage').val("");
				return;
			}
		}
	}
	alert("请输入消息！");
}
</script>	
<%--<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>
--%></body>
</html>