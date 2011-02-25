package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.User;

public interface BillDao extends BaseDao {

	// 我的单据
	public PageBean<Bill> getMyBillList(Bill condition, Date fromDate, Date toDate, String currMan, Date planFromDate, Date planToDate,
			Date sendFromDate, Date sendToDate, User user, Integer page);

	public List<Bill> getMyBillList(Bill condition, Date fromDate, Date toDate, String currMan, Date planFromDate, Date planToDate,
			Date sendFromDate, Date sendToDate, User user);

	// 待我的单据
	public PageBean<Bill> getWaitBillList(Bill condition, Date fromDate, Date toDate, String currMan, User user,String accountName, Integer page);

	public List<Bill> getWaitBillList(Bill condition, Date fromDate, Date toDate, String currMan, User user,String accountName);
	
	// 待我的单据
	public PageBean<Bill> getAdminBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName, Integer page);

	public List<Bill> getAdminBillList(Bill condition, Date fromDate, Date toDate, String currMan,String accountName);
	
	// 对账
	public PageBean<Bill> getSentBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName, Integer page);

	public List<Bill> getSentBillList(Bill condition, Date fromDate, Date toDate, String currMan,String accountName);
}
