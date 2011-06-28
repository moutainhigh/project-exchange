package eahoosoft.freemarker;

import eahoosoft.test.Init;

public class All {
	public static void main(String[] args) throws Exception {
		//初始化数据
		Init.main(null);
		//生成HTML
		Index.main(null);
		Products.main(null);
		ProductDetail.main(null);
	}
}
