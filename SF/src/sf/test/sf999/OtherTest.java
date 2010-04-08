package sf.test.sf999;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class OtherTest {

	public static void main(String[] args) throws ParseException {
		/*String str = "2010年/3月/31日/17点30分开放";
		System.out.println(SaveData.format2.parse(str));*/
		
		
		/*String str = "<tr bgcolor=\\\"#FFFFFF\\\" onmouseover=javascript:this.bgColor=\\'#ffccff\\' onmouseout=javascript:this.bgColor=\\'#FFFFFF\\'><TD width=120> <a href=http://www.170jinqian.com target=\"_blank\"><font color=#000000>╋╋博会一区╋╋</font></a></TD><TD width=101><a href=http://www.170jinqian.com target=\"_blank\">新…10分钟120级</a></TD><TD class=font_R width=150>3月/31日/21点/30分开放</TD><TD align=center width=80>◥◣双线◢◤</TD><TD>区区600人+满…新送倚天荣耀双连击1秒-<font color=#ff0000>推荐</font></TD><TD align=center width=80>荣耀满地爆★</TD><TD align=center width=56><a href=http://www.170jinqian.com target=\"_blank\">点击查看</a></TD></tr>";
		//String str = "<23 23>8123<asdf>456<23><we>";
		
		String regex = "<[^>]{1,}>";
		String[] arr = str.split(regex);
		System.out.println("len="+arr.length);
		for(String s : arr){
			if(!"".equals(s.trim()))
				System.out.println(s.trim());
		}
		
		int begin = str.indexOf("http:");
		int end = str.indexOf(" target=");
		System.out.println(str.substring(begin,end));*/
		
		
		String str = "2010年/3月/31日/23点开放";
		SimpleDateFormat f = new SimpleDateFormat("yyyy年/M月/d日/HH点开放");
		System.out.println(f.parse(str));
		
	}
	
}
