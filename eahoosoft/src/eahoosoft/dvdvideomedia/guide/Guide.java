package eahoosoft.dvdvideomedia.guide;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.freemarker.All;
import eahoosoft.freemarker.Common;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class Guide {
	public static void main(String[] args) throws Exception{
		
		//GuideHtml.main(null);
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR_DID));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("guide.ftl");		
		
		Map map = new HashMap();		
		//添加公用的数据模型
		Common.fillCommonVar(map);			
		map.put("appTitle", "Guide - DVD Video Media");
		map.put("appDesc", "Read the step-by-step guides for dvdvideomedia products.");
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
			
			PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DVD_DIR+"guide"+pList.get(i-1)[1]+".html"));		
			template.process(map, pw);		
			pw.close();
		}	
		
		//生成详细页面
		s = HibernateSessionFactory.getSession();
		List<eahoosoft.pojo.Guide> gList = s.createQuery("from Guide").list();
		for(eahoosoft.pojo.Guide g : gList){
			template = cfg.getTemplate("guide_detail.ftl");	
			
			String content = g.getContent();
			content = content.replaceAll("http://www.eahoosoft.com/", "/");
			content = content.replaceAll("eahoosoft", "dvdvideomedia");
			content = content.replaceAll("Eahoosoft", "DVDVideoMedia Free");
			g.setContent(content);
			
			map.put("g", g);
			PrintWriter pw = new PrintWriter(new FileOutputStream(All.SOFT_DVD_DIR+"guide\\"+g.getFileName()));		
			template.process(map, pw);		
			pw.close();
		}
		s.close();	
		
	}
}
