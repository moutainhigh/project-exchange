package com.throne212.auto.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.auto.common.WebConstants;


public class CommonListener implements ServletContextListener{
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private ApplicationContext ac = null;

	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent e) {
		logger.info("Into application init function");
		ServletContext app = e.getServletContext();
		app.setAttribute(WebConstants.APP_PATH, app.getContextPath());
		app.setAttribute(WebConstants.APP_TITLE, "张家口汽车网");
		logger.info("this system title is : " + app.getAttribute(WebConstants.APP_TITLE)+" and appPath is " + app.getAttribute(WebConstants.APP_PATH));
		
		
	}

}
