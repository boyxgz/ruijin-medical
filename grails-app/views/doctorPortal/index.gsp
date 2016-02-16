
<!DOCTYPE html>
<html>
<head>
	<title>医患互动</title><meta name="viewport" content="width=device-width, initial-scale=1">
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

	</style>
	<script type="text/javascript">
		$( document ).ready(function() {
		    initDb();
		    fm();
		});

		function fm() {
			fetchMessage();
			patientsNeedcompleting() ;
			loadPatients();
			setTimeout(fm, 2000);
		}
		var sql = 'select p.openid,p.nickname,p.headImgUrl,p.last_message_id,p.unread_message_count, m.content,m.msg_type from patients p left join messages m on p.last_message_id=m.msg_id order by last_message_id desc';

		function loadPatients() {
			function onsuccess(tx, rs) {
		        var len = rs.rows.length;
		        for(var i = 0; i < len; i++) {
		        	var row = rs.rows.item(i);
		        	var openid = row.openid;
		        	var messageId = row.last_message_id;
		        	var liCotainer = $("#"+openid);
		        	if(liCotainer.length == 0) {
		                var itemContent = '<li id="';
		                itemContent += openid;
		                itemContent += '" data-messageId="';
		                itemContent += messageId;
		                itemContent += '"><a href="#"><img src="';
		                itemContent += row.headImgUrl;
		                itemContent += '" /><h3>';
		                itemContent += row.nickname;
		                itemContent += '</h3><p id="message_content_';
		                itemContent += openid;
		                itemContent += '">';
		                itemContent += row.content;
		                itemContent += '</p></a></li>';
		                $("#listview").append(itemContent);
		                $("#listview").listview("refresh");
			        } else {
						if(messageId != liCotainer.data('messageId')) {
							liCotainer.data('messageId',messageId);
							$("#message_content_"+openid).text( row.content );
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
		    return ($(b).data('messageId')) < ($(a).data('messageId')) ? -1 : 1;  
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
