package sf;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class HttpData {
	
	static {
		System.setProperty("proxySet", "true");
		System.setProperty("http.proxyHost", "proxy.cd.ncsi.com.cn");
		System.setProperty("http.proxyPort", "8080");
	}
	public static void start(String[] args) throws Exception {
		URL url = new URL("http://www.milan1899.cn/");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		setReqProperties(conn, "www.milan1899.cn");
		conn.connect();
		Map<?, ?> map = conn.getHeaderFields();
		printRespHeader(map);
		String code = map.get(null).toString();
		if (!code.contains("200")) {
			throw new RuntimeException("请求失败" + code);
		}
		
		InputStream in = conn.getInputStream();
		String str = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		System.out.println(str);
		str = str.substring(0, str.indexOf("/WEB-INF"));
		System.out.println(str);
		FileOutputStream fos = new FileOutputStream(str + "/index.htm");
		byte[] buff = new byte[1024];
		int len = -1;
		while ((len = in.read(buff)) != -1) {
			// System.out.println(new String(buff, "gb2312"));
			fos.write(buff, 0, len);
		}
		in.close();
		fos.close();
	}

	static void setReqProperties(HttpURLConnection conn, String host) {
		conn.setRequestProperty("Host", host);
		conn.setRequestProperty("User-Agent", "	Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)");
		conn.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		conn.setRequestProperty("Accept-Language", "zh-cn,zh;q=0.5");
		conn.setRequestProperty("Accept-Encoding", "gzip,deflate");
		conn.setRequestProperty("Accept-Charset", "gb2312,utf-8;q=0.7,*;q=0.7");
		conn.setRequestProperty("Keep-Alive", "115");
		conn.setRequestProperty("Proxy-Connection", "keep-alive");
		// conn.setRequestProperty("Referer",
		// "http://www.anxz.com/down/407.html");
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
