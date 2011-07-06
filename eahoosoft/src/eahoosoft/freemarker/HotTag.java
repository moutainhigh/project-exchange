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
import freemarker.template.Configuration;
import freemarker.template.Template;

public class HotTag {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("hot_tag.ftl");
		
		Session s = HibernateSessionFactory.getSession();
		List<eahoosoft.pojo.HotTag> list = s.createQuery("from HotTag").list();
		for(eahoosoft.pojo.HotTag h : list){
			if(h.getHref().contains("guide"))
				continue;
			if(h.getHref().contains(h.getProduct().getFileName()))
				continue;
			Map map = new HashMap();
			
			//添加公用的数据模型
			Common.fillCommonVar(map);		
			map.put("appTitle", h.getTitle());
			if(h.getDescription() != null)
				map.put("appDesc", h.getDescription());
			if(h.getKeywords() != null)
				map.put("appKeywords", h.getKeywords());
			
			//标题栏模块下标
			map.put("currModule", 1);//产品			
			//产品，用p变量
			map.put("h", h);
			map.put("p", h.getProduct());	
			//添加顶部、底部和右侧的变量
			Common.fillRightData(map);
			
			File file = new File(All.SOFT_DIR + h.getProduct().getFileName()+"\\"+h.getHref());
			PrintWriter pw = new PrintWriter(new FileOutputStream(file));
			template.process(map, pw);
			pw.close();
		}
		
		
	}
}
