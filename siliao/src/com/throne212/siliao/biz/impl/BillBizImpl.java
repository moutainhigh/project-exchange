package com.throne212.siliao.biz.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.BillDao;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.BillLog;
import com.throne212.siliao.domain.BillOrderNum;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.User;

public class BillBizImpl extends BaseBizImpl implements BillBiz {

	private BillDao billDao;

	private synchronized long getCurrNum() {
		BillOrderNum num = baseDao.getAll(BillOrderNum.class).get(0);
		long currNum = num.getNum() + 1;
		num.setNum(currNum);
		baseDao.saveOrUpdate(num);
		return currNum;
	}
	//确认单据
	public Bill confirmBill(Bill bill){
		//当前处理人
		Provider provider = billDao.getEntityById(Provider.class, bill.getProvider().getId());
		bill.setCurrUserName(provider.getAccount().getName());
		bill.setProviderAccount(provider.getAccount());
		
		User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(userObj instanceof ManagerAccount){
			ManagerAccount aa = (ManagerAccount) userObj;
			bill.setManager(aa);
		}
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "审核中 -> 已审核");
		log.setBill(bill);
		log.setRemark(bill.getShenpiRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}

	//提交单据
	public Bill addNewBill(Bill bill) {
		Farm farm = billDao.getEntityById(Farm.class, bill.getFarm().getId());
		Factory factory = billDao.getEntityById(Factory.class, bill.getFactory().getId());
		// 生成订单号
		bill.setOrderId(Util.genOrderId(farm.getName(), factory.getName(), getCurrNum()));
		//当前处理人
		User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(userObj instanceof AreaAccount){
			AreaAccount aa = (AreaAccount) userObj;
			bill.setCurrUserName(aa.getArea().getFarm().getManager().getName());
			bill.setAreaAccount(aa);
		}else if(userObj instanceof ManagerAccount){
			ManagerAccount aa = (ManagerAccount) userObj;
			bill.setCurrUserName(aa.getName());
			bill.setManager(aa);
		}else if(userObj instanceof Admin){
			bill.setCurrUserName(userObj.getName());
		}
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "草稿 -> 审核中");
		log.setBill(bill);
		log.setRemark(bill.getApplyRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}
	
	//对已经有的草稿进行提交
	public Bill submitDraftBill(Bill bill) {
		//当前处理人
		User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(userObj instanceof AreaAccount){
			AreaAccount aa = (AreaAccount) userObj;
			bill.setCurrUserName(aa.getArea().getFarm().getManager().getName());
			bill.setAreaAccount(aa);
		}else if(userObj instanceof Admin){
			bill.setCurrUserName(userObj.getName());
		}
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "草稿 -> 审核中");
		log.setBill(bill);
		log.setRemark(bill.getApplyRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}

	//保存单据草稿
	public Bill saveBillDraft(Bill bill) {
		if(bill == null)
			return null;
		if (!Util.isEmpty(bill.getFarmer().getName())) {
			Farmer farmer = this.getEntityByUnique(Farmer.class, "name", bill.getFarmer().getName());
			bill.setFarmer(farmer);
		}
		Farm farm = billDao.getEntityById(Farm.class, bill.getFarm().getId());
		Factory factory = billDao.getEntityById(Factory.class, bill.getFactory().getId());
		// 生成订单号
		bill.setOrderId(Util.genOrderId(farm.getName(), factory.getName(), getCurrNum()));
		//当前处理人
		User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(userObj instanceof AreaAccount){
			AreaAccount aa = (AreaAccount) userObj;
			bill.setAreaAccount(aa);
		}else if(userObj instanceof ManagerAccount){
			ManagerAccount aa = (ManagerAccount) userObj;
			bill.setManager(aa);
		}
		bill.setCurrUserName(userObj.getName());
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, (bill.getShenpiResult()!=null&&bill.getShenpiResult()==false)?"审核中 -> 草稿":"拟定 -> 草稿");
		log.setBill(bill);
		log.setRemark((bill.getShenpiResult()!=null&&bill.getShenpiResult()==false)?bill.getShenpiRemark():bill.getApplyRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("保存单据草稿【" + bill.getOrderId() + "】成功");
		return bill;
	}
	
