package eahoosoft.freemarker;


public class All {
	public static String SAMPLE_DIR = "D:\\work\\workspace\\workspace_9.0\\eahoosoft\\WebRoot\\template\\";
	public static String SOFT_DIR = "E:\\Program Files\\EasyPHP-5.3.6.1\\www\\soft\\";
	public static String GUIDE_DIR = "D:\\tmp\\guide";
	public static String SITE_PRE = "http://localhost:8887/";
	public static void main(String[] args) throws Exception {
		//生成HTML
		Index.main(null);
		Products.main(null);
		ProductDetail.main(null);
		Download.main(null);
		Purchase.main(null);
		Other.main(null);
		Guide.main(null);
		HotTag.main(null);
	}
}
