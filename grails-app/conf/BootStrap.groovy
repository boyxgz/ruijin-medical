import com.surelution.ruijin.User

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:'root',enable:true, password:'123456')
		user.save(flush:true)
    }
    def destroy = {
    }
}
