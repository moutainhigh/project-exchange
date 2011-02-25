package com.throne212.siliao.biz;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.BillLog;
//单据cases
public interface BillBiz extends BaseBiz{

	//单据编辑
	public Bill addNewBill(Bill bill);
	public Bill submitDraftBill(Bill bill);
	public Bill saveBillDraft(Bill bill);
	public Bill confirmBill(Bill bill);
	//我的单据
	public PageBean<Bill> getMyBillList(Bill condition,Date fromDate,Date toDate,String currMan,Date planFromDate,Date planToDate, Date sendFromDate, Date sendToDate,Integer page);
	public String getMyBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,Date planFromDate,Date planToDate, Date sendFromDate, Date sendToDate);
	public List<BillLog> getBillLogList(Bill bill); 
	//待我处理
	public PageBean<Bill> getWaitBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page);
	public String getWaitBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName);
	public Bill sendBill(Bill bill);
	//admin处理
	public PageBean<Bill> getAdminBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page);
	public String getAdminBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName);
	public Bill changeBillStatus(Bill bill);
	//对账处理
	public PageBean<Bill> getSentBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page);
	public String getSentBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName);
}
