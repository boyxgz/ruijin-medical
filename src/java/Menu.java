import com.surelution.whistle.push.Pusher;




public class Menu {

    public static void main(String[] args) throws Exception {
    	Pusher p = new Pusher();
    	p.setApiUrl("https://api.weixin.qq.com/cgi-bin/menu/get?");
    	System.out.println(p.push(null));
    	com.surelution.whistle.push.Menu.create("C:\\Users\\Administrator\\Desktop\\temp\\menu1.txt");
    	com.surelution.whistle.push.Menu.createConditional("C:\\Users\\Administrator\\Desktop\\temp\\menu2.txt");
    }
}
