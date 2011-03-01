package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.FarmAbs;

public interface FarmAbsDao extends BaseDao {
	
	public PageBean<FarmAbs> getFarmAbsList(FarmAbs condition,Date fromDate,Date toDate,Integer pageIndex,String farmType,Long farmId,String accountName,String orderBy,String orderType);
	public List<FarmAbs> getFarmAbsList(FarmAbs condition,Date fromDate,Date toDate,String farmType,Long farmId,String accountName,String orderBy,String orderType);

}
