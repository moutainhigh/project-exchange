package com.throne212.jianzhi8.listener;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Keywords;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.domain.Type;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		ApplicationContext ac = (ApplicationContext) e.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		
		//typeµÄmap
		TypeDAO typeDao = (TypeDAO) ac.getBean("typeDAO");
		List<Type> list = typeDao.getAll();
		Map<String, String> map = new TreeMap<String, String>();
		for(Type t : list){
			map.put(t.getId().getTypeCode(), t.getId().getTypeName());
		}
		e.getServletContext().setAttribute(Consts.TYPE_MAP, map);
		
	}

}
