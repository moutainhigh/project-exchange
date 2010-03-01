package login;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.proj.biz.UserBiz;
import com.throne212.proj.domain.User;

public class LoginTestCase {
	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		UserBiz userBiz = (UserBiz) ac.getBean("userBiz");
		String loginName = "yl";
		String password = "123";
		User user = userBiz.login(loginName, password);
		System.out.println(user);
	}
	
}
