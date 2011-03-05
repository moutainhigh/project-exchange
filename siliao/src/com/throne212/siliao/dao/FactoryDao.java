package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.FactoryAbs;



public interface FactoryDao extends BaseDao {
	
	public PageBean<FactoryAbs> getFactoryAbsList(FactoryAbs condition,Date fromDate,Date toDate,Integer page,String type,Long factoryId,String accountName,String orderBy,String orderType,int pageSize);
	
	public List<FactoryAbs> getFactoryList(FactoryAbs condition,Date fromDate,Date toDate,String type,Long factoryId,String accountName,String orderBy,String orderType);
	

}
