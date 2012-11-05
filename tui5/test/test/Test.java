package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.User;

public class Test {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		User user = baseBiz.getEntityById(User.class, Integer.valueOf(2));
		Alliance a = new Alliance();
		a.setDate(new Date());
		a.setSiteName("test");
		a.setSiteURL("http://wewe.we2we.com");
		a.setUser(user);
		baseBiz.saveOrUpdateEntity(a);
		
	}
	
}
