<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.whistle.push.UserInfo"%>
<g:set var="doctor" value="${UserInfo.loadUserInfo(dp.doctor.subscriber.openId) }"/>
<g:set var="patient" value="${UserInfo.loadUserInfo(dp.patient.subscriber.openId) }"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>与${patient.nickname }的互动</title>

<!--讨论区滚动条begin-->
<link rel="stylesheet" type="text/css" href="${resource(file:'css/jscrollpane1.css') }" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="${resource(file:'js/jquery.jscrollpane.min.js')}"></script>
<script type="text/javascript" src="${resource(file:'js/scroll-startstop.events.jquery.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'web-sql4chat.js?v=2') }"></script>
	
	<script type="text/javascript">
		var lastMessageId = 0;
		var unreadMesCount = 0;
		$( document ).ready(function() {
		    initDb();
		    showNewMessage();
		    
		    var height = 0;
		    $('#jp-container div').each(function(i, value){
		        height += parseInt($(this).height());
		    });

		    height += '';

		    $('#jp-container').animate({scrollTop: height});

		    
			
		    fm();
		});

		function fm() {
			fetchMessage('${createLink(controller:"doctorPortal", action:"fetchMsg")}');
			setTimeout(fm, 2000);
		}

		
		function showNewMessage() {
			var sql = 'select msg_id, content, msg_type, messaged_at, in_or_out from messages where doctor_patient_id = ? and msg_id > ? order by msg_id';
			
			function onsuccess(tx, rs) {
		        var len = rs.rows.length;
		        for(var i = 0; i < len; i++) {
		        	var row = rs.rows.item(i);
		        	var c = buildContent(row.in_or_out, row.content, row.messaged_at);
		        	console.log($("#jp-container"));
		        	$("#jp-container").append(c);
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
			ic += messagedAt;
			ic += '</div></div>';
			return ic;
		}
	</script>
<!--讨论区滚动条end-->
</head>
<body>
<div class="talk">
	<div class="talk_title"><span>xxx</span></div>
	<div class="talk_record">
		<div id="jp-container" class="jp-container">
		</div>
	
	</div>
	
	<div class="talk_word">
		<input id="txtMessage" class="messages emotion" placeholder="在这里输入文字" />
		<input class="talk_send" type="button" title="发送" value="发送" onclick="sendMsg()"/>
	</div>
</div>


<script type="text/javascript">
function sendMsg() {
	sendMessage('${createLink(controller:"doctorPortal", action:"sendMessage", id:dp.id)}', $('#txtMessage').val());
	$('#txtMessage').val("");
}
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></body>
</html>