package com.throne212.auto.biz;

import java.util.List;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.User;

public interface NewsBiz extends BaseBiz{

	public News addNews(News news);
	
	public PageBean<News> getNews(int page);
	
	public PageBean<News> getNews(int page,int type);
	
	public News getLastedRecommendNews();
	
	public PageBean<News> getNews(int page,String key);
	
	public PageBean<Special> getSpecials(int page,String key);
	
	public List<News> getTop9News();
	
	public List<News> getTop7News();
	
	public List<News> getTop7BaoYangNews();
	public List<News> getTop7ChengBenNews();
	public List<News> getTop3ZhuangShiNews();
	public List<News> getTop5BaoxianNews();
	
	public List<News> getTop5zjXindeNews();
	public List<News> getTop6jjXindeNews();
	public List<News> getTop12BeijingNews();
	
	public List<Special> getTop9Special();
	
}
