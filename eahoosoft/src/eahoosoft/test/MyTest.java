package eahoosoft.test;

public class MyTest {

	public static void main(String[] args) {
		String str = "<div class=\"buyNowBig_below\">\n<a target=\"_blank\" href=\"https://usd.swreg.org/cgi-bin/s.cgi?s=128442&amp;p=128442-2&amp;q=1&amp;v=0&amp;d=0\"><span>Buy Now</span></a>\n</div>";
		String reg = "<div class=\"buyNowBig_below\">.*\n.*\n.*</div>";
		System.out.println(str.replaceFirst(reg, ""));
	}
	
}
