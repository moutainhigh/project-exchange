package com.throne212.auto.action;

import java.util.Date;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.Util;
import com.throne212.auto.domain.News;
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
	private User user;
	private String oldPwd;
	private String newPwd2;
	private String newPwd;
	public String chgPwd(){
		if(Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)){
			this.setReqMsg("�������벻����������������");
		}else if(!newPwd.equals(newPwd2)){
			this.setReqMsg("�����������벻һ��");
		}else if(!userBiz.changePwd(user.getId(), oldPwd, newPwd)){
			this.setReqMsg("�����޸�ʧ�ܣ�����ԭ�����Ƿ�������ȷ");
		}else{
			this.setReqMsg("�����޸ĳɹ�");
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
			this.setReqMsg("���±���ɹ�");
		else
			this.setReqMsg("���±���ʧ�ܣ�����ϵ����Ա");
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
			this.setReqMsg("����ɾ���ɹ�");
		}
		return this.newsList();
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

}
