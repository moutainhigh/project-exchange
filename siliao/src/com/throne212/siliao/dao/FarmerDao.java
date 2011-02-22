package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Farmer;

public interface FarmerDao extends BaseDao{

	public PageBean<Farmer> getFarmerList(Farmer condition,Date fromDate,Date toDate,int page);
	public List<Farmer> getFarmerList(Farmer condition,Date fromDate,Date toDate);
}
