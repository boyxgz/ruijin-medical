import com.surelution.whistle.push.Pusher;




public class Menu {

    public static void main(String[] args) throws Exception {
    	Pusher p = new Pusher();
    	p.setApiUrl("https://api.weixin.qq.com/cgi-bin/menu/get?");
    	System.out.println(p.push(null));
//    	com.surelution.whistle.push.Menu.create("D:\\Documents\\Tencent Files\\583853240\\FileRecv\\menu1.txt");
//    	com.surelution.whistle.push.Menu.createConditional("D:\\Documents\\Tencent Files\\583853240\\FileRecv\\menu2.txt");
    }
}
