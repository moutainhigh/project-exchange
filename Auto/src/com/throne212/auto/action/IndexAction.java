package com.throne212.auto.action;

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
	
	public String index() throws Exception {
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
	private PageBean<News> newsPageBean;
	private News news;
	public String newsList() throws Exception{
		newsPageBean = newsBiz.getNews(page, news.getOrderNum());
		switch (news.getType()) {
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
	public String news() throws Exception{
		news = userBiz.getEntityById(News.class, news.getId());
		news.setClick(news.getClick()+1);
		userBiz.saveOrUpdateEntity(news);
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

}
