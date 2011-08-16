package eahoosoft.freemarker;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import eahoosoft.test.GuideHtml;
import eahoosoft.test.HotTagHtml;
import eahoosoft.test.Init;

public class All {
	public static String SAMPLE_DIR = "D:\\work\\workspace\\workspace_9.0\\eahoosoft\\WebRoot\\template\\";
	public static String SOFT_DIR = "E:\\Program Files\\EasyPHP-5.3.6.1\\www\\soft\\";
	public static String GUIDE_DIR = "D:\\tmp\\guide";
	public static String SITE_PRE = "http://localhost:8887/old/";
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
		System.out.println("SOFT_DIR222:"+SOFT_DIR);
		Supports.main(null);
		System.out.println("SOFT_DIR:"+SOFT_DIR);
		replaceChars(SOFT_DIR);
	}
	private static void replaceChars(String dirPath) throws Exception{
		File dir = new File(dirPath);
		if(dir.isDirectory()){
			String[] fileNames = dir.list();
			for(String fileName : fileNames){
				File f = new File(dirPath+"\\"+fileName);
				if(f.isDirectory()){
					String absPath = f.getAbsolutePath();
					System.out.println(absPath);
					replaceChars(absPath);
				}else if(f.getName().contains(".html")){
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
