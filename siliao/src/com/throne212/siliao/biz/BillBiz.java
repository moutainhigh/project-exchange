package com.throne212.siliao.biz;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Bill;
//单据cases
public interface BillBiz extends BaseBiz{

	public Bill addNewBill(Bill bill);
	//查询单据
	public PageBean<Bill> getBillList(Bill condition,Date fromDate,Date toDate,Integer page);
	public String getBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate);
}
