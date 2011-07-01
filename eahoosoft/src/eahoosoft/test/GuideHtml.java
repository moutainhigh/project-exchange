package eahoosoft.test;

import java.io.File;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.freemarker.All;
import eahoosoft.pojo.Guide;

public class GuideHtml {
	public static void main(String[] args) throws Exception{
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		File guideDir = new File(All.GUIDE_DIR);
		File[] htmlFiles = guideDir.listFiles();
		
		for(File f : htmlFiles){
			try {
				if(!f.getName().contains("html") || f.getName().contains("bak") || f.isDirectory() || f.length()<10)
					continue;
				Document doc = Jsoup.parse(f,"UTF-8");
				Element head = doc.head();
				Element body = doc.body();
				
				String title = doc.title();
				String keywords = head.select("meta[name=keywords]").get(0).attr("content");
				String description = head.select("meta[name=description]").get(0).attr("content");
				//System.out.println(description);
				
				Elements h1 = doc.select("h1");
				String name = h1.get(0).text();
				//System.out.println(name);
				
				Element myContent = doc.select("#my_content").get(0);
				String content = myContent.html();
				//替换一些字符
				content = content.replaceAll("EahoosoftVideoConverter\\.html", "eahoosoft-video-converter.html");
				content = content.replaceAll("eahoosoft-DVD-Ripper/eahoosoft-DVD-Ripper\\.html", "eahoosoft-dvd-ripper/eahoosoft-dvd-ripper.html");
				//System.out.println(content);
				
				String linkName = ""; 
				if(f.getName().contains("how-to-convert")){
					String[] arr = f.getName().split("-");
					for(int i=2;i<arr.length;i++){
						linkName += (arr[i].toUpperCase()+" ");
					}
					linkName = linkName.replaceAll(".HTML", "");
				}else{
					String[] arr = f.getName().split("-");
					linkName = "Convert ";
					for(int i=0;i<=2;i++){
						linkName += (arr[i].toUpperCase()+" ");
					}
				}
				
				Guide g = new Guide();
				g.setContent(content);
				g.setDescription(description);
				g.setFileName(f.getName());
				g.setKeywords(keywords);
				g.setName(name);
				g.setTitle(title);
				g.setLinkName(linkName);
				
				s.saveOrUpdate(g);
			} catch (RuntimeException e) {
				e.printStackTrace();
				System.out.println("�������ļ���出错在################"+f.getName());
				continue;
			}
			
		}
		
		s.getTransaction().commit();
		s.close();
		
	}
}
