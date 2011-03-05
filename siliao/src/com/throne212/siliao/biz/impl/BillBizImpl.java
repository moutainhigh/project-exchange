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
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.BillLog;
import com.throne212.siliao.domain.BillOrderNum;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.MailSetting;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderFinance;
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
		
		//发邮件
		sendEmail(bill,"单据通过审核");
		
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
		
		//发邮件
		sendEmail(bill,"单据提交成功");
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}
	
	private void sendEmail(Bill bill,String title){
		try {
			List<MailSetting> mailList = billDao.getAll(MailSetting.class);
			if(mailList != null && mailList.size() > 0 && mailList.get(0).getEnable()!=false){
				MailSetting mail = mailList.get(0);
				User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
				Util.sendEmail(mail.getSmtp(), mail.getUsername(), mail.getPassword(), mail.getFrom(), user.getEmail(),title, this.buildEmailBody(bill));
				logger.info("邮件发送成功："+user.getEmail());
			}
		} catch (Exception e) {
			logger.error("邮件发送失败", e);
		}
	}
	
	private String buildEmailBody(Bill bill){
		StringBuffer sb = new StringBuffer();
		sb.append("农场管区: ");
		sb.append(bill.getFarm()==null?"":bill.getFarm().getName());
		sb.append("-"+bill.getArea()==null?"":bill.getArea().getName());
		sb.append("\n");
		sb.append("饲料经理签名："+(bill.getManager()==null?"":bill.getManager().getName()));
		sb.append("\n");
		sb.append("单据编号："+bill.getOrderId());
		sb.append("\n");
		sb.append("管区："+(bill.getArea()==null?"":bill.getArea().getName()));
		sb.append("\n");
		sb.append("单据："+(bill.getOrderNo()==null?"":bill.getOrderNo()));
		sb.append("\n");
		sb.append("负责人："+bill.getCurrUserName());
		sb.append("\n");
		sb.append("饲料规格："+bill.getModel());
		sb.append("\n");
		sb.append("饲料型号："+bill.getSize());
		sb.append("\n");
		sb.append("饲料吨数："+bill.getAmount());
		sb.append("\n");
		sb.append("预计达到时间："+Util.getDate(bill.getPlanDate()));
		sb.append("\n");
		return sb.toString();
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
		
		//发邮件
		sendEmail(bill,"单据提交成功");
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}

	//保存单据草稿
	public Bill saveBillDraft(Bill bill) {
		if(bill == null)
			return null;
		/*
		if (!Util.isEmpty(bill.getFarmer().getName())) {
			Farmer farmer = this.getEntityByUnique(Farmer.class, "name", bill.getFarmer().getName());
			bill.setFarmer(farmer);
		}*/
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
	public PageBean<Bill> getMyBillList(Bill condition,Date fromDate,Date toDate,String currMan,Date planFromDate,Date planToDate, Date sendFromDate, Date sendToDate,Integer page,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getMyBillList(condition,fromDate,toDate,currMan,planFromDate,planToDate, sendFromDate, sendToDate,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ),pageIndex,pageSize);
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
	public PageBean<Bill> getWaitBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getWaitBillList(condition,fromDate,toDate,currMan,(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ),accountName,pageIndex,pageSize);
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
		billInDB.setOrderNo(bill.getOrderNo());
		billInDB.setRemark(bill.getRemark());
		billInDB.setSendDate(new Date());
		if(bill.getShenheResult() == null){//仅仅是保存
			this.saveOrUpdateEntity(billInDB);
			// 保存日志
			BillLog log = Util.getBaseLog(BillLog.class, "已审核 -> 已审核");
			log.setBill(bill);
			log.setRemark(bill.getRemark());
			this.saveOrUpdateEntity(log);
		}else if(bill.getShenheResult()){//发料
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
			
			//发邮件
			sendEmail(billInDB,"单据发料成功");
			
			baseDao.saveOrUpdate(log);
		}else{//驳回
			billInDB.setStatus(WebConstants.BILL_STATUS_SUBMIT);
			this.saveOrUpdateEntity(billInDB);
			// 保存日志
			BillLog log = Util.getBaseLog(BillLog.class, "已审核 -> 审核中");
			log.setBill(bill);
			log.setRemark(bill.getShenheRemark());
			
			//发邮件
			sendEmail(billInDB,"单据驳回");
			
			this.saveOrUpdateEntity(log);
		}
		return billInDB;
	}
	
	
	// 系统管理员用的单据查询
	public PageBean<Bill> getAdminBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getAdminBillList(condition,fromDate,toDate,currMan,accountName,pageIndex,pageSize);
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
		//如果超级管理员将状态从“已送达”变更为其他任何状态的时候，要删除其相应的厂商财务信息和农户财务信息。
		if(billInDB.getStatus() == WebConstants.BILL_STATUS_FINISH && bill.getStatus() != WebConstants.BILL_STATUS_FINISH){
			billDao.deleteFinance(billInDB.getId());
		}
		
		String oldStatus = billInDB.getStatusTxt();
		String newStatus = bill.getStatusTxt();
		billInDB.setStatus(bill.getStatus());
		billInDB.setReason(bill.getReason());
		this.saveOrUpdateEntity(billInDB);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, oldStatus+" -> "+newStatus);
		log.setBill(bill);
		log.setRemark(bill.getReason());
		
		//发邮件
		sendEmail(billInDB,"单据状态改变("+oldStatus+" -> "+newStatus+")");
		
		this.saveOrUpdateEntity(log);
		return billInDB;
	}
	
	
	//对账
	public PageBean<Bill> getSentBillList(Bill condition,Date fromDate,Date toDate,String currMan,String accountName,Integer page,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getSentBillList(condition,fromDate,toDate,currMan,accountName,pageIndex,pageSize);
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
	public Bill finishBill(Bill b,String[] billDetail){
		Bill bill = baseDao.getEntityById(Bill.class, b.getId());
		bill.setFinishDate(b.getFinishDate());
		bill.setFinishAmount(b.getFinishAmount());
		bill.setFinishPrice(b.getFinishPrice());
		bill.setFinishRemark(b.getFinishRemark());
		bill.setStatus(WebConstants.BILL_STATUS_FINISH);
		
		//保存农户财务明细
		for(String detail : billDetail){
			String[] arr = detail.split(",");
			long areaId = Long.parseLong(arr[0]);
			long farmerId = Long.parseLong(arr[1]);
			double amount = Double.parseDouble(arr[2]);
			double totalPrice = Double.parseDouble(arr[3]);
			FarmerFinance ff = new FarmerFinance();
			ff.setAmount(amount);
			ff.setArea(this.getEntityById(Area.class, areaId));
			ff.setBill(bill);
			ff.setCreateDate(new Date());
			ff.setCreateName(((User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			ff.setEnable(true);
			ff.setFactory(bill.getFactory());
			ff.setFarmer(this.getEntityById(Farmer.class, farmerId));
			ff.setModel(bill.getModel());
			ff.setMoney(totalPrice);
			ff.setProvider(bill.getProvider());
			ff.setRateFromDate(bill.getFinishDate());
			ff.setSize(bill.getSize());
			ff.setType(0);
			billDao.saveOrUpdate(ff);
			logger.info("农户分配财务信息保存成功【"+ff.getFarmer().getName()+"】");
		}
		
		//保存供应厂财务明细
		ProviderFinance pf = new ProviderFinance();
		pf.setBill(bill);
		pf.setCreateDate(new Date());
		pf.setCreateName(((User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
		pf.setEnable(true);
		pf.setProvider(bill.getProvider());
		pf.setAmount(bill.getFinishAmount());
		pf.setFarm(bill.getFarm());
		pf.setFarmer(bill.getFarmer());
		pf.setFactory(bill.getFactory());
		//pf.setMoney(bill.getFinishPrice());
		//获取实付料款
		pf.setMoney(Util.multiplyMoney(bill.getAmount(),bill.getPriceOnOrder()));
		pf.setAgentMoney(Util.multiplyMoney(bill.getAmount(), bill.getAgentUnitPrice()));
		
		pf.setRateFromDate(bill.getFinishDate());
		pf.setType(0);
		billDao.saveOrUpdate(pf);
		logger.info("供应厂分配财务信息保存成功【"+pf.getProvider().getName()+"】");
		
		//保存单据
		billDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "已发料 -> 已送达");
		log.setBill(bill);
		log.setRemark(bill.getFinishRemark());
		
		//发邮件
		sendEmail(bill,"单据发料成功");
		
		this.saveOrUpdateEntity(log);
		return bill;
	}
}
