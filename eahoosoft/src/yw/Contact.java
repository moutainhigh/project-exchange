package yw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class Contact {

	public static void main(String[] args) throws Exception{
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(Main.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		Template template = cfg.getTemplate("contact.ftl");
		Map map = new HashMap();
		//位置
		map.put("pos", "Contact Us");
		PrintWriter pw = new PrintWriter(new FileOutputStream(Main.YW_DIR+"contact.html"));
		template.process(map, pw);
		pw.close();
	}
	
}
