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
import freemarker.template.Configuration;
import freemarker.template.Template;

public class Guide {
	public static void main(String[] args) throws Exception{
		
		//GuideHtml.main(null);
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("guide.ftl");		
		
		Map map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);			
		map.put("appTitle", "Guide - Eahoosoft");
		map.put("appDesc", "Read the step-by-step guides for eahoosoft products.");
		map.put("appKeywords", "Guides, How-tos");
		//添加顶部、底部和右侧的变量
		Common.fillRightData(map);	
		
		int maxPerPage = 99;
		Session s = HibernateSessionFactory.getSession();
		Long count = (Long)s.createQuery("select count(*) from Guide").uniqueResult();
		s.close();
		
		List<String[]> pList = new ArrayList<String[]>(); 
		map.put("pList", pList);
		for(int i=1;i<=count/maxPerPage+1;i++){
			//页码
			String[] arr = {"",""};
			arr[0] = i+"";
			arr[1] = i+"";
			if(i==1)
				arr[1] = "";
			pList.add(arr);
		}
		
		for(int i=1;i<=count/maxPerPage+1;i++){	
			//guide数据			
			s = HibernateSessionFactory.getSession();
			List<eahoosoft.pojo.Guide> gList = s.createQuery("from Guide order by fileName asc").setMaxResults(maxPerPage).setFirstResult((i-1)*maxPerPage).list();
			s.close();			
			map.put("gList", gList);
			
			PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"guide"+pList.get(i-1)[1]+".html"));		
			template.process(map, pw);		
			pw.close();
		}	
		
		//生成详细页面
//		URL url = new URL(All.SITE_PRE+"index.html");		
//		Document doc = Jsoup.parse(url,10000);
//		Element userGuide = doc.select(".DIV4").get(5);
//		Elements links = userGuide.select("a");
//		List<eahoosoft.pojo.Guide> ugList = new ArrayList<eahoosoft.pojo.Guide>(); 
//		for(Element link : links){
//			eahoosoft.pojo.Guide g = new eahoosoft.pojo.Guide();
//			g.setLinkName(link.text());
//			g.setFileName(link.attr("href"));
//			ugList.add(g);
//		}
//		map.put("ugList", ugList);
		s = HibernateSessionFactory.getSession();
		List<eahoosoft.pojo.Guide> gList = s.createQuery("from Guide").list();
		for(eahoosoft.pojo.Guide g : gList){
			template = cfg.getTemplate("guide_detail.ftl");	
			
			String content = g.getContent();
			if(g.getLinkBuy()==null){
				g.setLinkBuy("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-2");
			}
			if(g.getLinkDown()==null){
				g.setLinkDown("../download/VideoConverter.exe");
			}
			content = content.replaceAll("<p class=\"button\">.+</p>", "<p class=\"button\">"+
				"<div style=\"overflow:hidden;width:430px;margin:5px auto;\" class=\"clear\">"+
				"	<div class=\"freeTrialBig_below\"><a href=\""+g.getLinkDown()+"\"><span>Free Trial</span></a></div>"+
				"	<div class=\"buyNowBig_below\"><a target=\"_blank\" href=\""+g.getLinkBuy()+"\"><span>Buy Now</span></a></div>"+
				"	<div class=\"clear\"></div>"+
				"</div>"+
				"</p>");
			g.setContent(content);
			
			map.put("g", g);
			PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DIR+"guide\\"+g.getFileName()));		
			template.process(map, pw);		
			pw.close();
		}
		s.close();	
		
	}
}
