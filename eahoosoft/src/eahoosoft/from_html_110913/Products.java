package eahoosoft.from_html_110913;

import java.net.URL;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Category;
import eahoosoft.pojo.Feature;
import eahoosoft.pojo.HotTag;
import eahoosoft.pojo.Product;

public class Products {

	public static void main(String[] args) throws Exception {
		URL url = new URL(Consts.SITE_PRE + "products.html");
		Document doc = Jsoup.parse(url, 10000);

		Element head = doc.head();
		Elements list = doc.select("#subNavMenu li a");

		for (Element cate : list) {
			String name = cate.text();
			String fileName = "";

			String linkName = cate.attr("href");
			String[] arr = linkName.split("-");
			if (arr != null && arr.length > 1) {
				fileName = arr[1];
			}

			System.out.println(name + "\t" + fileName + "\t" + cate.toString());
			System.out.println("**************************");
			htmlProductsUrl(Consts.SITE_PRE + linkName, fileName);

		}
	}

	private static void htmlProductsUrl(String urlStr, String cateName) throws Exception {
		URL url = new URL(urlStr);
		Document doc = Jsoup.parse(url, 10000);

		Element head = doc.head();
		Elements list = doc.select(".productsListShow");

		for (Element pro : list) {
			Element a = pro.select("h2 a").get(0);
			Element p = pro.select("p").get(0);

			String proName = a.text();
			String proDesc = p.text();
			String link = a.attr("href");

			System.out.println(proName);
			// System.out.println(proDesc);
			// System.out.println(link);
			System.out.println("===================");

			htmlProductDetailUrl(Consts.SITE_PRE + link, proDesc, cateName);

		}
	}

	private static int order = 1;

	private static void htmlProductDetailUrl(String urlStr, String longDesc, String cateName) throws Exception {
		URL url = new URL(urlStr);
		Document doc = Jsoup.parse(url, 10000);

		Product p = new Product();

		// 路径
		String fileName = urlStr.substring(urlStr.lastIndexOf("/") + 1, urlStr.length() - 5);
		System.out.println(fileName);
		p.setFileName(fileName);

		// 名称
		String proName = doc.select(".productsShow h2").get(0).text();
		System.out.println(proName);
		p.setName(proName);

		// 图片
		String image = doc.select(".productsLeft img").get(0).attr("src");
		image = image.substring(image.lastIndexOf("/") + 1);
		System.out.println(image);
		p.setImage(image);

		// 截图
		String shot = doc.select(".productsLeft .lefttext a").get(0).attr("href");
		shot = shot.substring(shot.lastIndexOf("/") + 1);
		System.out.println(shot);
		p.setScreenShot(shot);

		// 价格
		String price = doc.select(".buyNowBig span").get(0).text();
		price = price.substring(price.lastIndexOf("$") + 1).trim();
		System.out.println(price);
		p.setPrice(Double.parseDouble(price));

		// 购买地址
		String buy = doc.select(".buyNowBig a").get(0).attr("href");
		System.out.println(buy);
		p.setBuyUrl(buy);

		// 大小
		String size = doc.select(".freeTrialBig span").get(0).text();
		size = size.substring(size.lastIndexOf(":") + 1).trim();
		System.out.println(size);
		p.setSize(size);

		// 下载地址
		String down = doc.select(".freeTrialBig a").get(0).attr("href");
		down = down.substring(down.lastIndexOf("/") + 1).trim();
		System.out.println(down);
		p.setDownUrl(down);

		// 详细介绍
		String desc = doc.select(".productsMid").html();
		System.out.println(desc.length());
		p.setDescription(desc);

		// 特点
		Set<Feature> fs = getFeature(doc.select(".productsShowLeft .proContents"));
		p.setFeatures(fs);

		p.setLongDesc(longDesc);

		// //段介绍
		// String shortDesc = desc.substring(0, desc.indexOf("."));
		// p.setShortDesc(shortDesc);

		// 短名称
		String shortName = proName.substring(proName.indexOf(" ") + 1);
		p.setShortName(shortName);

		p.setOrderNum(order++);

		// 获取icon和version
		String downUrl = Consts.SITE_PRE + "download.html";
		if (cateName != null && !"".equals(cateName)) {
			downUrl = Consts.SITE_PRE + "download-" + cateName + "-tools.html";
		}
		buildShortIconVersion(downUrl, p);
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		//类别
		String hql = "from Category c where c.fileName=?";
		List<Category> cateList = s.createQuery(hql).setParameter(0, cateName).list();
		if(cateList != null && cateList.size() > 0)
			p.setCate(cateList.get(0));
		
		s.save(p);
		s.getTransaction().commit();
		s.close();

		// hot tags
		Elements hots = doc.select("#divwin1 a");
		for (Element hot : hots) {
			System.out.println("\t" + hot.text());
			String linkName = hot.text();
			String href = hot.attr("href");
			buildHot(Consts.SITE_PRE + fileName + "/" + href, linkName, p);
		}

	}

	private static void buildShortIconVersion(String downUrl, Product p) throws Exception {
		URL url = new URL(downUrl);
		Document doc = Jsoup.parse(url, 10000);

		Elements ps = doc.select(".dpListShow");

		for (Element e : ps) {
			String proName = e.select(".sort a").text().trim();
			if (proName.equals(p.getName().trim())) {
				String shortDesc = e.select(".sort .productsDesc").text();
				p.setShortDesc(shortDesc);
				String version = e.select(".version").text();
				p.setVersion(version);
			}
		}

	}

	private static Set<Feature> getFeature(Elements fs) {
		Set<Feature> set = new TreeSet<Feature>();
		for (Element e : fs) {
			String title = e.select("h4").text();
			String content = e.select("p").text();
			set.add(buildFeature(title, content));
		}
		System.out.println(set.size());
		return set;
	}

	private static int i;

	private static Feature buildFeature(String title, String content) {
		Feature f = new Feature();
		f.setTitle(title);
		f.setContent(content);
		f.setOrderNum(i++);
		return f;
	}

	private static void buildHot(String hotUrl, String linkName, Product p) throws Exception {
		URL url = new URL(hotUrl);
		Document doc = Jsoup.parse(url, 10000);

		if (doc.select("#my_content").size() == 0)
			return;

		Element head = doc.head();
		try {
			String title = doc.title();
			String keywords = doc.select("meta[name=keywords]").get(0).attr("content");
			String description = doc.select("meta[name=description]").get(0).attr("content");
			String content = doc.select("#my_content").get(0).html();
			HotTag hot = new HotTag();
			hot.setTitle(title);
			hot.setContent(content);
			hot.setDescription(description);
			hot.setHref(hotUrl.substring(hotUrl.lastIndexOf("/") + 1));
			hot.setKeywords(keywords);
			hot.setLinkName(linkName);
			hot.setProduct(p);
			System.out.println(content.length());

			Session s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			s.save(hot);
			s.getTransaction().commit();
			s.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("发生错误的URL是：" + hotUrl);
		}

	}

}
