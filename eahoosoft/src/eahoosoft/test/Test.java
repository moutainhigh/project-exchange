package eahoosoft.test;

import eahoosoft.freemarker.Common;

public class Test {
	public static void main(String[] args) {
		String str = "aaa,eahoosoft-DVD-Ripper,bbb";
		str = Common.replaceChars(str);
		System.out.println(str);
	}
}
