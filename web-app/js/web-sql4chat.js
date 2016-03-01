//数据库
var db;

// 数据结构，用来保存每个次从服务器端拉取数据后，每个用户对应的最后消息id和未读消息数，
// 数据内容类似：{'doctorPatientId1':[lastMsgId1, 未读消息数1], '1':[123,5], '2':[456,9]}
var map = {};

function createDB() {
	var result, name, version, display_name, size

	name = 'chat-local-db91'
	version = 1.0
	display_name = 'Chat Database'
	size = 262144 // 256KB

	// parameters: name, version, display name, size (in bytes)
	db = window.openDatabase(name, version, display_name, size)
}

function createTable() {
	var result, patientSql, msgSql;

	patientSql = 'CREATE TABLE IF NOT EXISTS patients(doctor_patient_id INTEGER UNIQUE, nickname TEXT, name TEXT, headImgUrl TEXT, last_message_id TEXT, unread_message_count INTEGER,doctorName TEXT);';
	msgSql = 'CREATE TABLE IF NOT EXISTS messages(msg_id TEXT UNIQUE, doctor_patient_id INTEGER, content TEXT, msg_type TEXT, messaged_at TIMESTAMP, in_or_out INTEGER, is_read INTEGER);';
	
	function onsuccess(tx) {
		
	}

	function onerror(tx, error) {
		
	}

	db.transaction(function(tx) {
		tx.executeSql(patientSql, [], onsuccess, onerror);
		tx.executeSql(msgSql, [], onsuccess, onerror);
	})
}

function newMessage(){
	
	$("#newMessage").css("color","red");
	$("#newMessage").text("您有新的消息");
}

function changeColor(){
	
	$("#newMessage").text("");
	setTimeout(changeColor, 3000);
}

function fetchMessage(target) {
	$.getJSON(target).done(function( data ) {
		map = {};
		$.each(data, function(){
			var doctorPatientId = this.doctorPatientId;
			var msgId = this.msgId;
			var msg = this.msg;
			var inOrOut = this.inOrOut;
			var dateCreated = this.dateCreated;
			var isRead = this.isRead;
			var doctorName = this.doctorName;
			var msgType = this.msgType;
			insertMessage(msgId, msg, msgType, dateCreated, doctorPatientId, inOrOut,isRead);
			if(msgId != null){
				newMessage();
			}
			var v = map[doctorPatientId];
			if(v == null) {
				v = [msgId, 1,doctorName];
				map[doctorPatientId] = v;
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

function sendMessage(target, content) {
	//var url = target + "/" + doctorPatientId;
	$.getJSON(target, { content: content }).done(function( data ) {
		map = {};
		$.each(data, function(){
			var doctorPatientId = this.doctorPatientId;
			var msgId = this.msgId;
			//var openid = this.openid;
			var msg = this.msg;
			//var sn = this.sn;
			var inOrOut = this.inOrOut;
			var dateCreated = this.dateCreated;
			var isRead = this.isRead;
			insertMessage(msgId, msg, 'text', dateCreated, doctorPatientId, inOrOut, isRead);
			var v = map[doctorPatientId];
			if(v == null) {
				v = [msgId, 1];
				map[doctorPatientId] = v;
			} else {
				//v[1] = v[1] + 1;	//没有必要记录发送出去，客人有没有读吧。
				if(msgId > v[0]) {
					v[0] = msgId;
				}
			}
		})
	  });
	  updatePatients();
}

function updatePatients() {
	var doctorPatientId, lastMsgId, unreadCount, doctorName
	var sql = 'select last_message_id, unread_message_count, doctorName from patients where doctor_patient_id = ?';

	$.each(map, function(key, value){
		doctorPatientId = key;
		lastMsgId = value[0];
		unreadCount = value[1];
		doctorName = value[2];
	    db.transaction(function (tx) {
	        tx.executeSql(sql, [key], onsuccess, onerror);
	    })
	})

	function onsuccess(tx, rs) {
        var len = rs.rows.length;
        if(len == 0) {
        	insertPatient(doctorPatientId, lastMsgId, unreadCount,doctorName);
	    } else {
			var row = rs.rows.item(0);
			var l = row.last_message_id;
			var u = row.unread_message_count;
			if(lastMsgId > l || unreadCount != 0) {
				updatePatient(doctorPatientId, lastMsgId, u+unreadCount);
			}
		}
    }

    function onerror(tx, error) {
    }
}

function updatePatient(doctorPatientId, last_message_id, unread_message_count) {
	var sql = 'update patients set last_message_id = ?, unread_message_count = ? where doctor_patient_id=?;';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ last_message_id, unread_message_count, doctorPatientId ],
				onsuccess, onerror);
	})
}

function updateCount(doctorPatientId,unread_message_count) {
	var sql = 'update patients set unread_message_count = ? where doctor_patient_id=?;';

	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [unread_message_count, doctorPatientId ],
				onsuccess, onerror);
	})
}

function updateRead(msgId, read){
	var sql = 'update messages set is_read = ? where msg_id = ?;';
	function onsuccess(tx) {
	}
	
	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [read, msgId],
				onsuccess, onerror);
	})
}

function insertPatient(doctorPatientId, last_message_id, unread_message_count,doctorName) {
	var sql = 'insert into patients(doctor_patient_id, last_message_id, unread_message_count,doctorName) values (?,?,?,?);';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ doctorPatientId, last_message_id, unread_message_count, doctorName ],
				onsuccess, onerror);
	})
}

function insertMessage(msgId, content, msgType, receivedAt, doctorPatientId, inOrOut, isRead) {
	var sql = 'insert into messages(msg_id, doctor_patient_id, content, msg_type, messaged_at,in_or_out, is_read) values (?,?,?,?,?,?,?);';

	function onsuccess(tx) {
	}
	
	function onerror(tx, error) {
	}
	
	db.transaction(function(tx) {
		tx.executeSql(sql, [ msgId, doctorPatientId, content, msgType, receivedAt, inOrOut, isRead],
				onsuccess, onerror);
	})
}

function patientsNeedcompleting() {
	var lastMsgId, unreadCount
	var sql = 'select doctor_patient_id from patients where nickname is null and headImgUrl is null';

    db.transaction(function (tx) {
        tx.executeSql(sql, [], onsuccess, onerror);
    })

	function onsuccess(tx, rs) {
        var len = rs.rows.length;
        var doctorPatientIds = "";
        for(var i = 0; i < len; i++) {
        	var row = rs.rows.item(i);
        	doctorPatientIds += ",";
        	doctorPatientIds += row.doctor_patient_id;
        }
        if(doctorPatientIds.length > 0) {
        	var url = '../doctorPortal/fetchPatientInfo/' + doctorPatientIds;
        	$.getJSON(url).done(function( data ) {
        		$.each(data, function(){
        			var nickname = this.nickname;
        			var headUrl = this.headUrl;
        			var doctorPatientId = this.doctorPatientId;
        			var name = this.name;
        			completingPatient(doctorPatientId, nickname, headUrl, name);
        		})
        	  });
        }
    }

    function onerror(tx, error) {
    }
}

function completingPatient(doctorPatientId, nickname, headUrl, name) {
	var sql = 'update patients set nickname = ?, headImgUrl = ?, name=? where doctor_patient_id=?;';
	function onsuccess(tx) {
	}

	function onerror(tx, error) {
	}
	db.transaction(function(tx) {
		tx.executeSql(sql, [ nickname, headUrl, name, doctorPatientId ],
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
		result = '本功能要求软件必须支持 Web SQL.'
	} else {
		result = '系统不支持 Web SQL.'
	}
	alert(result);
}