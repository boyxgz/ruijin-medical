
<!DOCTYPE html>
<html>
<head>
	<title>医患互动</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'web-sql4chat.js') }"></script>
<style>
	html, body { padding: 0; margin: 0; }
	html, .ui-mobile, .ui-mobile body {
    	height: 935px;
	}
	.ui-mobile, .ui-mobile .ui-page {
    	min-height: 935px;
	}
	.ui-content{
		padding:10px 15px 0px 15px;
	}
	.ui-content .ui-listview {
    	margin: -15px -15px 0px -15px;
	}
	*{border:0px solid #000;}

	</style>
	<script type="text/javascript">
		$( document ).ready(function() {
		    initDb();	//初始话本地数据库 
		    fm();
		});

		function changeCount(id){
			var unread_message_count = 0;
			updateCount(id, unread_message_count);
			
		}
		
		function fm() {
			//将消息从服务器去回本地 
			//createLink(controller:"doctorPortal", action:"fetchMsg"),这一段就是返回一组数据嘞 ，然后交给fetcheMessage处理 ，插入本地数据库 
			fetchMessage('${createLink(controller:"doctorPortal", action:"fetchMsg")}');
			patientsNeedcompleting();	//拼接 
			loadPatients();
			setTimeout(fm, 2000);
		}
		var sql = 'select p.doctor_patient_id,p.nickname,p.headImgUrl,p.last_message_id,p.unread_message_count, m.content,m.msg_type,m.messaged_at from patients p left join messages m on p.last_message_id=m.msg_id order by last_message_id desc';

		function loadPatients() {
			function onsuccess(tx, rs) {	//rs返回的结果集
		        var len = rs.rows.length;
		        for(var i = 0; i < len ; i++) {
		        	var row = rs.rows.item(i);
		        	var doctorPatientId = row.doctor_patient_id;
		        	var messageId = row.last_message_id;
		        	var messageAt = row.messaged_at;
		        	messageAt = messageAt.substr(0,16);
		        	var liCotainer = $("#doctorPatientId-"+doctorPatientId);
		        	if(liCotainer.length == 0) {	//当没有这个列的时候，将重新创建一个这样的列 
		                var itemContent = '<li id="doctorPatientId-';
		                itemContent += doctorPatientId;	
		                //id="doctorPatientId-value(doctorPatientId)" 假设列表中有A，B，C 三人，当A发来一条消息的时候，我们不应该在列表中添加一列，而是在A的那个列表中修改内容
		                //然而这个id就是来标记的。 
		                itemContent += '" data-messageId="';
		                itemContent += messageId;
			            itemContent += '"><a href="${createLink(controller:'doctorPortal', action:'chat')}/';
		                itemContent += doctorPatientId;	//传送关联关系的id 
		                itemContent += '" rel="external" id="';
			            itemContent += doctorPatientId;
			            itemContent += '" onclick="changeCount(this.id)"><img id="img_';
			            itemContent += doctorPatientId;
			            itemContent += '"src="';
		                itemContent += row.headImgUrl;
		                itemContent += '" /><h3 id="nickname_';
		                itemContent += doctorPatientId;
		                itemContent += '">';
		                itemContent += row.nickname;
		                itemContent += '</h3><p id="message_content_';
		                itemContent += doctorPatientId;
		                itemContent += '">';
		                itemContent += row.content;
		                itemContent += '</p>';
		                itemContent += '<p style="margin-left:60%; margin-bottom:-20px;">';
		                itemContent += messageAt;
		                itemContent += '</p>'
		                itemContent += '';
		                itemContent += '<p id="message_count_';
		                itemContent += doctorPatientId;
		                itemContent += '" style="border:0px solid #000; width:10px; color:red; margin-top:-4px; margin-right:-15px;" class="ui-li-aside">';
		                itemContent += row.unread_message_count;
		                itemContent += '</p></a></li>';
		                $("#listview").append(itemContent);
		                $("#listview").listview("refresh");
			        } else {
						if(messageId != liCotainer.data('messageId')) {
							liCotainer.data('messageId',messageId);
							$("#message_content_"+doctorPatientId).text( row.content );
						}
						
						var j=1;
						if(j == 1){
							$("#img_"+doctorPatientId).attr("src",row.headImgUrl);
							$("#nickname_"+doctorPatientId).text(row.nickname);
							j++;
						}
						if(row.unread_message_count != 0){
							$("#message_count_"+doctorPatientId).text( row.unread_message_count );
						}
						else{
							$("#message_count_"+doctorPatientId).text('');
						}
								
				    }
		        }
		        initSort();
		    }
			
		    function onerror(tx, error) {
		    }

		    db.transaction(function (tx) {
		        tx.executeSql(sql, [], onsuccess, onerror);
		    })
		}

		function initSort() {
			$("#listview li").sort(resortList).appendTo('#listview');
		}
		function resortList(a, b){
		    return ($(b).data('messageId')) < ($(a).data('messageId')) ? -1 : 1;  //这里进行排序，最新来消息的拍在最上面，消息列表是自增长的。 
		}
</script>
</head>

<body>
<div data-role="page" style="max-height:940px; min-height:940px;">
	<div role="main" class="ui-content">
		<ul id="listview" data-role="listview">
			
		</ul>
	</div>
</div>
</body>
</html>
