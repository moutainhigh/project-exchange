package com.throne212.oa.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CommonListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent e) {
		//设置上下文路径
		String path = e.getServletContext().getInitParameter("contextPath");
		//e.getServletContext().setAttribute("appPath","/oa2");
		e.getServletContext().setAttribute("appPath",path);
		System.out.println(e.getServletContext().getAttribute("appPath"));
	}

}
