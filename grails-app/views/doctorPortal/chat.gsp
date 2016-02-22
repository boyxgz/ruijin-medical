<%@ page contentType="text/html;charset=UTF-8" %>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="${resource(file:'js/jquery.jscrollpane.min.js')}"></script>
<script type="text/javascript" src="${resource(file:'js/scroll-startstop.events.jquery.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'web-sql4chat.js?v=2') }"></script>

	<style>
		 #Demo { position:relative; }
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
		        		var c = buildContent(row.in_or_out, row.content, row.messaged_at);
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
		
		
		function buildContent(inOrOut, content, messagedAt) {
			var ic = '<div class="';
			var msgAt = messagedAt.substr(0,16);
			if(inOrOut == 1) {
				ic += 'talk_recordbox';
			} else {
				ic += 'talk_recordboxme';
			}
			ic += '"><div class="user"><img src="';
			if(inOrOut == 1) {
				ic += '${patient.headImgUrl }';
			} else {
				ic += '${doctor.headImgUrl }';
			}
			ic += '" width="45" height="45"/>';
			ic += '</div><div class="talk_recordtextbg">&nbsp;</div><div class="talk_recordtext"><h3>';
			ic += content;
			ic += '</h3><span class="talk_time">';
			ic += msgAt;
			ic += '</div></div>';
			return ic;
		}

		function sorcllIntoView(){
			var talkRecord = document.getElementById("talk_record");
			talkRecord.scrollTop = talkRecord.scrollHeight;
		}
	</script>
<!--讨论区滚动条end-->
</head>
<body>
<%--<div style="width: 100%; height:3px;"></div>
--%><div class="talk">
	<div class="talk_title"><span id="newMessage">您有新的消息</span></div>
	<div class="talk_record" style="overflow:auto; width:100%;" id="talk_record">
	<div>
		<div id="jp-container" class="jp-container">
		
		</div>
		<div id="msg_end" style="height:0px; overflow:hidden;"></div>
	</div>
	</div>
	
	<div class="talk_word">
		<input id="txtMessage" class="messages emotion" placeholder="在这里输入文字" ></input>
		<input class="talk_send" id="send" type="button" title="发送" value="发送" onclick="sendMsg()" ></input>
	</div>
</div>

<script type="text/javascript">
function sendMsg() {
	var msg = $('#txtMessage').val();
	if(msg.length != 0){
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