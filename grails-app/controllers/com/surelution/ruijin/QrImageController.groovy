package com.surelution.ruijin

import com.surelution.whistle.push.qrcode.QrCode;

class QrImageController {

	def tempQr(String id) {
		def os = response.outputStream
		def content = QrCode.getTempQr(id, 30 * 60 * 1000)
		os << content
	}
}
