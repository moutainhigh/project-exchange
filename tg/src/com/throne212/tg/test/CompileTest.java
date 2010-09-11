package com.throne212.tg.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CompileTest {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("<h1><a class=\"deal-today-link\" href=\"/team.php?id=116\">今日抢购：</a>【爱心1元捐】杰士邦“性感前束”安全套！1盒12片，市场价45元，章鱼团秒杀价只需22.5元，一片还不到2元钱！买就送世界杯限量版开瓶器！买2盒就包邮！团一盒杰士邦，团一份激情与浪漫！</h1>");
		Pattern p = Pattern.compile("【.*】");
		Matcher m = p.matcher(sb);
		boolean b = m.matches();
		System.out.println("匹配与否：" + b);
		while(m.find()){
			System.out.println("========================");
			System.out.println(m.group()+"\t"+m.start()+"-"+m.end());
		}
	}
}