	// 查询我的单据
	public PageBean<Bill> getMyBillList(Bill condition,Date fromDate,Date toDate,String currMan,Date planFromDate,Date planToDate, Date sendFromDate, Date sendToDate,Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getMyBillList(condition,fromDate,toDate,currMan,planFromDate,planToDate, sendFromDate, sendToDate,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ),pageIndex);
	}

	public String getMyBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,Date planFromDate,Date planToDate, Date sendFromDate, Date sendToDate) {
		List<Bill> billList = billDao.getMyBillList(condition,fromDate,toDate,currMan,planFromDate,planToDate, sendFromDate, sendToDate,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("单据列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "供货厂商", format));
			sheet.addCell(new Label(2, 0, "饲料厂商", format));
			sheet.addCell(new Label(3, 0, "计划到料日期", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "规格", format));
			sheet.addCell(new Label(7, 0, "用料量(吨)", format));
			sheet.addCell(new Label(8, 0, "合计金额", format));
			sheet.addCell(new Label(9, 0, "单据状态", format));
			sheet.addCell(new Label(10, 0, "当前处理人", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			// 加内容
			int i = 1;
			for (Bill f : billList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getName()));
				sheet.addCell(new Label(2, i, f.getFactory().getName()));
				sheet.addCell(new Label(3, i, f.getPlanDate().toString()));
				sheet.addCell(new Label(4, i, Util.getDate(f.getSendDate())));//发料日期
				sheet.addCell(new Label(5, i, Util.getDate(f.getFinishDate())));//到料日期
				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Number(7, i++, f.getAmount()));
				sheet.addCell(new Label(8, i++, f.getBillPrice()));
				sheet.addCell(new Label(9, i++, f.getStatusTxt()));
				sheet.addCell(new Label(10, i++, f.getCurrUserName()));//当前处理人
				sheet.addCell(new Label(11, i++, f.getFarm().getName()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;

	}
	
	
	// 查询待我的单据
	public PageBean<Bill> getWaitBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getWaitBillList(condition,fromDate,toDate,currMan,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ),accountName,pageIndex);
	}

	public String getWaitBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName) {
		List<Bill> billList = billDao.getWaitBillList(condition,fromDate,toDate,currMan,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ),accountName);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("单据列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "供货厂商", format));
			sheet.addCell(new Label(2, 0, "饲料厂商", format));
			sheet.addCell(new Label(3, 0, "计划到料日期", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "规格", format));
			sheet.addCell(new Label(7, 0, "用料量(吨)", format));
			sheet.addCell(new Label(8, 0, "合计金额", format));
			sheet.addCell(new Label(9, 0, "单据状态", format));
			sheet.addCell(new Label(10, 0, "当前处理人", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			// 加内容
			int i = 1;
			for (Bill f : billList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getName()));
				sheet.addCell(new Label(2, i, f.getFactory().getName()));
				sheet.addCell(new Label(3, i, f.getPlanDate().toString()));
				sheet.addCell(new Label(4, i, Util.getDate(f.getSendDate())));//发料日期
				sheet.addCell(new Label(5, i, Util.getDate(f.getFinishDate())));//到料日期
				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Number(7, i++, f.getAmount()));
				sheet.addCell(new Label(8, i++, f.getBillPrice()));
				sheet.addCell(new Label(9, i++, f.getStatusTxt()));
				sheet.addCell(new Label(10, i++, f.getCurrUserName()));//当前处理人
				sheet.addCell(new Label(11, i++, f.getFarm().getName()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;

	}
	public Bill sendBill(Bill bill){
		Bill billInDB = this.getEntityById(Bill.class, bill.getId());
		billInDB.setPriceOnOrder(bill.getPriceOnOrder());
		billInDB.setShenheRemark(bill.getShenheRemark());
		billInDB.setShenheResult(bill.getShenheResult());
		billInDB.setTranslater(bill.getTranslater());
		billInDB.setAgentUnitPrice(bill.getAgentUnitPrice());
		billInDB.setSendDate(new Date());
		if(bill.getShenheResult() != null && bill.getShenheResult()){//发料
			billInDB.setStatus(WebConstants.BILL_STATUS_SENT);
			if(billInDB.getAreaAccount()!=null){
				billInDB.setCurrUserName(billInDB.getAreaAccount().getName());
			}else if(billInDB.getManager()!=null){
				billInDB.setCurrUserName(billInDB.getManager().getName());
			}
			this.saveOrUpdateEntity(billInDB);
			// 保存日志
			BillLog log = Util.getBaseLog(BillLog.class, "已审核 -> 已发料");
			log.setBill(bill);
			log.setRemark(bill.getShenheRemark());
			baseDao.saveOrUpdate(log);
		}else{
			billInDB.setStatus(WebConstants.BILL_STATUS_SUBMIT);
			this.saveOrUpdateEntity(billInDB);
			// 保存日志
			BillLog log = Util.getBaseLog(BillLog.class, "已审核 -> 审核中");
			log.setBill(bill);
			log.setRemark(bill.getShenheRemark());
			this.saveOrUpdateEntity(log);
		}
		return billInDB;
	}
	
	
	// 系统管理员用的单据查询
	public PageBean<Bill> getAdminBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getAdminBillList(condition,fromDate,toDate,currMan,accountName,pageIndex);
	}

	public String getAdminBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName) {
		List<Bill> billList = billDao.getAdminBillList(condition,fromDate,toDate,currMan,accountName);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("单据列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "供货厂商", format));
			sheet.addCell(new Label(2, 0, "饲料厂商", format));
			sheet.addCell(new Label(3, 0, "计划到料日期", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "规格", format));
			sheet.addCell(new Label(7, 0, "用料量(吨)", format));
			sheet.addCell(new Label(8, 0, "合计金额", format));
			sheet.addCell(new Label(9, 0, "单据状态", format));
			sheet.addCell(new Label(10, 0, "当前处理人", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			// 加内容
			int i = 1;
			for (Bill f : billList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getName()));
				sheet.addCell(new Label(2, i, f.getFactory().getName()));
				sheet.addCell(new Label(3, i, f.getPlanDate().toString()));
				sheet.addCell(new Label(4, i, Util.getDate(f.getSendDate())));//发料日期
				sheet.addCell(new Label(5, i, Util.getDate(f.getFinishDate())));//到料日期
				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Number(7, i++, f.getAmount()));
				sheet.addCell(new Label(8, i++, f.getBillPrice()));
				sheet.addCell(new Label(9, i++, f.getStatusTxt()));
				sheet.addCell(new Label(10, i++, f.getCurrUserName()));//当前处理人
				sheet.addCell(new Label(11, i++, f.getFarm().getName()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;

	}
	public Bill changeBillStatus(Bill bill){
		Bill billInDB = this.getEntityById(Bill.class, bill.getId());
		String oldStatus = billInDB.getStatusTxt();
		String newStatus = bill.getStatusTxt();
		billInDB.setStatus(bill.getStatus());
		billInDB.setReason(bill.getReason());
		this.saveOrUpdateEntity(billInDB);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, oldStatus+" -> "+newStatus);
		log.setBill(bill);
		log.setRemark(bill.getReason());
		this.saveOrUpdateEntity(log);
		return billInDB;
	}
	
	
	//对账
	public PageBean<Bill> getSentBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getSentBillList(condition,fromDate,toDate,currMan,accountName,pageIndex);
	}

	public String getSentBillExcelDownloadFile(Bill condition,Date fromDate,Date toDate,String currMan,String accountName) {
		List<Bill> billList = billDao.getSentBillList(condition,fromDate,toDate,currMan,accountName);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("单据列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "供货厂商", format));
			sheet.addCell(new Label(2, 0, "饲料厂商", format));
			sheet.addCell(new Label(3, 0, "计划到料日期", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "规格", format));
			sheet.addCell(new Label(7, 0, "用料量(吨)", format));
			sheet.addCell(new Label(8, 0, "合计金额", format));
			sheet.addCell(new Label(9, 0, "单据状态", format));
			sheet.addCell(new Label(10, 0, "当前处理人", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			// 加内容
			int i = 1;
			for (Bill f : billList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getName()));
				sheet.addCell(new Label(2, i, f.getFactory().getName()));
				sheet.addCell(new Label(3, i, f.getPlanDate().toString()));
				sheet.addCell(new Label(4, i, Util.getDate(f.getSendDate())));//发料日期
				sheet.addCell(new Label(5, i, Util.getDate(f.getFinishDate())));//到料日期
				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Number(7, i++, f.getAmount()));
				sheet.addCell(new Label(8, i++, f.getBillPrice()));
				sheet.addCell(new Label(9, i++, f.getStatusTxt()));
				sheet.addCell(new Label(10, i++, f.getCurrUserName()));//当前处理人
				sheet.addCell(new Label(11, i++, f.getFarm().getName()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;

	}
	
	public List<BillLog> getBillLogList(Bill bill){
		return baseDao.getLogList(bill, "bill");
	}

	public BillDao getBillDao() {
		return billDao;
	}

	public void setBillDao(BillDao billDao) {
		this.billDao = billDao;
	}

}
