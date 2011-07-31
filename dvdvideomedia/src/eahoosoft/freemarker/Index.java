package eahoosoft.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Guide;
import eahoosoft.pojo.Product;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class Index {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("index.ftl");
		
		Map map = new HashMap();
		
		//添加公用的数据模型
		Common.fillCommonVar(map);
		
		//标题栏模块下标
		map.put("currModule", 0);//首页
		
		//产品列表
		Session s = HibernateSessionFactory.getSession();
		List<Product> pList = s.createQuery("from Product p where p.indexOrderNum is not null order by indexOrderNum").list();
		map.put("pList", pList);
		s.close();
		
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);
		
		//guide
//		s = HibernateSessionFactory.getSession();
//		List<Product> glList = s.createQuery("from Guide g order by content").setMaxResults(8).list();
//		map.put("glList", glList);
//		List<Product> grList = s.createQuery("from Guide g order by content desc").setMaxResults(8).list();
//		map.put("grList", grList);
//		s.close();
		//user guide
		URL url = new URL(All.SITE_PRE+"index.html");		
		Document doc = Jsoup.parse(url,10000);
		Element userGuide = doc.select(".DIV4").get(5);
		Elements links = userGuide.select("a");
		List<Guide> ugList = new ArrayList<Guide>(); 
		for(Element link : links){
			Guide g = new Guide();
			g.setLinkName(link.text());
			g.setFileName(link.attr("href"));
			g.setFileName(g.getFileName().replaceAll("eahoosoft-DVD-Ripper", "eahoosoft-dvd-ripper"));
			g.setFileName(g.getFileName().replaceAll("dvd-to-iPad-converter", "dvd-to-ipad-converter"));
			g.setFileName(g.getFileName().replaceAll("dvd-to-iPhone-converter", "dvd-to-iphone-converter"));
			g.setFileName(g.getFileName().replaceAll("dvd-to-iPod-converter", "dvd-to-ipod-converter"));
			ugList.add(g);
		}
		map.put("ugList", ugList);
		
		PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"index.html"));
		
		template.process(map, pw);
		
		pw.close();
	}
}
