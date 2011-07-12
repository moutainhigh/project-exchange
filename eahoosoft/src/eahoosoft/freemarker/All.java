package eahoosoft.freemarker;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import eahoosoft.test.GuideHtml;
import eahoosoft.test.HotTagHtml;
import eahoosoft.test.Init;

public class All {
	public static String SAMPLE_DIR = "D:\\work\\workspace\\workspace_6.6\\eahoosoft\\WebRoot\\template\\";
	public static String SOFT_DIR = "E:\\Program Files\\EasyPHP-5.3.6.0\\www\\soft\\";
	public static String GUIDE_DIR = "D:\\tmp\\guide";
	public static String SITE_PRE = "http://localhost/old/";
	public static void main(String[] args) throws Exception {
		//初始化数据
		Init.main(null);
		GuideHtml.main(null);
		HotTagHtml.main(null);
		//生成HTML
		Index.main(null);
		Products.main(null);
		ProductDetail.main(null);
		Download.main(null);
		Purchase.main(null);
		Other.main(null);
		Guide.main(null);
		HotTag.main(null);
		Supports.main(null);
		replaceChars(SOFT_DIR);
	}
	private static void replaceChars(String dirPath) throws Exception{
		File dir = new File(dirPath);
		if(dir.isDirectory()){
			File[] files = dir.listFiles();
			for(File f : files){
				if(f.isDirectory())
					replaceChars(f.getAbsolutePath());
				else if(f.getName().contains(".html")){
					String content = readFile(f);
					content = Common.replaceChars(content);
					writeFile(f,content);
				}
			}
		}
		
	}
	private static String readFile(File f) throws Exception{
		StringBuffer sb = new StringBuffer();
		FileInputStream fis = new FileInputStream(f);
		byte[] buff = new byte[1024];
		int len = -1;
		while((len=fis.read(buff))>0){
			sb.append(new String(buff,0,len));
		}
		fis.close();
		return sb.toString();
	}
	private static void writeFile(File f,String content) throws Exception{
		FileOutputStream fout = new FileOutputStream(f);
		fout.write(content.getBytes(), 0, content.length());
	}
}
