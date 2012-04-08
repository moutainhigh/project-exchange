package com.throne212.jianzhi8.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.springframework.stereotype.Service;

import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.HtmlConfig;
import com.throne212.jianzhi8.common.Keywords;
import com.throne212.jianzhi8.dao.LinkDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.domain.Link;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.User;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service("htmlBuildService")
public class HtmlBuildService {
	
	private static int buildTime = 0;
	
	private static String templatePath = null;

	public static String getTemplatePath() {
		if(templatePath != null)
			return templatePath;
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "WEB-INF/template/";
		templatePath = path;
		return path;
	}

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private FreemarkerManager freemarkerManager;
	
	@Resource
	private ServletContext servletContext;
	
	@Resource
	private LinkDAO linkDAO;
	
	@Resource
	private RegionDAO regionDAO;
	
	@Resource
	private ViewBiz viewBiz;
	
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	
	
	public void buildHtml(String templateFilePath, String htmlFilePath, Map<String, Object> data) {
		try {
			Configuration configuration = freemarkerManager.getConfiguration(servletContext);
			
			// debug cfgs
			//logger.debug(configuration.getLocale());
			//logger.debug(configuration.getEncoding(configuration.getLocale()));
			
			configuration.setDirectoryForTemplateLoading(new File(getTemplatePath()));
			Template template = configuration.getTemplate(templateFilePath);
			//File htmlFile = new File(servletContext.getRealPath("html/" + htmlFilePath));
			File htmlFile = new File(getTemplatePath() + htmlFilePath);
			File htmlDirectory = htmlFile.getParentFile();
			if (!htmlDirectory.exists()) {
				htmlDirectory.mkdirs();
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "GBK"));
			template.process(data, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	public Map<String, Object> getCommonData(Region city) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("city", city);
		//友情链接
		List<Link> linkList = linkDAO.getLinkInCity(city.getCityCode());
		map.put("linkList", linkList);
		//兼职列表
		List<ContentDO> jzList = viewBiz.indexZhaopinRegdateListContent(city.getCityCode());
		map.put("jzList", jzList);
		//热点列表
		List<ContentDO> hotList = viewBiz.indexZhaopinEnddateListContent(city.getCityCode());
		map.put("hotList", hotList);
		//求职列表
		List<ContentDO> qiuzhiList = viewBiz.indexQiuzhiUpdateListContent(city.getCityCode());
		map.put("qiuzhiList", qiuzhiList);
		//简历列表
		List<User> rencaiList = viewBiz.indexRencaiUpdateListContent(city.getCityCode());
		map.put("rencaiList", rencaiList);
		//周边城市列表
		if(!city.getCityCode().equals("0100") && !city.getCityCode().equals("0200") && !city.getCityCode().equals("0300") && !city.getCityCode().equals("0400")){
			List<Region> brotherCityList = regionDAO.getCityListByBrother(city);
			map.put("brotherCityList", brotherCityList);
		}
		//首页底部的热门搜索关键词，换成一个随机无序的方式的读取 Keywords.java 里面的各组词。
		Set<String> keysList = getRandomKeys();
		map.put("keysList", keysList);
		return map;
	}
	
	private Set<String> getRandomKeys(){
		Set<String> set = new HashSet<String>();
		HashMap keywords = Keywords.keywords;
		int len = 0;
		for(int i = 1; i<=22; i++){
			int index = getRandomInt(27, 1);
			String num = "" + index;
			if(index < 10)
				num = "0" + index;
			String key = "K" + num;
			String keysStr = (String) keywords.get(key);
			String ranVal = getKey(keysStr);
			if(set.contains(ranVal))
				i--;
			else{
				set.add(ranVal);
				len += (ranVal.length() * 13);
				len += 10;
				if(len > 870)//不能超过页面的长度870像素
					break;
			}
		}
		return set;
	}
	
	private String getKey(String keysStr){
		String[] arr = keysStr.split(",");
		int i = getRandomInt(arr.length -1 , 0);
		return arr[i];
	}
	
	private int getRandomInt(int maxVal, int minVal){
		int r = new java.util.Random().nextInt();
		r = Math.abs(r);
		if(r < minVal)
			return getRandomInt(maxVal, minVal);
		else if(r % maxVal == 0)
			return maxVal;
		return r % maxVal;
	}
	

	public void indexBuildHtml(Region c) {
		// 构建模板配置
		HtmlConfig htmlConfig = new HtmlConfig();
		htmlConfig.setName("首页");
		htmlConfig.setDescription("首页HTML模板");
		htmlConfig.setTemplateFilePath("index.ftl");
		
		//城市列表
		List<Region> cityList = new ArrayList<Region>();
		if(c == null){
			if(buildTime % 2 == 1)//单次只生成热点城市的
				cityList = regionDAOJDBC.getHotCities();
			else
				cityList = (List<Region>) servletContext.getAttribute(Consts.CITY_LIST);
		}else{
			cityList.add(c);
		}
		for(Region city : cityList){
			if(!city.getCityId().equals("cd") && !city.getCityId().equals("bj"))
				continue;
			htmlConfig.setHtmlFilePath("html/" + city.getCityId() + "_index.html");
//			if(city.getCityId().equals("")){
//				System.out.println("############3");
//			}
			//获取通用数据
			Map<String, Object> data = getCommonData(city);
			
			//检查模板路径和生成HTML文件的路径
			String htmlFilePath = htmlConfig.getHtmlFilePath();
			String templateFilePath = htmlConfig.getTemplateFilePath();
			logger.info("Buliding index html\n" + htmlFilePath + "\n" + templateFilePath);
			buildHtml(templateFilePath, htmlFilePath, data);
		}
		buildTime ++;
	}
}
