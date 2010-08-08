package com.throne212.auto.biz;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.User;

public interface NewsBiz extends BaseBiz{

	public News addNews(News news);
	
	public PageBean<News> getNews(int page);
	
	public PageBean<News> getNews(int page,int type);
	
}
