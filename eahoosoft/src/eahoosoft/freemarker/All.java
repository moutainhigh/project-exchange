package eahoosoft.freemarker;

import eahoosoft.test.GuideHtml;
import eahoosoft.test.Init;

public class All {
	public static void main(String[] args) throws Exception {
		//初始化数据
		Init.main(null);
		GuideHtml.main(null);
		//生成HTML
		Index.main(null);
		Products.main(null);
		ProductDetail.main(null);
		Download.main(null);
		Purchase.main(null);
		Other.main(null);
		Guide.main(null);
	}
}
