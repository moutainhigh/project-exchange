package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Org;



public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		baseBiz.saveOrUpdateEntity(admin);
		
		Org org =new Org();
		org.setLoginName("org");
		org.setPassword("123");
		baseBiz.saveOrUpdateEntity(org);
		
	}
}
