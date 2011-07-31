package eahoosoft.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Product;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class Other {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		//support
		Template template = cfg.getTemplate("support.ftl");		
		Map map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"support.html", map);
		//标题栏模块下标
		map.put("currModule", 4);//支持			
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"support.html"));		
		template.process(map, pw);		
		pw.close();
		
		//news
		template = cfg.getTemplate("news.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"news.html", map);
		//标题栏模块下标
		map.put("currModule", 5);//新闻		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"news.html"));		
		template.process(map, pw);		
		pw.close();
		
		template = cfg.getTemplate("contact.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"contact.html", map);
		//标题栏模块下标
		map.put("currModule", null);		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"contact.html"));		
		template.process(map, pw);		
		pw.close();
		
		//about us
		template = cfg.getTemplate("about-us.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"about-us.html", map);
		//标题栏模块下标
		map.put("currModule", null);		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"about-us.html"));		
		template.process(map, pw);		
		pw.close();
		
		//links
		template = cfg.getTemplate("links.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"links.html", map);
		//标题栏模块下标
		map.put("currModule", null);		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"links.html"));		
		template.process(map, pw);		
		pw.close();
		
		//FAQ
		template = cfg.getTemplate("faqs.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"faqs.html", map);
		//标题栏模块下标
		map.put("currModule", null);		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"faqs.html"));		
		template.process(map, pw);		
		pw.close();
	}
}
