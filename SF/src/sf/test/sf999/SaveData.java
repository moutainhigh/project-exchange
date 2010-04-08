package sf.test.sf999;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import sf.common.Constant;
import sf.dao.InfoDao;
import sf.pojo.Info;

public class SaveData {
	// 3月/31日/21点/30分开放
	static SimpleDateFormat format1 = new SimpleDateFormat("yyyy年/M月/d日/HH点开放");
	static SimpleDateFormat format2 = new SimpleDateFormat("yyyy年/M月/d日/HH点mm分开放");
	static SimpleDateFormat format3 = new SimpleDateFormat("yyyy年/M月/d日/通宵推荐");
	static SimpleDateFormat format4 = new SimpleDateFormat("yyyy年/M月/d日/通宵固顶");
	static SimpleDateFormat format5 = new SimpleDateFormat("yyyy年/M月/d日/全天");
	static InfoDao infoDao = new InfoDao();

	public static void parseStr(String str) {
		// String str = "<tr bgcolor=\\\"#FFFFFF\\\"
		// onmouseover=javascript:this.bgColor=\\'#ffccff\\'
		// onmouseout=javascript:this.bgColor=\\'#FFFFFF\\'><TD width=120> <a
		// href=http://www.170jinqian.com target=\"_blank\"><font
		// color=#000000>╋╋博会一区╋╋</font></a></TD><TD width=101><a
		// href=http://www.170jinqian.com
		// target=\"_blank\">新…10分钟120级</a></TD><TD class=font_R
		// width=150>3月/31日/21点/30分开放</TD><TD align=center
		// width=80>◥◣双线◢◤</TD><TD>区区600人+满…新送倚天荣耀双连击1秒-<font
		// color=#ff0000>推荐</font></TD><TD align=center width=80>荣耀满地爆★</TD><TD
		// align=center width=56><a href=http://www.170jinqian.com
		// target=\"_blank\">点击查看</a></TD></tr>";
		// System.out.println(str);
		String regex = "<[^>]{1,}>";
		String[] arr = str.split(regex);
		List<String> list = new ArrayList<String>();
		for (String s : arr) {
			s = s.trim();
			if (!"".equals(s) && !"点击查看".equals(s) & !s.contains("推荐")) {
				list.add(s);
			}
		}
		int begin = str.indexOf("http:");
		int end = str.indexOf(" target=");
		String url = str.substring(begin, end);
		list.add(url);
		String type = Constant.INFO_TYPE_TIME;
		String timeStr = list.get(2);
		if (timeStr != null && timeStr.contains("通宵")) {
			type = Constant.INFO_TYPE_TONG_XIAO;
		} else if (timeStr != null && timeStr.contains("全天")) {
			type = Constant.INFO_TYPE_ALL_DAY;
		}
		if (list == null || list.size() != 7) {
			return;
		}
		saveRecord(list, type);
	}

	public static void saveRecord(List<String> list, String type) {
		String name = list.get(0);
		String ip = list.get(1);
		String timeStr = list.get(2);
		Calendar now = GregorianCalendar.getInstance();
		if (timeStr != null && !timeStr.contains("年"))
			timeStr = now.get(GregorianCalendar.YEAR) + "年/" + timeStr;
		Date time = null;
		try {
			time = format1.parse(timeStr);
		} catch (ParseException e) {
			try {
				time = format2.parse(timeStr);// 带有30分钟
			} catch (ParseException e1) {
				try {
					time = format5.parse(timeStr);// 全天
				} catch (ParseException e3) {
					try {
						time = format3.parse(timeStr);// 通宵1
						time = new Date(time.getTime() + 24 * 60 * 60 * 1000);
					} catch (ParseException e2) {
						try {
							time = format4.parse(timeStr);// 通宵2
						} catch (ParseException e5) {
							e5.printStackTrace();
							return;
						}
					}
				}
			}
		}
		String areaLine = list.get(3);
		String version = list.get(4);
		String qq = list.get(5);
		String website = list.get(6);
		Info info = new Info();
		info.setAreaLine(areaLine);
		info.setServerIP(ip);
		info.setServerName(name);
		info.setServiceQQ(qq);
		info.setTime(time);
		info.setType(type);
		info.setVersionDesc(version);
		info.setWebsite(website);
		infoDao.addInfo(info);
	}

}
