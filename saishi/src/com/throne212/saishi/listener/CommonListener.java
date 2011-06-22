package com.throne212.saishi.listener;

import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.throne212.saishi.biz.BaseBiz;
import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.comunicate.Handler;
import com.throne212.saishi.comunicate.MultiThreadServer;
import com.throne212.saishi.domain.Admin;



public class CommonListener implements ServletContextListener {

	public static String INFO_URL = "http://";
	private Logger logger = Logger.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void contextInitialized(ServletContextEvent e) {
		try {
			INFO_URL += e.getServletContext().getResource("").getPath();
			INFO_URL = INFO_URL.replaceAll("///", "//");
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		// 获取spring容器
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		// 设置上下文路径
		String appPath = e.getServletContext().getContextPath();
		logger.info("appPath=" + appPath);
		if (!appPath.equals("/")) {
			appPath = appPath + "/";
		}
		e.getServletContext().setAttribute(WebConstants.APP_PATH, appPath);
		//设置系统名称
		e.getServletContext().setAttribute(WebConstants.APP_TITLE, "赛事管理系统");
		//启动服务端服务
		try {
			new Thread(new MultiThreadServer(),"service").start();
			Handler.dataBiz = (DataBiz) ac.getBean("dataBiz");
		} catch (IOException e1) {
			e1.printStackTrace();
			logger.warn("服务端服务启动失败", e1);
		}
		
		// 插入系统管理员sa
		//ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		if (baseBiz.getAll(Admin.class) == null || baseBiz.getAll(Admin.class).size() == 0) {
			Admin admin = new Admin();
			admin.setLoginName("sa");
			admin.setPassword("123");
			admin.setName("超级管理员");
			admin.setRemark("系统最高管理员，拥有一切权限");
			baseBiz.saveOrUpdateEntity(admin);

		}
	}

}

