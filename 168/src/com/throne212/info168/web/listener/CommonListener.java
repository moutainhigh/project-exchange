package com.throne212.info168.web.listener;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.throne212.info168.web.action.AdminAction;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.HotCitySetting;
import com.throne212.info168.web.domain.KeyWordSetting;
import com.throne212.info168.web.domain.LinkSetting;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

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
		// 友情链接数据缓存
		List linkList = commonBiz.getSetting(LinkSetting.class);
		e.getServletContext().setAttribute(WebConstants.FREIND_LINKS, linkList);
		// 关键词有数缓存
		List keywordsList = commonBiz.getSetting(KeyWordSetting.class);
		e.getServletContext().setAttribute(WebConstants.KEY_WORD_LIST, keywordsList);
		// 栏目数据缓存
		List allCates = commonBiz.getCates();
		e.getServletContext().setAttribute(WebConstants.ALL_CATES, allCates);
		// 设置上下文路径
		String appPath = e.getServletContext().getContextPath();
		logger.info("appPath=" + appPath);
		if (appPath.equals("/")) {
			appPath = "";
		}
		e.getServletContext().setAttribute(WebConstants.APP_PATH, appPath);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path + File.separator + "site.properties";
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(path), "GBK"));
			Properties props = new Properties();
			props.load(reader);
			e.getServletContext().setAttribute(WebConstants.APP_TITLE, props.get("site_title"));
			e.getServletContext().setAttribute(WebConstants.APP_DESC, props.get("site_desc"));
			e.getServletContext().setAttribute(WebConstants.APP_KEY_WORDS, props.get("site_keywords"));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		updateStaticViews();
	}

	// 定时更新信息静态页面
	private void updateStaticViews() {
		Calendar sTime = GregorianCalendar.getInstance();
		sTime.setTime(new Date());
		sTime.set(GregorianCalendar.MINUTE, 0);
		sTime.set(GregorianCalendar.SECOND, 0);
		sTime.set(GregorianCalendar.HOUR_OF_DAY, 3);
		new Timer(true).schedule(new TimerTask() {
			@Override
			public void run() {
				try {
					if (AdminAction.instance != null)
						AdminAction.instance.generateHtml();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}, new Date(sTime.getTimeInMillis()), 1000 * 60 * 60 * 24 * 3 );// 3天一次，每天的凌晨3点
	}
}
