package com.throne212.fupin.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.sms.SmsServicePortType;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());
	
	public static SmsServicePortType sme;

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		// 获取spring容器
		//ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		// 设置上下文路径
		String appPath = e.getServletContext().getContextPath();
		logger.info("appPath=" + appPath);
		if (!appPath.equals("/")) {
			appPath = appPath + "/";
		}
		e.getServletContext().setAttribute(WebConstants.APP_PATH, appPath);
		//设置系统名称
		e.getServletContext().setAttribute(WebConstants.APP_TITLE, "广州市扶贫信息管理系统");
		
		//SmsServicePortType sme = new SmsService().getSmsServiceHttpPort();
		//sme.sendMessageToMobile("192.168.2.28","oa","mas","oa","oa123456",phoneStr,conntent,smsUserName,smsUserId);
	}

}
