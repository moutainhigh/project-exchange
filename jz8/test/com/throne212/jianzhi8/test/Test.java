package com.throne212.jianzhi8.test;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.jianzhi8.dao.ContentDAO;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
		ContentDAO cDao = (ContentDAO) ac.getBean("contentDAO");
		cDao.getClass();
		SessionFactory sf = cDao.getSessionFactory();
		System.out.println(sf.getAllClassMetadata());
		cDao.findById(729953);
	}

}
