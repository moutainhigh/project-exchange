package eahoosoft.freemarker;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import eahoosoft.common.Constants;
import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Product;
import eahoosoft.test.Init;


public class Common {
	public static void fillCommonVar(Map map){
		map.put("appPath", "/soft/");
		map.put("appTitle", Constants.APP_TITLE);
		map.put("appDesc", Constants.APP_DESC);
		map.put("appKeywords", Constants.APP_KEY_WORDS);
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
