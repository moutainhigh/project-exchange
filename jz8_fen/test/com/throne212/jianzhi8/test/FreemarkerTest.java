package com.throne212.jianzhi8.test;

import java.io.File;
import java.util.Locale;

import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import freemarker.template.Configuration;

public class FreemarkerTest {

	public static void main(String[] args) {
		
		//File file = new File("/D:/work/servers/apache-tomcat-6.0.35/webapps/jz8_fen/WEB-INF/template/index.ftl");
		//System.out.println(file.exists());
		
		//ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
		//FreemarkerManager freemarkerManager = ac.getBean(FreemarkerManager.class);
		
		Configuration cfg = new Configuration();
		System.out.println(cfg.getLocale());
		System.out.println(cfg.getEncoding(cfg.getLocale()));
		
	}
	
}
