//数据库
var db;

// 数据结构，用来保存每个次从服务器端拉取数据后，每个用户对应的最后消息id和未读消息数，
// 数据内容类似：{'openid1':[lastMsgId1, 未读消息数1], 'sdafdsfdafsafsd':[123,5],
// 'sddsfdafsafsd':[456,9]}
var map = {};

function createDB() {
	var result, name, version, display_name, size

	name = 'chat-local-db'
	version = 1.0
	display_name = 'Chat Database'
	size = 262144 // 256KB

	// parameters: name, version, display name, size (in bytes)
	db = window.openDatabase(name, version, display_name, size)
}

function createTable() {
	var result, patientSql, msgSql;

	patientSql = 'CREATE TABLE IF NOT EXISTS patients(openid TEXT UNIQUE, nickname TEXT, name TEXT, headImgUrl TEXT, last_message_id TEXT, unread_message_count INTEGER);';
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
	var url = '../doctorPortal/fetchMsg';
	$.getJSON(url).done(function( data ) {
		map = {};
		$.each(data, function(){
			var patientId = this.patientId;
			var msgId = this.msgId;
			var openid = this.openid;
			var msg = this.msg;
			var sn = this.sn;
			var dateCreated = this.dateCreated;
			insertMessage(msgId, msg, 'text', dateCreated, openid);
			var v = map[openid];
			if(v == null) {
				v = [msgId, 1];
				map[openid] = v;
			} else {
				v[1] = v[1] + 1;
				if(msgId > v[0]) {
					v[0] = msgId;
				}
			}
		})
	  });
	  updatePatients();
}

function updatePatients() {
	var openid, lastMsgId, unreadCount
	var sql = 'select last_message_id, unread_message_count from patients where openid = ?';
	function onsuccess(tx, rs) {
        var len = rs.rows.length;
        if(len == 0) {
        	insertPatient(openid, lastMsgId, unreadCount);
	    } else {
			var row = rs.rows.item(0);
			var l = row.last_message_id;
			var u = row.unread_message_count;
			if(lastMsgId > l || unreadCount != 0) {
				updatePatient(openid, lastMsgId, u+unreadCount);
			}
		}
    }

    function onerror(tx, error) {
    }

	$.each(map, function(key, value){
		openid = key;
		lastMsgId = value[0];
		unreadCount = value[1];
	    db.transaction(function (tx) {
	        tx.executeSql(sql, [openid], onsuccess, onerror);
	    })
	})
}

function updatePatient(openid, last_message_id, unread_message_count) {
	var sql = 'update patients set last_message_id = ?, unread_message_count = ? where openid=?;';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ last_message_id, unread_message_count, openid ],
				onsuccess, onerror);
	})
}

function insertPatient(openid, last_message_id, unread_message_count) {
	var sql = 'insert into patients(openid, last_message_id, unread_message_count) values (?,?,?);';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ openid, last_message_id, unread_message_count ],
				onsuccess, onerror);
	})
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

function patientsNeedcompleting() {
	var openid, lastMsgId, unreadCount
	var sql = 'select openid from patients where nickname is null and headImgUrl is null';
	function onsuccess(tx, rs) {
        var len = rs.rows.length;
        var patientsId = "";
        for(var i = 0; i < len; i++) {
        	var row = rs.rows.item(i);
        	patientsId += ",";
        	patientsId += row.openid;
        }
        if(patientsId.length > 0) {
        	var url = '../doctorPortal/fetchPatientInfo?openids=' + patientsId;
        	$.getJSON(url).done(function( data ) {
        		$.each(data, function(){
        			var nickname = this.nickname;
        			var headUrl = this.headUrl;
        			var openid = this.openid;
        			var name = this.name;
        			completingPatient(openid, nickname, headUrl, name);
        		})
        	  });
        }
    }

    function onerror(tx, error) {
    }

    db.transaction(function (tx) {
        tx.executeSql(sql, [], onsuccess, onerror);
    })
}

function completingPatient(openid, nickname, headUrl, name) {
	var sql = 'update patients set nickname = ?, headImgUrl = ?, name=? where openid=?;';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ nickname, headUrl, name, openid ],
				onsuccess, onerror);
	})
}

function initDb() {
	createDB();
	createTable();
}
function detectWebSql() {
	var result
	if ('undefined' === typeof window.openDatabase) {
		result = 'This browser does not support Web SQL.'
	} else {
		result = 'This browser does support Web SQL.'
	}
	alert(result);
}