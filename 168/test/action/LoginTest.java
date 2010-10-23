package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.domain.User;

public class LoginTest {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		UserBiz userBiz = (UserBiz) ac.getBean("userBiz");
		User user = userBiz.login("admin", "123");
		System.out.println(user);
	}
}
