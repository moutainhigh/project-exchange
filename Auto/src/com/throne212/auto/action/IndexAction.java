package com.throne212.auto.action;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;

public class IndexAction extends BaseAction {
	
	private UserBiz userBiz;
	private NewsBiz newsBiz;
	private String username;
	
	public String execute() throws Exception {
		return "index";
	}

	private String top4ImageNews;
	public String index() throws Exception {
		List<News> imageNews = newsBiz.getTop4RecommendImageNews();
		if(imageNews != null && imageNews.size() > 0){
			JSONArray arr = new JSONArray();
			for(News news : imageNews){
				JSONObject obj = new JSONObject();
				obj.accumulate("id", news.getId());
				obj.accumulate("title", news.getTitle());
				obj.accumulate("image", news.getImage());
				arr.add(obj);				
			}
			top4ImageNews = arr.toString();
		}
		return "index";
	}
	
	
	private PageBean<Sale> salePageBean;
	private int page;
	public String sale4s() throws Exception {
		salePageBean = userBiz.getSales(page,6);
		return "sale_list";
	}
	private Sale sale;
	private PageBean<Car> carPageBean;
	public String sale() throws Exception{
		sale = userBiz.getEntityById(Sale.class, sale.getId());
		carPageBean = userBiz.getCarsBySale(sale.getId(), page);
		return "sale";
	}
	public String carList() throws Exception{
		sale = userBiz.getEntityById(Sale.class, sale.getId());
		carPageBean = userBiz.getCarsBySale(sale.getId(), page);
		return "sale_car";
	}
	
	//special
	private PageBean<Special> specialPageBean;
	private Special special;
	public String specialList() throws Exception{
		specialPageBean = userBiz.getSpecials(page);
		return "special_list";
	}
	public String special() throws Exception{
		special = userBiz.getEntityById(Special.class, special.getId());
		special.setClick(special.getClick()+1);
		userBiz.saveOrUpdateEntity(special);
		return "special";
	}
	
	//news
	private PageBean newsPageBean;
	private News news;
	public String newsList() throws Exception{
		newsPageBean = newsBiz.getNews(page, news.getOrderNum());
		switch (news.getOrderNum()) {
		case WebConstants.NEWS_NEWS:
			return "news_list";
		case WebConstants.NEWS_JINGJI_XINDE:
			return "news_list";
		case WebConstants.NEWS_ZHONGJI_XINDE:
			return "other_list";
		case WebConstants.NEWS_CEPING:
			return "other_list";
		case WebConstants.NEWS_BAOXIAN:
			return "other_list";
		case WebConstants.NEWS_BAOYANG:
			return "other_list";
		case WebConstants.NEWS_CHENGBEN:
			return "other_list";
		case WebConstants.NEWS_ZHUANGSHI:
			return "other_list";
		case WebConstants.NEWS_BEIJING:
			return "other_list";
		default:
			break;
		}
		return null;
	}
	public List<News> other5RecommendNewsList;
	public String news() throws Exception{
		news = userBiz.getEntityById(News.class, news.getId());
		news.setClick(news.getClick()+1);
		userBiz.saveOrUpdateEntity(news);
		other5RecommendNewsList = newsBiz.getOther5RecommendNews(news.getCategory().getOrderNum());
		return "news";
	}
	
	//心得
	public String jjXinde() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_JINGJI_XINDE);
		newsList();
		return "jjXinde";
	}
	public String zjXinde() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_ZHONGJI_XINDE);
		newsList();
		return "zjXinde";
	}
	
	//其它
	public String other() throws Exception{
		newsList();
		return "other_list";
	}
	
	//搜索
	private String key;
	private int searchType;
	public String search() throws Exception{
		key = new String(key.getBytes(),"gbk");
		logger.info("搜索："+key+"，类型为："+searchType);
		if(1 == searchType){
			newsPageBean = newsBiz.getNews(page, key);
		}else if(2 == searchType){
			newsPageBean = newsBiz.getSpecials(page, key);
		}
		return "search";
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public PageBean<Sale> getSalePageBean() {
		return salePageBean;
	}

	public void setSalePageBean(PageBean<Sale> salePageBean) {
		this.salePageBean = salePageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public PageBean<Car> getCarPageBean() {
		return carPageBean;
	}

	public void setCarPageBean(PageBean<Car> carPageBean) {
		this.carPageBean = carPageBean;
	}

	

	public NewsBiz getNewsBiz() {
		return newsBiz;
	}

	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}

	public PageBean<News> getNewsPageBean() {
		return newsPageBean;
	}

	public void setNewsPageBean(PageBean<News> newsPageBean) {
		this.newsPageBean = newsPageBean;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public PageBean<Special> getSpecialPageBean() {
		return specialPageBean;
	}

	public void setSpecialPageBean(PageBean<Special> specialPageBean) {
		this.specialPageBean = specialPageBean;
	}

	public Special getSpecial() {
		return special;
	}

	public void setSpecial(Special special) {
		this.special = special;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getSearchType() {
		return searchType;
	}
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	public String getTop4ImageNews() {
		return top4ImageNews;
	}
	public void setTop4ImageNews(String top4ImageNews) {
		this.top4ImageNews = top4ImageNews;
	}
	public List<News> getOther5RecommendNewsList() {
		return other5RecommendNewsList;
	}
	public void setOther5RecommendNewsList(List<News> other5RecommendNewsList) {
		this.other5RecommendNewsList = other5RecommendNewsList;
	}
}
