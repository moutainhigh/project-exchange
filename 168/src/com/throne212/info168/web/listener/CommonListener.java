package com.throne212.info168.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.throne212.info168.web.common.WebConstants;

public class CommonListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent e) {
		//设置上下文路径
		e.getServletContext().setAttribute(WebConstants.APP_PATH,e.getServletContext().getContextPath());
	}

}
