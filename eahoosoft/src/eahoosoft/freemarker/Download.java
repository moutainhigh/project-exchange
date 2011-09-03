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

public class Download {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("download.ftl");
		
		//1
		Map map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads.html", map);
		//标题栏模块下标
		map.put("currModule", 2);//下载
		map.put("currCate", 0);
		//产品列表
		Session s = HibernateSessionFactory.getSession();
		List<Product> pList = s.createQuery("from Product p where p.cate.fileName='' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download.html"));
		template.process(map, pw);
		pw.close();
		
		//2	
		//标题栏模块下标
		map.put("currCate", 1);
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads-i-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='i' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download-i-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//3	
		//标题栏模块下标
		map.put("currCate", 2);
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads-m-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='m' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download-m-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//4	
		//标题栏模块下标
		map.put("currCate", 3);
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads-a-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='a' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download-a-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//5
		//标题栏模块下标
		map.put("currCate", 4);
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads-g-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='g' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download-g-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//6
		//标题栏模块下标
		map.put("currCate", 5);
		Common.fillPageInfoFromURL(All.SITE_PRE+"downloads-p-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='p' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"download-p-tools.html"));
		template.process(map, pw);
		pw.close();
	}
}
