package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Rate;

public interface RateDao extends BaseDao{

	public PageBean<Rate> getRateList(Rate condition,Date fromDate,Date toDate,Date fromDate2,Date toDate2,String rateName,int page,String orderBy,String orderType,int pageSize);
	public List<Rate> getRateList(Rate condition,Date fromDate,Date toDate,Date fromDate2,Date toDate2,String rateName,String orderBy,String orderType);
}
