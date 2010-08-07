package com.throne212.auto.dao;

import java.util.List;

import com.throne212.auto.domain.Sale;

public interface SaleDao extends BaseDao {

	public List<Sale> getSaleList(int first, int max);

	public long getSaleListCount();

}
