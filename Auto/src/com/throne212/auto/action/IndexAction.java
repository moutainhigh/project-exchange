package com.throne212.auto.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.Zhuangshi;

public class IndexAction extends BaseAction {
	
	private UserBiz userBiz;
	private NewsBiz newsBiz;
	private String username;
	
	public String execute() throws Exception {
		return "index";
	}

	private String top4ImageNews;
	public String index() throws Exception {		
		String dyn = ServletActionContext.getRequest().getParameter("dyn");
		if("Y".equals(dyn)){		
			List<News> imageNews = newsBiz.getTop4RecommendImageNews();
			if(imageNews != null && imageNews.size() > 0){
				JSONArray arr = new JSONArray();
				for(News news : imageNews){
					JSONObject obj = new JSONObject();
					obj.accumulate("id", news.getId());
					obj.accumulate("title", news.getTitle());
					obj.accumulate("image", news.getImage());
					obj.accumulate("no", news.getNo());
					arr.add(obj);				
				}
				top4ImageNews = arr.toString();
			}
			return "index";
		}else{
			return "index_html";
		}
	}
	
	
	private PageBean<Sale> salePageBean;
	private int page;
	public String sale4s() throws Exception {
		salePageBean = userBiz.getSales(page,20);
		return "sale_list";
	}
	private Sale sale;
	private PageBean<Car> carPageBean;
	private List<Brand> brandList;
	private Brand brand;
	public String sale() throws Exception{
		sale = userBiz.getEntityById(Sale.class, sale.getId());
		if(brand != null && brand.getId() != null){
			carPageBean = userBiz.getCarsBySale(sale.getId(),brand.getId(), page);
		}else
			carPageBean = userBiz.getCarsBySale(sale.getId(), page);
		brandList = newsBiz.getBrandList(sale.getId());
		return "sale";
	}
	public String carList() throws Exception{
		sale();
		return "sale_car";
	}
	private Car car;
	public String car() throws Exception{
		sale();
		if(car != null && car.getId() != null){
			car = newsBiz.getEntityById(Car.class, car.getId());
		}
		return "sale_car_detail";
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
	private Category cate;
	public String newsList() throws Exception{
		if(news == null || news.getOrderNum() == null){
			news = new News();
			news.setOrderNum(WebConstants.NEWS_NEWS);
		}
		newsPageBean = newsBiz.getNews(page, news.getOrderNum());
		cate = newsBiz.getEntityByUnique(Category.class, "orderNum", news.getOrderNum());
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
		String auto = ServletActionContext.getRequest().getParameter("auto");
		if(!"Y".equals(auto)){
			news.setClick(news.getClick()+1);
			userBiz.saveOrUpdateEntity(news);
		}
		//other5RecommendNewsList = newsBiz.getOther5RecommendNews(news.getCategory().getOrderNum());
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
	public String cepingNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_CEPING);
		return other();
	}
	public String beijingNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_BEIJING);
		return other();
	}
	public String baoxianNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_BAOXIAN);
		return other();
	}
	public String baoyangNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_BAOYANG);
		return other();
	}
	public String chengbenNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_CHENGBEN);
		return other();
	}
	public String zhuangshiNews() throws Exception{
		news = new News();
		news.setOrderNum(WebConstants.NEWS_ZHUANGSHI);
		return other();
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
			//newsPageBean = newsBiz.getSpecials(page, key);
			//key = "参茸";
			salePageBean = userBiz.getSales(page, key);
			return "search_4s";
		}
		return "search";
	}
	
	//保险和装饰
	private Insurance baoxian;
	public String baoxian() throws Exception{
		baoxian = userBiz.getEntityById(Insurance.class, baoxian.getId());
		return "baoxian";
	}
	private Zhuangshi zhuangshi;
	public String zhuangshi() throws Exception{
		zhuangshi = userBiz.getEntityById(Zhuangshi.class, zhuangshi.getId());
		return "zhuangshi";
	}
	
	public String login() throws Exception{
		return "login";
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

	public PageBean getNewsPageBean() {
		return newsPageBean;
	}

	public void setNewsPageBean(PageBean newsPageBean) {
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
	public Insurance getBaoxian() {
		return baoxian;
	}
	public void setBaoxian(Insurance baoxian) {
		this.baoxian = baoxian;
	}
	public Zhuangshi getZhuangshi() {
		return zhuangshi;
	}
	public void setZhuangshi(Zhuangshi zhuangshi) {
		this.zhuangshi = zhuangshi;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public Category getCate() {
		return cate;
	}
	public void setCate(Category cate) {
		this.cate = cate;
	}
}
