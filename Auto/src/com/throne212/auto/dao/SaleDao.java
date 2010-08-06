package com.throne212.auto.dao;

import com.throne212.auto.domain.Sale;

public interface SaleDao extends BaseDao{

	public Sale getSaleByLoginName(String loginName);
	
}
