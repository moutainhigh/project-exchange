package eahoosoft.freemarker;

import java.net.URL;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import eahoosoft.common.Constants;
import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Product;


public class Common {
	public static void fillCommonVar(Map map){
		map.put("appPath", "/soft/");
		map.put("appTitle", Constants.APP_TITLE);
		map.put("appDesc", Constants.APP_DESC);
		map.put("appKeywords", Constants.APP_KEY_WORDS);
	}
	public static void fillPageInfoFromURL(String urlStr,Map map){
		try {
			URL url = new URL(urlStr);
			Document doc = Jsoup.parse(url,5000);
			Element head = doc.head();
			String title = doc.title();			
			map.put("appTitle", title);
			String keywords = head.select("meta[name=keywords]").get(0).attr("content");
			map.put("appKeywords", keywords);
			String description = head.select("meta[name=description]").get(0).attr("content");
			map.put("appDesc", description);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("发生错误的URL是：" + urlStr);
		} 
	}
	public static void fillRightData(Map map){
		Session s = HibernateSessionFactory.getSession();
		List<Product> mList = s.createQuery("from Product p where p.cate.fileName='m' order by p.orderNum").list();
		map.put("mList", mList);
		
		List<Product> vList = s.createQuery("from Product p where p.cate.fileName='' and p.name not like '%DVD%' order by p.orderNum").list();
		map.put("vList", vList);
		
		List<Product> dList = s.createQuery("from Product p where p.cate.fileName='' and p.name like '%DVD%' order by p.orderNum").list();
		map.put("dList", dList);
		
		List<Product> iList = s.createQuery("from Product p where p.cate.fileName='i' order by p.orderNum").list();
		map.put("iList", iList);
		
		List<Product> aList = s.createQuery("from Product p where p.cate.fileName='a' order by p.orderNum").list();
		map.put("aList", aList);
	}
}
