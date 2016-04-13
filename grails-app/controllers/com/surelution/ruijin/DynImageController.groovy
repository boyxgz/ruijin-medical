package com.surelution.ruijin

class DynImageController {

    def patientUpload(Long id) {
		RemoteMedia rm = RemoteMedia.get(id)
		if(rm) {
			String picUrl = rm.url
			URL url = new URL(picUrl)
			response.outputStream << url.openStream()
		}
	}
}
