package com.throne212.tg.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.throne212.tg.web.common.WebConstants;

public class CommonListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void contextInitialized(ServletContextEvent e) {
		// 获取spring容器
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		// 设置应用程序上下文和标题，关键字
		e.getServletContext().setAttribute(WebConstants.APP_PATH, e.getServletContext().getContextPath());
		e.getServletContext().setAttribute(WebConstants.APP_TITLE, "团购导航网站");
		e.getServletContext().setAttribute(WebConstants.APP_KEY_WORDS, "团购导航网站关键词");
		e.getServletContext().setAttribute(WebConstants.APP_DESC, "团购导航网站描述");
		
	}

}
