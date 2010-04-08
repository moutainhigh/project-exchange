package sf.test.haosf;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class GetData {

	static {
		System.setProperty("proxySet", "true");
		System.setProperty("http.proxyHost", "proxy.cd.ncsi.com.cn");
		System.setProperty("http.proxyPort", "8080");
	}

	public static void start(String[] args) throws Exception {
		URL url = new URL("http://www.haosf.com/");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.connect();
		Map<?, ?> map = conn.getHeaderFields();
		printRespHeader(map);
		String code = map.get(null).toString();
		if (!code.contains("200")) {
			throw new RuntimeException("请求失败" + code);
		}
		InputStream in = conn.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in,"GBK"));
		String str = null;
		while((str=br.readLine()) != null){
			//System.out.println(str);
			if(str != null && str.startsWith("theAds[")){
				int begin = str.indexOf("'");
				int end = str.lastIndexOf("'");
				str = str.substring(begin+1, end);
				System.out.println(str);
			}			
		}
		in.close();
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
