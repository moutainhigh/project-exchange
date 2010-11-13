package com.throne212.info168.web.listener;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.HotCitySetting;

public class CommonListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void contextInitialized(ServletContextEvent e) {
		// 获取spring容器
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		CommonBiz commonBiz = (CommonBiz) ac.getBean("commonBiz");
		// 城市拼音数据缓存
		Map map = commonBiz.getAllCitiesByPinyin();
		e.getServletContext().setAttribute(WebConstants.CITY_BY_PINYIN, map);
		// 热门城市数据缓存
		List hotCities = commonBiz.getSetting(HotCitySetting.class);
		e.getServletContext().setAttribute(WebConstants.HOT_CITIES, hotCities);
		// 栏目数据缓存
		List allCates = commonBiz.getCates();
		e.getServletContext().setAttribute(WebConstants.ALL_CATES, allCates);
		// 设置上下文路径
		e.getServletContext().setAttribute(WebConstants.APP_PATH, e.getServletContext().getContextPath());
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path + File.separator + "site.properties";
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(path),"UTF-8"));
			Properties props = new Properties();
			props.load(reader);
			e.getServletContext().setAttribute(WebConstants.APP_TITLE, props.get("site_title"));
			e.getServletContext().setAttribute(WebConstants.APP_DESC, props.get("site_desc"));
			e.getServletContext().setAttribute(WebConstants.APP_KEY_WORDS, props.get("site_keywords"));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally{
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		
	}

}
