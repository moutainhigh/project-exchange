package eahoosoft.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class Supports {
	public static void main(String[] args) throws Exception{
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(All.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		
		Template template = cfg.getTemplate("page.ftl");		
		URL url = new URL(All.SITE_PRE+"support.html");		
		Document doc = Jsoup.parse(url,10000);
		
		Elements links = doc.select(".divl2 a");
		
		for(Element e : links){
			if(e.attr("href").startsWith("support")){
				url = new URL(All.SITE_PRE+e.attr("href"));
				doc = Jsoup.parse(url,10000);
				String content = doc.select(".divl2").get(0).html();
				content = Common.replaceChars(content);
				
				String fileName = e.attr("href").split("/")[1];
				
				Map map = new HashMap();
				//添加公用的数据模型
				Common.fillCommonVar(map);	
				Common.fillPageInfoFromURL(All.SITE_PRE+e.attr("href"), map);
				map.put("location", "Support");
				map.put("content", content);
				//标题栏模块下标
				map.put("currModule", 4);//支持			
				//添加顶部、底部和右侧的变量
				Common.fillRightData(map);	
				File file = new File(All.SOFT_DIR +"support\\"+fileName);
				PrintWriter pw = new PrintWriter(new FileOutputStream(file));
				template.process(map, pw);
				pw.close();
			}
		}
		
		
	}
}
