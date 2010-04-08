package sf;

public class Milan1899Test {

	public static void main(String[] args) {
		String str = "<TR bgColor=#F0F8FF onmouseover=javascript:this.bgColor='#F5DEB3' onmouseout=javascript:this.bgColor='#F0F8FF'><TD width=110><a href=/go.htm?u=http://www.baiduzsf.com target=_blank>Ｎ人气双连击一区Ｎ</a></TD><TD width=120><a href=/go.htm?u=http://www.baiduzsf.com target='_blank'>人气双连击一区</a></TD><TD width=195>2010年/3月/21日/上午08点30开放</TD><TD align=center width=85>中国电信</TD><TD>１·７６独家赌博·干老妹·放烟花·蹲真假<font color=#0000FF>←推荐</font></TD><TD width=85>游戏中查询</TD><TD align=center width=60><a href=/go.htm?u=http://www.baiduzsf.com target=_blank>点击查看</a></TD></TR>";
		String tmp = "<TD>１·７６独家赌博·干老妹·放烟花·蹲真假<font color=#0000FF>←推荐</font></TD><TD width=85>游戏中查询</TD><TD align=center width=60><a href=/go.htm?u=http://www.baiduzsf.com target=_blank>点击查看</a></TD></TR>";
		System.out.println(str.length());
		
		//获取名字
		int nameIndex = str.indexOf("<TD");
		int nameEnd = str.indexOf("</a>");
		String nameTD = str.substring(nameIndex, nameEnd);
		String name = nameTD.substring(nameTD.lastIndexOf(">")+1);
		//System.out.println(nameIndex + "," + nameEnd + "," + nameTD + "," + name);
		System.out.println(name);
		
		str = str.substring(nameEnd+"</a></TD>".length());
		//获取IP
		int ipIndex = str.indexOf("<TD");
		int ipEnd = str.indexOf("</a>");
		String ipTD = str.substring(ipIndex,ipEnd);
		String ip = ipTD.substring(ipTD.lastIndexOf(">")+1);
		System.out.println(ip);
		
		str = str.substring(ipEnd+"</a></TD>".length());
		//获取时间
		int timeIndex = str.indexOf("<TD");
		int timeEnd = str.indexOf("</TD>");
		String timeTD = str.substring(timeIndex,timeEnd);
		String time = timeTD.substring(timeTD.lastIndexOf(">")+1);
		System.out.println(time);
		
		str = str.substring(timeEnd+"</TD>".length());
		//获取地区线路
		int areaLineIndex = str.indexOf("<TD");
		int areaLineEnd = str.indexOf("</TD>");
		String areaLineTD = str.substring(areaLineIndex,areaLineEnd);
		String areaLine = areaLineTD.substring(areaLineTD.lastIndexOf(">")+1);
		System.out.println(areaLine);
		
		str = str.substring(areaLineEnd+"</TD>".length());
		//获取版本
		int versionIndex = str.indexOf("<TD");
		int versionEnd = str.indexOf("</TD>");
		if(str.contains("<font color=#0000FF>")){
			versionEnd = str.indexOf("<font");
		}		
		String versionTD = str.substring(versionIndex,versionEnd);
		String version = versionTD.substring(versionTD.lastIndexOf(">")+1);
		System.out.println(version);
		
		str = str.substring(str.lastIndexOf("href=/go.htm?u=")+"href=/go.htm?u=".length());
		//获取网站地址
		int lastSpace = str.indexOf(" ");
		String website = str.substring(0,lastSpace);
		System.out.println(website);
		
		
		
	}

}
