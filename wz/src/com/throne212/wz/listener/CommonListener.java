package com.throne212.wz.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		ApplicationContext ac = (ApplicationContext) e.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		
		//typeµÄmap
		
	}

}
