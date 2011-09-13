package eahoosoft.from_html_110913;

import java.net.URL;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Guide;

public class Guides {

	public static void main(String[] args) throws Exception {

		for (int i = 1; i <= 11; i++) {
			String num = i == 1 ? "" : "" + i;
			URL url = new URL(Consts.SITE_PRE + "guide" + num + ".html");
			Document doc = Jsoup.parse(url, 10000);

			Element head = doc.head();
			Elements list = doc.select(".more_ul li a");

			for (Element guide : list) {
				String linkName = guide.text();
				String urlStr = Consts.SITE_PRE + guide.attr("href");
				buildGuide(urlStr, linkName);
			}
		}

	}
	
	private static void buildGuide(String urlStr, String linkName) throws Exception{
		URL url = new URL(urlStr);
		Document doc = Jsoup.parse(url, 10000);

		Element head = doc.head();
		try {
			String title = doc.title();			
			String keywords = doc.select("meta[name=keywords]").get(0).attr("content");
			String description = doc.select("meta[name=description]").get(0).attr("content");
			
//			private String title;
//			private String keywords;
//			private String description;
//			private String name;
//			private String content;
//			private String fileName;
//			private String linkName;
//			private String linkDown;
//			private String linkBuy;
			
			Guide g = new Guide();
			
			String name = doc.select(".bg_title_right h1").text();
			g.setName(name);
			String content = doc.select("#my_content").html();
			g.setContent(content);
			String fileName = urlStr.substring(urlStr.lastIndexOf("/") + 1);
			g.setFileName(fileName);
			System.out.println(fileName);
			String linkDown = doc.select(".freeTrialBig_below a").attr("href");
			g.setLinkDown(linkDown);
			System.out.println(linkDown);
			String linkBuy = doc.select(".buyNowBig_below a").attr("href");
			g.setLinkBuy(linkBuy);
			System.out.println(linkBuy);
			
			g.setLinkName(linkName);
			g.setTitle(title);
			g.setDescription(description);
			g.setKeywords(keywords);
			
			Session s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			s.save(g);
			s.getTransaction().commit();
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("发生错误的URL是：" + urlStr);
		}
		
	}

}
