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
					if(link.attr("href").contains("guide")){
						h = new HotTag();
						h.setLinkName(link.html());
						h.setProduct(p);
						h.setHref(link.attr("href"));
					}else if("#".equals(href)){
						h = new HotTag();
						h.setLinkName(link.html());
						h.setProduct(p);
						h.setHref(p.getFileName()+".html");
					}else if(link.attr("href").contains("support/")){
						h = new HotTag();
						h.setLinkName(link.html());
						h.setProduct(p);
						h.setHref(link.attr("href"));
					}else{
						h = buildHotTag(new URL(path));
						h.setLinkName(link.html());
						h.setProduct(p);
						h.setHref(link.attr("href"));
						h.setHref(h.getHref().replaceAll("iPad", "ipad"));
					}
					
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
			keywords = doc.select("meta[name=keywords]").get(0).attr("content");
			description = doc.select("meta[name=description]").get(0).attr("content");
		} catch (Exception e) {
			//e.printStackTrace();
			try {
				description = doc.select("meta").last().attr("name");
			} catch (RuntimeException e1) {
				e1.printStackTrace();
				System.out.println("错误处在#$$$$$$$$$$$$$$$$$" + url);
			}
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
		content = content.replaceAll("font-size:17px;font-weight:bold; margin-top:10px; text-align:center;", "font-weight:bold; margin-top:10px; text-align:center;");
		content = content.replaceAll("<p>", "<p style=\"padding-left:0;\">");
		
		//替换图片
		int start = -1;
		int fromIndex = 0;
		while((start=Common.nextImg(content,fromIndex))>0){
			int end = content.indexOf(">", start);
			fromIndex = end;
			if(content.charAt(end-1)!='/'){
				StringBuffer sb = new StringBuffer(content);
				sb.replace(end, end+1, "/><br/>");
				content = sb.toString();
			}
		}
		
		HotTag h = new HotTag();
		h.setContent(content);
		h.setTitle(title);
		h.setDescription(description);
		h.setKeywords(keywords);
		return h;
		
	}
}
