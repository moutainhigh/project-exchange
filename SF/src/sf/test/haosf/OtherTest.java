package sf.test.haosf;

import java.text.ParseException;

public class OtherTest {

	public static void main(String[] args) throws ParseException {
		String str = "2010年/3月/31日/17点30分开放";
		System.out.println(SaveData.format2.parse(str));
	}
	
}
