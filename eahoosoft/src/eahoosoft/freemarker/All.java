package eahoosoft.freemarker;

import eahoosoft.test.GuideHtml;
import eahoosoft.test.Init;

public class All {
	public static String SAMPLE_DIR = "D:\\work\\workspace\\workspace_6.6\\eahoosoft\\WebRoot\\template\\";
	public static String SOFT_DIR = "E:\\Program Files\\EasyPHP-5.3.6.0\\www\\soft\\";
	public static String GUIDE_DIR = "D:\\tmp\\guide";
	public static String SITE_PRE = "http://www.eahoosoft.com/";
	public static void main(String[] args) throws Exception {
		//初始化数据
		Init.main(null);
		GuideHtml.main(null);
		//生成HTML
		Index.main(null);
		Products.main(null);
		ProductDetail.main(null);
		Download.main(null);
		Purchase.main(null);
		Other.main(null);
		Guide.main(null);
	}
}
