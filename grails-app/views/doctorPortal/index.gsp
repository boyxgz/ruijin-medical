
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="mobile">	
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta name="viewport" content="minimal-ui, width=640, initial-scale=1, maximum-scale=0.5, minimum-scale=0.5, user-scalable=no, target-densitydpi=320"/>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery-1.11.0.min.js') }"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery.mobile-1.3.2.min.js') }"></script>
<title>医患互动</title>
</head>
<body>

   <div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					医患互动
				</h1>
				<%--<ol class="breadcrumb">
					<li><a href="#" style="cursor: none;"><i class="fa fa-dashboard"></i> 首页</a></li>
				</ol>
				--%></section>
	<section class="content">
		<a href="javascript:initDb()">initDb</a><br/><br/>
		
	   <a href="javascript:fetchMessage()">fetch</a><br/><br/>
	   <a href="javascript:select()">select</a><br/>
	
   </section>
   </div>
	<script charset="utf-8" type="text/javascript">

		// in the global scope for simplicity's sake
		var db

		function createDB() {
			var result, name, version, display_name, size

			name = 'html5meetup'
			version = 1.0
			display_name = 'HTML5 East Bay Meetup'
			size = 262144 // 256KB

			// parameters: name, version, display name, size (in bytes)
			db = window.openDatabase(name, version, display_name, size)

		}

		function createTable() {
			var result, patientSql, msgSql;

			patientSql = 'CREATE TABLE IF NOT EXISTS patients(openid TEXT UNIQUE, nickname TEXT, name TEXT, headImgUrl TEXT, last_sent_at TIMESTAMP, last_message_id TEXT, unread_message_count INTEGER);';
			msgSql = 'CREATE TABLE IF NOT EXISTS messages(msg_id TEXT UNIQUE, openid TEXT, content TEXT, msg_type TEXT, received_at TIMESTAMP);';

			function onsuccess(tx) {
				
			}

			function onerror(tx, error) {
				
			}

			db.transaction(function(tx) {
				tx.executeSql(patientSql, [], onsuccess, onerror);
				tx.executeSql(msgSql, [], onsuccess, onerror);
			})
		}

		function fetchMessage() {
			var url = '${createLink(controller:'doctorPortal', action:'fetchMsg')}';
			$.getJSON(url).done(function( data ) {
				$.each(data, function(){
					var patientId = this.patientId;
					var msgId = this.msgId;
					var openid = this.openid;
					var msg = this.msg;
					var sn = this.sn;
					var dateCreated = this.dateCreated;
					insertMessage(msgId, msg, 'text', dateCreated, openid);
				})
			  });
		}

		function insertMessage(msgId, content, msgType, receivedAt, openid) {
			var sql = 'insert into messages(msg_id, openid, content, msg_type, received_at) values (?,?,?,?,?);';

			function onsuccess(tx) {
			}

			function onerror(tx, error) {
			}

			db.transaction(function(tx) {
				tx.executeSql(sql, [ msgId, openid, content, msgType, receivedAt],
						onsuccess, onerror);
			})
		}

		function select() {
			var sql = 'SELECT count(openid) c from messages;'

			function onsuccess(tx, rs) {
				var room = rs.rows.item(0).c;
				alert(room);
			}

			function onerror(tx, error) {
			}

			db.transaction(function(tx) {
				tx.executeSql(sql, [], onsuccess, onerror)
			})
		}

		function deleet(room_name) {
			var result, sql

			sql = 'DELETE FROM rooms ' + 'WHERE room_name = ?;'

			function onsuccess(tx) {
				addResult('Room "' + room_name + '" deleted', deleet)
			}

			function onerror(tx, error) {
				addResult('Houston, we have a problem: ' + error.message,
						deleet)
			}

			db.transaction(function(tx) {
				tx.executeSql(sql, [ room_name ], onsuccess, onerror)
			})
		}
		function initDb() {
			createDB();
			createTable();
		}
		function has() {
			var result
			if ('undefined' === typeof window.openDatabase) {
				result = 'This browser does not support Web SQL.'
			} else {
				result = 'This browser does support Web SQL.'
			}
			alert(result);
		}
		function addResult(str, fn) {
			document.getElementById('result').innerHTML += str + "<br>"
			document.getElementById('code').innerHTML = fn.toString()
			setTimeout(function() {
				sh_highlightDocument('/blog/assets/js/shjs/lang/', '.min.js')
			}, 0)
		}
	</script>
	<script type="text/javascript"
		src="${resource(dir:'js', file:'sh_main.min.js') }"></script>
</body>
</html>
