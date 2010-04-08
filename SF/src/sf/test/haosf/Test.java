package sf.test.haosf;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Map;

import sf.dao.InfoDao;
import sf.pojo.Info;

public class Test {

	static {

		System.setProperty("proxySet", "true");
		System.setProperty("http.proxyHost", "proxy.cd.ncsi.com.cn");
		System.setProperty("http.proxyPort", "8080");

	}

	static InfoDao infoDao = new InfoDao();

	public static void start(String[] args) throws Exception {
		URL url = new URL("http://www.haosf.com/");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		//setReqProperties(conn, "info.ha2000.net");
		conn.connect();
		Map<?, ?> map = conn.getHeaderFields();
		printRespHeader(map);
		String code = map.get(null).toString();
		if (!code.contains("200")) {
			throw new RuntimeException("请求失败" + code);
		}

		// FileInputStream in = new FileInputStream("d:/tmp/test.html");

		InputStream in = conn.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in,"GBK"));
		FileOutputStream fos = new FileOutputStream("d:/tmp/haosf.html");
		PrintWriter pw = new PrintWriter(fos);
		String str = null;
		while((str=br.readLine()) != null){
			System.out.println(str);
			//fos.write(str.getBytes());
			pw.println(str);
		}		
		in.close();
		fos.close();
	}

	static void setReqProperties(HttpURLConnection conn, String host) {
		conn.setRequestProperty("Host", host);
		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 (.NET CLR 3.5.30729)");
		conn.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		conn.setRequestProperty("Accept-Language", "zh-cn,zh;q=0.5");
		conn.setRequestProperty("Accept-Encoding", "gzip,deflate");
		conn.setRequestProperty("Accept-Charset", "GB2312,utf-8;q=0.7,*;q=0.7");
		conn.setRequestProperty("Keep-Alive", "115");
		conn.setRequestProperty("Connection", "http://www.sf999.com/iframe/411444.html");
		conn.setRequestProperty("If-Modified-Since", "Tue, 30 Mar 2010 02:06:21 GMT");
	}

	static void printRespHeader(Map<?, ?> map) {
		System.out.println("getting head >>>>>>>>>>>>>>>>> ");
		for (Object o : map.keySet()) {
			System.out.println("[" + o + "]\t=\t[" + map.get(o) + "]");
		}
		System.out.println("getting head end <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ");
	}

	public static void main(String[] args) throws Exception {
		start(args);
	}
}
