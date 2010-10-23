package freemarker;

import java.io.File;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import com.throne212.info168.web.action.LoginAction;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class GenerateTest {
	public static void main(String[] args) throws Exception {
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("D:\\work\\workspace_6.6\\tuangou\\WebRoot\\WEB-INF\\template"));
		cfg.setObjectWrapper(new DefaultObjectWrapper());
		
		Template temp = cfg.getTemplate("test.ftl",Locale.CHINA,"UTF-8");
		
		Writer out = new PrintWriter(System.out);
		Map map = new HashMap();
		map.put("name", "你好，我是中文");
		LoginAction a = new LoginAction();
		a.setUsername("拉拉");
		temp.process(a,out);
		out.flush();
	}
}
