package com.throne212.tg.web.dao;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.News;

public interface NewsDao extends BaseDao {
	public PageBean<News> getAllNews(int page);

}
