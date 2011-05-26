package com.throne212.saishi.dao;

import java.util.Date;
import java.util.List;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.News;

public interface NewsDao extends BaseDao {
	public PageBean<News> getNewsList(News condition, Date fromDate, Date toDate, int page, String orderBy, String orderType, int pageSize);

	public List<News> getTopNews(String type);
}
