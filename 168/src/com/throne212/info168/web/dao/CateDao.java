package com.throne212.info168.web.dao;

import java.util.List;

import com.throne212.info168.web.domain.Category;

public interface CateDao extends BaseDao{
	public List<Category> getTopCates();
	public List<Category> get2ndCates(Category parent);
}
