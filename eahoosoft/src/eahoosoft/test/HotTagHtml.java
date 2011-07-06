package eahoosoft.test;

import java.net.URL;
import java.util.List;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.freemarker.All;
import eahoosoft.freemarker.Common;
import eahoosoft.pojo.HotTag;
import eahoosoft.pojo.Product;

public class HotTagHtml {
	public static void main(String[] args) throws Exception {

		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		List<Product> list = s.createQuery("from Product").list();
		
		for(Product p : list){
			
			URL url = null;
			
			String fileName = "eahoosoft-video-converter";
			String oldFileName = "EahoosoftVideoConverter";
			if(fileName.equals(p.getFileName()))
				url = new URL(All.SITE_PRE+p.getFileName()+"/"+oldFileName+".html");
			else
				url = new URL(All.SITE_PRE+p.getFileName()+"/"+p.getFileName()+".html");
			
			Document doc = Jsoup.parse(url,10000);
			
			Elements contents = doc.select(".content");
			Element content = contents.get(2);
			Elements links = content.select("a");
			
//			for(Element e : links){
//				System.out.println(e.html());
//			}			
			System.out.println(p.getFileName()+"=========="+links.size());
			
			for(Element link : links){
				String href = link.attr("href");
				if(href.contains("/")){
					href = href.substring(href.lastIndexOf("/")+1);
				}
				String path = link.baseUri().substring(0,link.baseUri().lastIndexOf("/")+1) + href;
				try {
					HotTag h = null;
					if(link.attr("href").contains("guide"))
						h = new HotTag();
					else
						h = buildHotTag(new URL(path));
					h.setLinkName(link.html());
					h.setProduct(p);
					h.setHref(link.attr("href"));
					s.saveOrUpdate(h);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("错误出在：" + path);
				}
			}
			
		}
		
		s.getTransaction().commit();
		s.close();

	}
	private static HotTag buildHotTag(URL url) throws Exception{
		Document doc = Jsoup.parse(url,10000);
		Element head = doc.head();
		Element body = doc.body();

		String title = doc.title();
		String keywords = null;
		String description = null;
		
		try {
			keywords = head.select("meta[name=keywords]").get(0).attr("content");
			description = head.select("meta[name=description]").get(0).attr("content");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		// System.out.println(description);

		Element myContent = doc.select(".divl2").get(0);
		String content = myContent.html();
		// 替换一些字符
		content = content.replaceAll("font-size:17px;font-weight:bold; margin-top:20px", "font-size:17px;font-weight:bold; margin-top:10px; text-align:center;");
		content = content.replaceAll("EahoosoftVideoConverter\\.html", "eahoosoft-video-converter.html");
		content = content.replaceAll("eahoosoft-DVD-Ripper/eahoosoft-DVD-Ripper\\.html", "eahoosoft-dvd-ripper/eahoosoft-dvd-ripper.html");
		//System.out.println(content);
		content = Common.replaceChars(content);
		
		HotTag h = new HotTag();
		h.setContent(content);
		h.setTitle(title);
		h.setDescription(description);
		h.setKeywords(keywords);
		return h;
		
	}
}
