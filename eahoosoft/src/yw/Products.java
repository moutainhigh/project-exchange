package yw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class Products {

	public static void main(String[] args) throws Throwable{
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(Main.SAMPLE_DIR));
		cfg.setEncoding(Locale.US, "UTF8");
		Template template = cfg.getTemplate("products.ftl");
		Map map = new HashMap();
		//位置
		map.put("pos", "Products");
		//获取product
		List<Pro> list = DB.getAllPro();
		map.put("proList", list);
		PrintWriter pw = new PrintWriter(new FileOutputStream(Main.YW_DIR+"products.html"));
		template.process(map, pw);
		pw.close();
		//新产品
		pw = new PrintWriter(new FileOutputStream(Main.YW_DIR+"new_products.html"));
		template.process(map, pw);
		pw.close();
		//目录分类的产品
		for(Pro p : list){
			map.put("proList", DB.getAllPro(p.getType()));
			pw = new PrintWriter(new FileOutputStream(Main.YW_DIR+"product-"+p.getType()+".html"));
			template.process(map, pw);
			pw.close();
			//详细页面
			map.put("p", p);
			Template detailTemplate = cfg.getTemplate("product-detail.ftl");
			pw = new PrintWriter(new FileOutputStream(Main.YW_DIR+"product_"+p.getId()+".html"));
			detailTemplate.process(map, pw);
			pw.close();
		}
	}
	
}
