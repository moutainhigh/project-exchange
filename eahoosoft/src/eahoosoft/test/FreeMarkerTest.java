package eahoosoft.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FreeMarkerTest {
	public static void main(String[] args) throws Exception{
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("d:/tmp"));
		
		Template template = cfg.getTemplate("test.ftl");
		
		Map map = new HashMap();
		map.put("user", "zs");
		
		PrintWriter pw = new PrintWriter(new FileOutputStream("d:/tmp/test.html"));
		
		template.process(map, pw);
		
		pw.close();
	}
}
