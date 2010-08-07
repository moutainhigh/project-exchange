package com.throne212.auto.action;

import java.util.Date;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.Util;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class ManageAction extends BaseAction {
	
	private UserBiz userBiz;
	private NewsBiz newsBiz;

	public String execute(){
		return "main";
	}
	public String index(){
		return "main";
	}
	
	//news
	private User user;
	private String oldPwd;
	private String newPwd2;
	private String newPwd;
	public String chgPwd(){
		if(Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)){
			this.setReqMsg("密码输入不完整，请重新输入");
		}else if(!newPwd.equals(newPwd2)){
			this.setReqMsg("两次密码输入不一致");
		}else if(!userBiz.changePwd(user.getId(), oldPwd, newPwd)){
			this.setReqMsg("密码修改失败，请检查原密码是否输入正确");
		}else{
			this.setReqMsg("密码修改成功");
		}
		return "pwd";
	}
	
	
	private PageBean<News> newsPageBean;
	private int page;
	public String newsList(){
		newsPageBean = newsBiz.getNews(page);
		return "news_list";
	}
	
	private News news;
	public String saveNews(){
		if(news == null)
			return "news_edit";
		if(news.getId() == null)
			news = newsBiz.addNews(news);
		else{
			news.setPublishDate(new Date());
			newsBiz.saveOrUpdateEntity(news);
			news = newsBiz.getEntityById(News.class, news.getId());
		}
		if(news.getId() != null)
			this.setReqMsg("文章保存成功");
		else
			this.setReqMsg("文章保存失败，请联系管理员");
		return "news_edit";
	}
	public String news(){
		if(news.getId() != null)
			news = newsBiz.getEntityById(News.class, news.getId());
		return "news_edit";
	}
	public String deleteNews(){
		if(news.getId() != null){
			newsBiz.deleteEntity(News.class, news.getId());
			this.setReqMsg("文章删除成功");
		}
		return this.newsList();
	}
	
	//4s sale
	private PageBean<Sale> salePageBean;
	public String saleList(){
		salePageBean = userBiz.getSales(page);
		return "sale_list";
	}	
	private Sale sale;
	public String saveSale(){
		if(sale == null)
			return "sale_edit";
		if(sale.getId() != null){
			String pwd = userBiz.getEntityById(Sale.class, sale.getId()).getPassword();
			sale.setPassword(pwd);
		}
		userBiz.saveOrUpdateEntity(sale);
		if(sale.getId() != null)
			this.setReqMsg("4S店资料保存成功");
		else
			this.setReqMsg("4S店资料保存失败，请联系管理员");
		return "sale_edit";
	}
	public String sale(){
		if(sale.getId() != null)
			sale = userBiz.getEntityById(Sale.class, sale.getId());
		return "sale_edit";
	}
	public String deleteSale(){
		if(sale.getId() != null){
			userBiz.deleteEntity(Sale.class, sale.getId());
			this.setReqMsg("4S店删除成功");
		}
		return this.saleList();
	}
	
	//4s sale car
	private PageBean<Car> carPageBean;
	public String carList(){
		carPageBean = userBiz.getSales(page);
		return "car_list";
	}	
	private Sale car;
	public String saveSale(){
		if(car == null)
			return "car_edit";
		if(car.getId() != null){
			String pwd = userBiz.getEntityById(Sale.class, sale.getId()).getPassword();
			sale.setPassword(pwd);
		}
		userBiz.saveOrUpdateEntity(sale);
		if(sale.getId() != null)
			this.setReqMsg("4S店资料保存成功");
		else
			this.setReqMsg("4S店资料保存失败，请联系管理员");
		return "sale_edit";
	}
	public String sale(){
		if(sale.getId() != null)
			sale = userBiz.getEntityById(Sale.class, sale.getId());
		return "sale_edit";
	}
	public String deleteSale(){
		if(sale.getId() != null){
			userBiz.deleteEntity(Sale.class, sale.getId());
			this.setReqMsg("4S店删除成功");
		}
		return this.saleList();
	}
	
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd2() {
		return newPwd2;
	}
	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public UserBiz getUserBiz() {
		return userBiz;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
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
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public PageBean<Sale> getSalePageBean() {
		return salePageBean;
	}
	public void setSalePageBean(PageBean<Sale> salePageBean) {
		this.salePageBean = salePageBean;
	}
	public Sale getSale() {
		return sale;
	}
	public void setSale(Sale sale) {
		this.sale = sale;
	}

}
