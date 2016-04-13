package com.surelution.ruijin

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.push.GroupInfo


class TempQrScannedAction extends RuijinBaseAction {
	
	private TempQrCode code

	public boolean accept() {
		def qrId
		println qrId
		if(getParam("Event") == "subscribe") {
			def eventKey = getParam("EventKey")
			if(eventKey && eventKey.startsWith("qrscene_")) {
				qrId = eventKey.substring("qrscene_".length())
			}
		} else if(getParam("Event") == "SCAN") {
			qrId = getParam("EventKey")
		}
		
		if(qrId) {
			def id = qrId as Integer
			if(TempQrCode.QR_ID_START_FROM <= id) {
				code = TempQrCode.findByQrKey(id)
			}
		}
		
		code != null
	}

	public void execute() {
		GroupInfo.moveUserToGroup(subscriber.openId, AppVar.findByKey("doctor-group-id")?.value);
		def att = code.scanedBy(subscriber)
		put(att)
	}

}
