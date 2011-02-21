package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.UserLog;

public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		admin.setName("超级管理员");
		
		baseBiz.saveOrUpdateEntity(admin);
		
		UserLog log = new UserLog();
		log.setByWho(admin);
		log.setCreateDate(new Date());
		log.setCreateName(admin.getName());
		log.setEnable(true);
		log.setLogTime(new Date());
		log.setMsg(WebConstants.OP_CREATE);
		log.setUser(admin);
		
		baseBiz.saveOrUpdateEntity(log);
		
		
	}
}
