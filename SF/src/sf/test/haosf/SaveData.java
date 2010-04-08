package sf.test.haosf;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import sf.common.Constant;
import sf.dao.InfoDao;
import sf.pojo.Info;

public class SaveData {

	static SimpleDateFormat format1 = new SimpleDateFormat("yyyy年/M月/d日/H点开放");
	static SimpleDateFormat format2 = new SimpleDateFormat("yyyy年/M月/d日/H点mm分开放");
	static InfoDao infoDao = new InfoDao();
	
	public static void main(String[] args) {
		String str = "<tr bgcolor=#FFFFFF class=style6 onmouseover=javascript:this.bgColor=\\'#FFCCFF\\' onmouseout=javascript:this.bgColor=\\'#FFFFFF\\'><td width=96 class=style6><a href=http://www.815sf.com target=_blank><font color=#000000>█倚天传说一区█</font></a></td><td width=107  class=style6>送倚天█免费闭关</td><td width=190 class=style5><font color=red><b>-=全天置顶推荐=-</b></font></td><td width=80  class=style6>⑤分钟100级</td><td width=266  class=style49>送倚天█荣耀█炎龙█狂爆█佛法无边套█-<span class=style74>推荐<\\/span></td><td width=128 class=style6>客服QQ：█无GM公平█</td><td class=style6><A href=http://www.815sf.com target=_blank><font color=\\'#000000\\'>点击查看</font></a><\\/td></tr>";
		System.out.println(str);
		String seg = "###";
		//取时间类型的
		if(str.contains("2010年/3月/31日")){
			str = str.substring(str.indexOf("target=_blank>")+"target=_blank>".length(),str.lastIndexOf(" target=_blank>"));
			str = str.replace("</a></td><td class=style6 width=107>", seg);
			str = str.replace("</td><td class=style5 width=190><span class=style93>", seg);
			str = str.replace("</span></td><td class=style6 width=80><font color=blue>", seg);
			str = str.replace("</font></td><td class=style49 width=266>", seg);
			str = str.replace("</td><td width=128 class=style6 width=128>客服QQ：", seg);
			str = str.replace("</td><td class=style6><A href=http:\\/\\/", seg);
			System.out.println(str);
			String[] arr = str.split(seg);
			saveRecord(arr,Constant.INFO_TYPE_TIME);
		}
		
		if(str.contains("全天置顶推荐")){
			str = str.substring(str.indexOf("target=_blank>")+"target=_blank>".length(),str.lastIndexOf(" target=_blank>"));
			str = str.replace("</a></td><td class=style6 width=107>", seg);
			str = str.replace("</td><td class=style5 width=190><span class=style93>", seg);
			str = str.replace("</span></td><td class=style6 width=80><font color=blue>", seg);
			str = str.replace("</font></td><td class=style49 width=266>", seg);
			str = str.replace("</td><td width=128 class=style6 width=128>客服QQ：", seg);
			str = str.replace("</td><td class=style6><A href=http:\\/\\/", seg);
		}
		
		
		/*for(String s : arr){
			System.out.println(s);
		}*/
		
	}
	
	public static void saveRecord(String[] arr,String type){
		String name = arr[0];
		String ip = arr[1];
		Date time = null;
		try {
			time = format1.parse(arr[2]);
		} catch (ParseException e) {
			try {
				time = format2.parse(arr[2]);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}
		String areaLine = arr[3];
		String version = arr[4];
		String qq = arr[5];
		String website = arr[6];
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
