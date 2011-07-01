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
import eahoosoft.test.Init;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class Other {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
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
		
		template = cfg.getTemplate("product_detail.ftl");		
		map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"free-video-converter/free-video-converter.html", map);
		//标题栏模块下标
		map.put("currModule", 6);//free
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);		
		//产品数据
		Session s = HibernateSessionFactory.getSession();
		List<Product> list = s.createQuery("from Product where name like '%Free Eahoosoft Video Converter%'").list();
		Product p = list.get(0);
		map.put("p", p);
		s.close();		
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+p.getFileName()+"\\"+p.getFileName()+".html"));	
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
	}
}
