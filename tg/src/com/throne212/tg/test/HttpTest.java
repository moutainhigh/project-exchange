package com.throne212.tg.test;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HttpTest {
	public static void main(String[] args) throws Exception {
		URL url = new URL("http://localhost/tg.htm");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		StringBuffer sb = new StringBuffer();

		InputStream is = conn.getInputStream();
		InputStreamReader in = new InputStreamReader(is, "UTF-8");
		char[] buff = new char[512];
		int len = -1;
		while ((len = in.read(buff)) > -1) {
			String str = new String(buff, 0, len);
			sb.append(str);
			// System.out.println(str);
		}

		//System.out.println(sb);
		
		Pattern p = Pattern.compile("<h1>.*</h1>");
		Matcher m = p.matcher(sb);
		boolean b = m.matches();
		System.out.println("匹配与否：" + b);
		while(m.find()){
			System.out.println("========================");
			System.out.println(m.group()+"\t"+m.start());
		}

		is.close();

	}
}
