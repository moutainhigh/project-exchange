package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Bill;


public interface BillDao extends BaseDao {

	public PageBean<Bill> getBillList(Bill condition, Date fromDate, Date toDate, Integer pageIndex);
	public List<Bill> getBillList(Bill condition,Date fromDate,Date toDate);
}
