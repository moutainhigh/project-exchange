package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.domain.Admin;

public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		
		baseBiz.saveOrUpdateEntity(admin);
		
	}
}
