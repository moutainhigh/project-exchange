package sf;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Map;

import sf.dao.InfoDao;
import sf.pojo.Info;

public class Milan1899 {

	static {
		/*
		 * System.setProperty("proxySet", "true");
		 * System.setProperty("http.proxyHost", "proxy.cd.ncsi.com.cn");
		 * System.setProperty("http.proxyPort", "8080");
		 */
	}

	static InfoDao infoDao = new InfoDao();

	public static void start(String[] args) throws Exception {
		URL url = new URL("http://cqsf5.com/pp.htm");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		setReqProperties(conn, "cqsf5.com");
		conn.connect();
		Map<?, ?> map = conn.getHeaderFields();
		printRespHeader(map);
		String code = map.get(null).toString();
		if (!code.contains("200")) {
			throw new RuntimeException("请求失败" + code);
		}

		// FileInputStream in = new FileInputStream("d:/tmp/test.html");

		InputStream in = conn.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		StringBuffer sb = new StringBuffer();
		String str = null;
		int sum = 0;
		while ((str = br.readLine()) != null) {
			//System.out.println(str);
			if (str.contains("<TR")) {
				sb.append(str);
			} else if (str.contains("</TR")) {
				sb.append(str);
				String rd = sb.toString();
				System.out.println("#############################" + rd);
				if (rd.startsWith("<TR bgColor=#")) {
					sum++;
					//try {
						saveInfo(rd);
					//} catch (RuntimeException e) {
					//	e.printStackTrace();
					//}
				}
				sb = new StringBuffer();
			} else if (str.contains("<TD") || str.contains("</TD>")) {
				sb.append(str);
			}
		}
		System.out.println("记录数目为：" + sum);
		in.close();
	}

	static void setReqProperties(HttpURLConnection conn, String host) {
		conn.setRequestProperty("Host", host);
		conn.setRequestProperty("User-Agent",
				"	Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)");
		conn.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		conn.setRequestProperty("Accept-Language", "zh-cn,zh;q=0.5");
		conn.setRequestProperty("Accept-Encoding", "gzip,deflate");
		conn.setRequestProperty("Accept-Charset", "gb2312,utf-8;q=0.7,*;q=0.7");
		conn.setRequestProperty("Keep-Alive", "115");
		conn.setRequestProperty("Proxy-Connection", "keep-alive");
		conn.setRequestProperty("Referer",	 "http://cqsf5.com/ad/gg.html");
		conn.setRequestProperty("Cookie", "rtime=1; ltime=1269414425256; cnzz_eid=10070064-1269263196-http%3A//www.milan1899.cn/; AJSTAT_ok_times=2; lstat_bc_1477113=26045102043723260327; cnzz_a1991834=1; sin1991834=http%3A//www.milan1899.cn/; cnzz_a1991811=1; sin1991811=http%3A//www.milan1899.cn/; cnzz_a1917864=0; sin1917864=none; cck_lasttime=1269414425475; cck_count=0; AJSTAT_ok_pages=1; lstat_ss_1477113=0_1269443225_2161130022");
	}

	static void printRespHeader(Map<?, ?> map) {
		System.out.println("getting head >>>>>>>>>>>>>>>>> ");
		for (Object o : map.keySet()) {
			System.out.println("[" + o + "]\t=\t[" + map.get(o) + "]");
		}
		System.out.println("getting head end <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ");
	}

	static void saveInfo(String str) {
		//str = "<TR bgColor=#FFFF00 onmouseover=javascript:this.bgColor='#ffffff' onmouseout=javascript:this.bgColor='#FFFF00'><TD width=110><a href=http://www.488hj.com target=_blank>㊣荣耀无内功F㊣</a></TD><TD width=120><a href='http://www.488hj.com' target='_blank'>㊣5分钟金牛套㊣</a></TD><TD width=145></TD><TD width=100>电信+网通</TD><TD width=110>㊣免费闭关㊣</TD><TD>◤升级送装备◥◤此版本你若见过我关F◥</TD><TD width=48><a href=http://www.488hj.com target=_blank>点击查看</a></TD></TR>";
		//System.out.println(str.length());

		// 获取名字
		int nameIndex = str.indexOf("<TD");
		int nameEnd = str.indexOf("</a>");
		String nameTD = str.substring(nameIndex, nameEnd);
		String name = nameTD.substring(nameTD.lastIndexOf(">") + 1);
		// System.out.println(nameIndex + "," + nameEnd + "," + nameTD + "," +
		// name);
		System.out.println("name:"+name);

		str = str.substring(nameEnd + "</a></TD>".length());
		// 获取IP
		int ipIndex = str.indexOf("<TD");
		int ipEnd = str.indexOf("</a>");
		String ipTD = str.substring(ipIndex, ipEnd);
		String ip = ipTD.substring(ipTD.lastIndexOf(">") + 1);
		System.out.println("ip:"+ip);

		str = str.substring(ipEnd + "</a></TD>".length());
		// 获取时间
		int timeIndex = str.indexOf("<TD");
		int timeEnd = str.indexOf("</TD>");
		String timeTD = str.substring(timeIndex, timeEnd);
		String time = timeTD.substring(timeTD.lastIndexOf(">") + 1);
		System.out.println("time"+time);

		str = str.substring(timeEnd + "</TD>".length());
		// 获取地区线路
		int areaLineIndex = str.indexOf("<TD");
		int areaLineEnd = str.indexOf("</TD>");
		String areaLineTD = str.substring(areaLineIndex, areaLineEnd);
		String areaLine = areaLineTD.substring(areaLineTD.lastIndexOf(">") + 1);
		System.out.println("areaLine:"+areaLine);

		str = str.substring(areaLineEnd + "</TD>".length());
		// 获取版本
		int versionIndex = str.indexOf("<TD");
		int versionEnd = str.indexOf("</TD>");
		if (str.contains("<font color=#0000FF>")) {
			versionEnd = str.indexOf("<font");
		}
		String versionTD = str.substring(versionIndex, versionEnd);
		String version = versionTD.substring(versionTD.lastIndexOf(">") + 1);
		System.out.println("version:"+version);

		if (str.contains("<font color=#0000FF>")){
			str = str.substring(versionEnd + "<font color=#0000FF>←推荐</font></TD>".length());
		}else{
			str = str.substring(versionEnd + "</TD>".length());
		}
		// 获取qq
		int qqIndex = str.indexOf("<TD");
		int qqEnd = str.indexOf("</TD>");
		String qqTD = str.substring(qqIndex, qqEnd);
		String qq = qqTD.substring(qqTD.lastIndexOf(">") + 1);
		System.out.println("qq:"+qq);

		str = str.substring(str.lastIndexOf("href=/go.htm?u=") + "href=/go.htm?u=".length());
		// 获取网站地址
		int lastSpace = str.indexOf(" ");
		String website = str.substring(0, lastSpace);
		System.out.println("website:"+website);

		Info info = new Info();
		info.setAreaLine(areaLine);
		info.setServerIP(ip);
		info.setServerName(name);
		info.setTime(new Date());
		info.setVersionDesc(version);
		info.setWebsite(website);
		info.setServiceQQ(qq);
		if(!infoDao.existByNameIP(name, ip, new Date())){
			infoDao.addInfo(info);
		}
	}

	public static void main(String[] args) throws Exception {
		start(args);
	}
}
