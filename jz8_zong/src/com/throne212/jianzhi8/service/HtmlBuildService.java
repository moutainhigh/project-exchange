package com.throne212.jianzhi8.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.jianzhi8.biz.impl.jdbc.ViewBizImpl;
import com.throne212.jianzhi8.common.HtmlConfig;
import com.throne212.jianzhi8.common.Keywords;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.GonggaoDAO;
import com.throne212.jianzhi8.dao.InfoZphDAO;
import com.throne212.jianzhi8.dao.LinkDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.Gonggao;
import com.throne212.jianzhi8.domain.InfoZph;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.domain.User;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service("htmlBuildService")
@Transactional
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
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private InfoZphDAO infoZphDAO;
	@Resource
	private GonggaoDAO gonggaoDAO;
	@Resource
	private TypeDAO typeDAO;
	@Resource
	private ContentDAO contentDAO;
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private ViewBizImpl viewBiz;
	
	//首页各大城市编号，及排序
	private static String[] cityCodesArr = {"0000", "0100", "0200", "0300", "0400", "0501", "0502", "0503", "0701", "1401", "2201"};
	
	public void buildHtml(String templateFilePath, String htmlFilePath, Map<String, Object> data) {
		try {
			Configuration configuration = freemarkerManager.getConfiguration(servletContext);
			configuration.setDirectoryForTemplateLoading(new File(getTemplatePath()));
			configuration.setClassicCompatible(true);
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

	public Map<String, Object> getCommonData() {
		Map<String, Object> map = new HashMap<String, Object>();
		//热点城市
		List<Region> hotCityList = regionDAOJDBC.getHotCities();
		map.put("hotCityList", hotCityList);
		//热门搜索关键词，换成一个随机无序的方式的读取 Keywords.java 里面的各组词。
		Set<String> keysList = getRandomKeys();
		map.put("keysList", keysList);
		//4条招聘会信息
		List<InfoZph> zph4List = infoZphDAO.findNew4ZPH();
		map.put("zph4List", zph4List);
		//4条简历列表
		List<User> rencaiList = viewBiz.indexRencaiUpdateListContent();
		map.put("rencaiList", rencaiList);
		//6条最新信息（公告）
		List<Gonggao> gg6List = gonggaoDAO.findNew6Gonggao();
		map.put("gg6List", gg6List);
		//兼职类别
		List<Type> indexTypeList = typeDAO.getIndexTypes();
		map.put("indexTypeList", indexTypeList);
		//各大城市最新信息
		List<List<Content>> cityContentList = new ArrayList();
		for(String cityCode : cityCodesArr){
			List<Content> contentList = contentDAO.findIndexLatestCityContent(cityCode,39);
			cityContentList.add(contentList);
		}
		map.put("cityContentList", cityContentList);
		//最新动态（招聘会动态）
		List<InfoZph> zph6List = infoZphDAO.findNew6ZPH();
		map.put("zph6List", zph6List);
		return map;
	}
	
	private static Set<String> getRandomKeys(){
		Set<String> set = new HashSet<String>();
		HashMap keywords = Keywords.keywords;
		int len = 0;
		for(int i = 1; i<=10; i++){
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
				if(len > 620)//不能超过页面的长度620像素
					break;
			}
		}
		return set;
	}
	
	private static String getKey(String keysStr){
		String[] arr = keysStr.split(",");
		int i = getRandomInt(arr.length -1 , 0);
		return arr[i];
	}
	
	private static int getRandomInt(int maxVal, int minVal){
		int r = new java.util.Random().nextInt();
		r = Math.abs(r);
		if(r < minVal)
			return getRandomInt(maxVal, minVal);
		else if(r % maxVal == 0)
			return maxVal;
		return r % maxVal;
	}
	
	public void indexBuildHtml() {
		// 构建模板配置
		HtmlConfig htmlConfig = new HtmlConfig();
		htmlConfig.setName("首页");
		htmlConfig.setDescription("首页HTML模板");
		htmlConfig.setTemplateFilePath("index.ftl");
		
		htmlConfig.setHtmlFilePath("index.html");
		//获取通用数据
		Map<String, Object> data = getCommonData();
		
		//检查模板路径和生成HTML文件的路径
		String htmlFilePath = htmlConfig.getHtmlFilePath();
		String templateFilePath = htmlConfig.getTemplateFilePath();
		logger.info("Buliding index html\n" + htmlFilePath + "\n" + templateFilePath);
		buildHtml(templateFilePath, htmlFilePath, data);
	}
}
