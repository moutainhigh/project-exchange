package test;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.User;

public class BBSTest_AddUser {

	public static void main(String[] args) throws Exception{
		URL url = null;
		url = new URL("http://localhost:8080/jeebbs/jeeadmin/jeebbs/user/o_save.do");
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		UserDao userDao = (UserDao) ac.getBean("userDao");
		List<User> userList = userDao.getAll(User.class);
		for(User user : userList){
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			setReqProperties(conn);
			conn.connect();
			
			OutputStream out = conn.getOutputStream();
			StringBuffer sb = new StringBuffer();
			sb.append("username="+user.getLoginName()+"&password=123&captcha=sunpbsb&cookieType=4&processUrl=http%3A%2F%2Flocalhost%3A8080%2Fjeebbs%2F%3Flocale%3Dzh_CN&returnUrl=http%3A%2F%2Flocalhost%3A8080%2Fjeebbs%2F&submit=%E7%99%BB%E5%BD%95");
			out.write(sb.toString().getBytes(), 0, sb.length());
			out.flush();
			
			System.out.println("getting head >>>>>>>>>>>>>>>>> ");
			Map map = conn.getHeaderFields();
			for(Object o : map.keySet()){
				//System.out.println("["+o+"]\t=\t["+map.get(o)+"]");
			}
			System.out.println("getting head end <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ");
			
			int sum = 0;
			int len = -1;
			InputStream in = conn.getInputStream();
			byte[] buff = new byte[1024];
			long startTime = System.currentTimeMillis();
			while((len=in.read(buff))!=-1){
				sum += len;
				String str = new String(buff,0,len,"UTF-8");
				//System.out.println(str);
			}
			long endTime = System.currentTimeMillis();
			System.out.println("用时：" + (endTime-startTime)/1000/60 +"分钟");
			in.close();
		}
		
	}
	
	static void setReqProperties(HttpURLConnection conn){
		conn.setRequestProperty("Host", "localhost");
		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0");
		conn.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		conn.setRequestProperty("Accept-Language", "zh-cn,zh;q=0.5");
		conn.setRequestProperty("Accept-Encoding", "gzip, deflate");
		conn.setRequestProperty("Accept-Charset", "gb2312,utf-8;q=0.7,*;q=0.7");
		conn.setRequestProperty("Keep-Alive", "3000");
		conn.setRequestProperty("Connection", "keep-alive");
		//conn.setRequestProperty("Proxy-Connection", "keep-alive");
		conn.setRequestProperty("Proxy-Connection", "keep-alive");
		conn.setRequestProperty("Pragma", "no-cache");
		//conn.setRequestProperty("Referer", "	http://sc.189.cn/service/jf/jf_action_record.jsp");
		conn.setRequestProperty("X-Buffalo-Version", "2.0");
		//conn.setRequestProperty("Cookie", "pvid=4741082042; flv=10.0 r22; r_cookie=910932614156; pt2gguin=o0041666693; ptcz=37388cb25e8774273466e68d14709f598c06d6fc7a00540cdc1563a20d73d26b; o_cookie=41666693; CCSHOW=000000; noteorg=; foxacc=0; edition=4m76.mail.qq.com; showToday=1; comment_skey=6a5934c4a8138815f26ad7d1a7007858 ThRone.../db; comment_uin=41666693 %u0054%u0068%u0052%u006f%u006e%u0065%u002e%u002e%u002e%u002f%u0064%u0062; pgv=ssid=s235628000; verifysession=c2736d1933482d729b71db049f277869f3cbffcd4b5ee4250d316b6ca975d976ba32af2b852c0077; uin=o0041666693; skey=@YW5YHEJ0h; wqqs=0001bdbc2f5df3bfa0165310b45b0ba296d915ee873b797e; wimrefreshrun=; qqmail_alias=41666693@qq.com; qqmail_sid=43daf0ff94306cd697c1337162744f25; qqmail_username=41666693; qqmail_domain=http://m76.mail.qq.com; qqmail_key=1_3a1dcdd09723fb61b32cb604fc08a874010b0d0e0f0506040609; exstype=2; tinfo=1259902748.8467; sid=43daf0ff94306cd697c1337162744f25; username=41666693");
	}
	
}
