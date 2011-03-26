package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.saishi.biz.BaseBiz;
import com.throne212.saishi.domain.Admin;

public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		admin.setName("超级管理员");
		admin.setRemark("系统最高管理员，拥有一切权限");
		baseBiz.saveOrUpdateEntity(admin);
		

		
	}
}
