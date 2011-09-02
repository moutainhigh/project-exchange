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

public class Purchase {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("purchase.ftl");
		
		//1
		Map map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);		
		Common.fillPageInfoFromURL(All.SITE_PRE+"purchase.html", map);
		//标题栏模块下标
		map.put("currModule", 3);//购买
		map.put("currCate", 0);
		//产品列表
		Session s = HibernateSessionFactory.getSession();
		List<Product> pList = s.createQuery("from Product p where p.cate.fileName='' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		map.put("op", "Windows 7/vista/xp/2000");
		PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"purchase.html"));
		template.process(map, pw);
		pw.close();
		
		//2	
		//标题栏模块下标
		map.put("currCate", 1);
		Common.fillPageInfoFromURL(All.SITE_PRE+"purchase-i-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='i' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		map.put("op", "Windows 7/vista/xp/2000");
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"purchase-i-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//3	
		//标题栏模块下标
		map.put("currCate", 2);
		Common.fillPageInfoFromURL(All.SITE_PRE+"purchase-m-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='m' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		//平台
		map.put("op", "Mac OS X v10.5 -10.6, Snow Leopard support");
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"purchase-m-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//4	
		//标题栏模块下标
		map.put("currCate", 3);
		Common.fillPageInfoFromURL(All.SITE_PRE+"purchase-a-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='a' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		map.put("op", "Windows 7/vista/xp/2000");
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"purchase-a-tools.html"));
		template.process(map, pw);
		pw.close();
		
		//5
		//标题栏模块下标
		map.put("currCate", 4);
		Common.fillPageInfoFromURL(All.SITE_PRE+"purchase-g-tools.html", map);
		//产品列表
		s = HibernateSessionFactory.getSession();
		pList = s.createQuery("from Product p where p.cate.fileName='g' order by p.orderNum").list();
		map.put("pList", pList);
		s.close();
		//添加顶部、底部和右侧的变量
		map.put("op", "Windows 7/vista/xp/2000");
		pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"purchase-g-tools.html"));
		template.process(map, pw);
		pw.close();
	}
}
