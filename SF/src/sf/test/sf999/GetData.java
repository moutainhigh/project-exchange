package sf.test.sf999;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

public class GetData {

	static {
		/*
		 * System.setProperty("proxySet", "true");
		 * System.setProperty("http.proxyHost", "proxy.cd.ncsi.com.cn");
		 * System.setProperty("http.proxyPort", "8080");
		 */
	}

	public static void start(String[] args) throws Exception {
		URL url = new URL("http://info.ha2000.net/");
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
		BufferedReader br = new BufferedReader(new InputStreamReader(in, "GBK"));
		String str = null;
		StringBuffer sb = null;
		int i = 0;
		while ((str = br.readLine()) != null) {
			// System.out.println(str);
			if(str == null || str.equals(""))
				continue;
			str = str.trim();
			if (str != null && str.startsWith("theAds[")) {
				int begin = str.indexOf("'");
				int end = str.lastIndexOf("'");
				str = str.substring(begin + 1, end);
				// System.out.println(str);
				if(i++%2 == 0)
					SaveData.parseStr(str);
			} else {
				if (str.startsWith("<TR")) {
					sb = new StringBuffer();
				} 
				if (sb != null) {
					sb.append(str);
				}
				if (str.endsWith("</TR>") && sb != null) {
					//sb.append(str);
					//System.out.println(sb.toString());
					String tmp = sb.toString();
					tmp = tmp
							.replace(
									"<b>==<font color=\"#FF0000\">精</font><font color=\"#0000FF\">品</font><font color=\"#009900\">全</font><font color=\"#FF9900\">天</font><font color=\"#6600FF\">推</font><font color=\"#FF0000\">荐</font>==</b>",
									SaveData.format5.format(new Date()));
					tmp = tmp.replace("今天通宵固顶 <b><font color=\"green\">精品推荐</font></b>", SaveData.format4.format(new Date()));
					if(i++%2 == 0)
						SaveData.parseStr(tmp);
					sb = null;
				} 
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
