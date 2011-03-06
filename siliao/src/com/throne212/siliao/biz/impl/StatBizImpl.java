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

import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.common.FactoryStatDO;
import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.ProviderStatDO;
import com.throne212.siliao.common.SysStatDO;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FinanceDao;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ProviderFinance;

public class StatBizImpl extends BaseBizImpl implements StatBiz {
	
	private FinanceDao financeDao;

	public FinanceDao getFinanceDao() {
		return financeDao;
	}

	public void setFinanceDao(FinanceDao financeDao) {
		this.financeDao = financeDao;
	}

	public String getProviderFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate) {
		PageBean<ProviderFinance> bean = financeDao.getProviderFinanceList(condition, fromDate, toDate,-1,-1);
		List<ProviderFinance> providerFinanceList = bean.getResultList();
//		List<ProviderFinance> providerFinanceList=financeDao.getProviderFinanceList(condition, fromDate, toDate);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("厂商统计列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "饲料厂商", format));
			sheet.addCell(new Label(2, 0, "供货饲料厂", format));
			sheet.addCell(new Label(3, 0, "累计供货量(吨)", format));
			sheet.addCell(new Label(4, 0, "合计金额", format));
			sheet.addCell(new Label(5, 0, "单笔本息合计", format));
			sheet.addCell(new Label(6, 0, "农场", format));
			sheet.addCell(new Label(7, 0, "代理费", format));

		
			// 加内容
			int i = 1;
			for (ProviderFinance f : providerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getFactory().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Number(3, i, f.getAmount()));
				sheet.addCell(new Number(4, i, f.getMoney()));
				sheet.addCell(new Number(5, i, f.getTotalMoney())); //单笔本息合计
				sheet.addCell(new Label(6, i, f.getFarm().getName()));
				sheet.addCell(new Number(7, i++, f.getAgentMoney()));
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

	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getProviderFinanceList(condition,fromDate, toDate, pageIndex,pageSize);
	}
	
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer page,int pageSize){
		
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getFarmerFinanceList(condition,sendFromDate, sendToDate,finishFromDate,finishToDate, pageIndex,pageSize);
		
	}
	public String getFarmerFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate){
		PageBean<FarmerFinance> bean = financeDao.getFarmerFinanceList(condition, sendFromDate, sendToDate,finishFromDate,finishToDate,-1,-1);
		List<FarmerFinance> farmerFinanceList = bean.getResultList();
//		List<FarmerFinance> farmerFinanceList=financeDao.getFarmerFinanceList(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("农户统计列表", 0);

			// 加表头
			
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "养殖户姓名", format));
			sheet.addCell(new Label(2, 0, "供货饲料厂", format));
			sheet.addCell(new Label(3, 0, "饲料厂商", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "型号", format));
			sheet.addCell(new Label(7, 0, "规格", format));
			sheet.addCell(new Label(8, 0, "用料量(吨)", format));
			sheet.addCell(new Label(9, 0, "合计金额", format));
			sheet.addCell(new Label(10, 0, "单笔本息", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			
			// 加内容
			int i = 1;
			for (FarmerFinance f : farmerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getFarmer().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Label(3, i, f.getFactory().getName()));
				sheet.addCell(new Label(4, i, f.getBill().getSendDate().toString()));
				sheet.addCell(new Label(5, i, f.getBill().getFinishDate().toString())); 
				sheet.addCell(new Label(6, i, f.getSize()));
				sheet.addCell(new Label(7, i, f.getModel()));
				sheet.addCell(new Number(8, i, f.getAmount()));
				sheet.addCell(new Number(9, i, f.getMoney()));
				sheet.addCell(new Number(10, i, f.getTotalMoney()));//单笔本息
				sheet.addCell(new Label(11, i++, f.getArea().getName()));
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
	
	//厂商结算
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page,int pageSize){
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getProviderSettleFinanceList(condition,fromDate, toDate, pageIndex,pageSize);
	}
	public String  getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate){
		PageBean<ProviderFinance> bean = financeDao.getProviderSettleFinanceList(condition,fromDate, toDate,-1, -1);
		List<ProviderFinance> providerFinanceList = bean.getResultList();
//		List<ProviderFinance> providerFinanceList=financeDao.getProviderSettleFinanceExcelDownloadFile(condition, fromDate, toDate);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("厂商结算列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "饲料厂商", format));
			sheet.addCell(new Label(2, 0, "供货饲料厂", format));
			sheet.addCell(new Label(3, 0, "累计供货量(吨)", format));
			sheet.addCell(new Label(4, 0, "合计金额", format));
			sheet.addCell(new Label(5, 0, "单笔本息合计", format));
			sheet.addCell(new Label(6, 0, "农场", format));

		
			// 加内容
			int i = 1;
			for (ProviderFinance f : providerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getFactory().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Number(3, i, f.getAmount()));
				sheet.addCell(new Number(4, i, f.getMoney()));
				sheet.addCell(new Number(5, i, f.getTotalMoney())); //单笔本息合计
				sheet.addCell(new Label(6, i++, f.getFarm().getName()));
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
	public ProviderFinance payProvider(ProviderFinance pf){
		if(pf.getMoney() > 0){
			pf.setMoney(pf.getMoney() * -1);
		}
		pf.setRateFromDate(Util.getDateOnly(new Date()));
		pf.setType(WebConstants.FINANCE_STATUS_PAY);
		financeDao.saveOrUpdate(pf);
		return pf;
	}
	
	
	//农户结算
	public PageBean<FarmerFinance> getFarmerSettleFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate,Integer page,int pageSize){
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getFarmerSettleFinanceList(condition, sendFromDate, sendToDate,finishFromDate,finishToDate, pageIndex,pageSize);
	}
	public String  getFarmerSettleFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate){
		PageBean<FarmerFinance> bean = financeDao.getFarmerSettleFinanceList(condition, sendFromDate, sendToDate,finishFromDate,finishToDate,-1,-1);
		List<FarmerFinance> farmerFinanceList = bean.getResultList();
//		List<FarmerFinance> farmerFinanceList=financeDao.getFarmerSettleFinanceExcelDownloadFile(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("农户结算列表", 0);

			// 加表头
			
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "养殖户姓名", format));
			sheet.addCell(new Label(2, 0, "供货饲料厂", format));
			sheet.addCell(new Label(3, 0, "饲料厂商", format));
			sheet.addCell(new Label(4, 0, "发料日期", format));
			sheet.addCell(new Label(5, 0, "到料日期", format));
			sheet.addCell(new Label(6, 0, "型号", format));
			sheet.addCell(new Label(7, 0, "规格", format));
			sheet.addCell(new Label(8, 0, "用料量(吨)", format));
			sheet.addCell(new Label(9, 0, "合计金额", format));
			sheet.addCell(new Label(10, 0, "单笔本息", format));
			sheet.addCell(new Label(11, 0, "所属区域", format));
			
			// 加内容
			int i = 1;
			for (FarmerFinance f : farmerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getFarmer().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Label(3, i, f.getFactory().getName()));
				sheet.addCell(new Label(4, i, f.getBill().getSendDate().toString()));
				sheet.addCell(new Label(5, i, f.getBill().getFinishDate().toString())); 
				sheet.addCell(new Label(6, i, f.getSize()));
				sheet.addCell(new Label(7, i, f.getModel()));
				sheet.addCell(new Number(8, i, f.getAmount()));
				sheet.addCell(new Number(9, i, f.getMoney()));
				sheet.addCell(new Number(10, i, f.getTotalMoney()));//单笔本息
				sheet.addCell(new Label(11, i++, f.getArea().getName()));
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
	public FarmerFinance payFarmer(FarmerFinance ff){
		if(ff.getMoney() > 0){
			ff.setMoney(ff.getMoney() * -1);
		}
		ff.setType(WebConstants.FINANCE_STATUS_GET);
		financeDao.saveOrUpdate(ff);
		return ff;
	}
	
	//农场统计
	public Object[] getFarmStatListArr(Long farmId){
		List list1 = financeDao.getFarmStatList(farmId);
		List list2 = financeDao.getProviderStatList(farmId);
		return new Object[]{list1,list2};
	}
	public String exportFarmStatList(Long farmId){
		List<FarmerStatDO> list1 = financeDao.getFarmStatList(farmId);
		List<ProviderStatDO> list2 = financeDao.getProviderStatList(farmId);
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("农场统计列表", 0);

			// 加表头
			
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "管区", format));
			sheet.addCell(new Label(2, 0, "管区负责人", format));
			sheet.addCell(new Label(3, 0, "用料量合计(吨)", format));
			sheet.addCell(new Label(4, 0, "总料款合计", format));
			sheet.addCell(new Label(5, 0, "欠款本息", format));
			sheet.addCell(new Label(6, 0, "已付款", format));
			sheet.addCell(new Label(7, 0, "付款率", format));
			
			
			// 加内容
			int i = 1;
			for (FarmerStatDO f : list1) {
				sheet.addCell(new Number(0, i, f.getOrderNum()));
				sheet.addCell(new Label(1, i, f.getAreaName()));
				sheet.addCell(new Label(2, i, f.getAreaAccount()));
				sheet.addCell(new Number(3, i, f.getTotalAmount()));
				sheet.addCell(new Number(4, i, f.getTotalMoney()));
				sheet.addCell(new Number(5, i, f.getTotalOwn())); 
				sheet.addCell(new Number(6, i, f.getTotalPay()));
				sheet.addCell(new Label(7, i++, f.getPayPercentage()));
				
			}
			//合计
			Double[]doubles1=(Double[])list1.get(0).getTotal();
			sheet.addCell(new Label(0, i, "合计"));
			sheet.addCell(new Label(1, i, ""));
			sheet.addCell(new Label(2, i, ""));
			sheet.addCell(new Number(3, i, doubles1[0]));
			sheet.addCell(new Number(4, i, doubles1[1]));
			sheet.addCell(new Number(5, i,doubles1[2])); 
			sheet.addCell(new Number(6, i,doubles1[3] ));
			sheet.addCell(new Label(7, i,""));
			
			WritableSheet sheet2 = workbook.createSheet("饲料厂供料情况", 1);
			// 加表头

			sheet2.addCell(new Label(0, 0, "序号", format));
			sheet2.addCell(new Label(1, 0, "供货饲料厂", format));
			sheet2.addCell(new Label(2, 0, "累计供货量(吨)", format));
			sheet2.addCell(new Label(3, 0, "合计金额", format));
			sheet2.addCell(new Label(4, 0, "单笔本息合计", format));
			sheet2.addCell(new Label(5, 0, "农场", format));
			
			
			// 加内容
			int i2 = 1;
			for (ProviderStatDO f2 : list2) {
				sheet2.addCell(new Number(0, i2, f2.getOrderNum()));
				sheet2.addCell(new Label(1, i2, f2.getProviderName()));
				sheet2.addCell(new Number(2, i2, f2.getTotalAmount()));
				sheet2.addCell(new Number(3, i2, f2.getTotalMoney()));
				sheet2.addCell(new Number(4, i2, f2.getTotalRateMoney()==null?0:f2.getTotalRateMoney()));
				sheet2.addCell(new Label(5, i2++, f2.getFarmName())); 
				
			}
			//合计
			Double[]doubles2=(Double[])list2.get(0).getTotal();
			sheet2.addCell(new Label(0, i2, "合计"));
			sheet2.addCell(new Label(1, i2, ""));
			sheet2.addCell(new Number(2, i2,doubles2[0] ));
			sheet2.addCell(new Number(3, i2, doubles2[1]));
			sheet2.addCell(new Number(4, i2, doubles2[2]));
			//sheet2.addCell(new Number(5, i2, doubles2[3]));
			
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

		//excel编辑代码...
		
	}
	
	//集团统计
	public Object[] getSysStatListArr(){
		List list1 = financeDao.getAllFarmStatList();
		List list2 = financeDao.getAllFactoryStatList();
		return new Object[]{list1,list2};
	}
	public String exportSysStatList(){
		List<SysStatDO> list1 = financeDao.getAllFarmStatList();
		List<FactoryStatDO> list2 = financeDao.getAllFactoryStatList();
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("农场统计列表", 0);

			// 加表头
			
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "序号", format));
			sheet.addCell(new Label(1, 0, "管区", format));
			sheet.addCell(new Label(2, 0, "管区负责人", format));
			sheet.addCell(new Label(3, 0, "用料量合计(吨)", format));
			sheet.addCell(new Label(4, 0, "总料款合计", format));
			sheet.addCell(new Label(5, 0, "欠款本息", format));
			sheet.addCell(new Label(6, 0, "已付款", format));
			sheet.addCell(new Label(7, 0, "付款率", format));
			
			
			// 加内容
			int i = 1;
			for (SysStatDO f : list1) {
				sheet.addCell(new Number(0, i, f.getOrderNum()));
				sheet.addCell(new Label(1, i, f.getFarmName()));
				sheet.addCell(new Label(2, i, f.getManager()));
				sheet.addCell(new Number(3, i, f.getTotalAmount()));
				sheet.addCell(new Number(4, i, f.getTotalMoney()));
				sheet.addCell(new Number(5, i, f.getTotalOwn())); 
				sheet.addCell(new Number(6, i, f.getTotalPay()));
				sheet.addCell(new Label(7, i++, f.getPayPercentage()));
				
			}
			//合计
			Double[]doubles1=(Double[])list2.get(0).getTotal();
			sheet.addCell(new Label(0, i, "合计"));
			sheet.addCell(new Label(1, i, ""));
			sheet.addCell(new Label(2, i, ""));
			sheet.addCell(new Number(3, i, doubles1[0]));
			sheet.addCell(new Number(4, i, doubles1[1]));
			sheet.addCell(new Number(5, i,doubles1[2])); 
			sheet.addCell(new Number(6, i,doubles1[3] ));
			sheet.addCell(new Label(7, i,""));
			
			WritableSheet sheet2 = workbook.createSheet("饲料厂供料情况", 0);
			// 加表头

			sheet2.addCell(new Label(0, 0, "序号", format));
			sheet2.addCell(new Label(1, 0, "饲料厂商", format));
			sheet2.addCell(new Label(2, 0, "累计供货量(吨)", format));
			sheet2.addCell(new Label(3, 0, "料款金额", format));
			sheet2.addCell(new Label(4, 0, "已付款", format));
			sheet2.addCell(new Label(5, 0, "欠款余额", format));
			sheet2.addCell(new Label(6, 0, "付款率", format));
			
			
			// 加内容
			int i2 = 1;
			for (FactoryStatDO f2 : list2) {
				sheet2.addCell(new Number(0, i2, f2.getOrderNum()));
				sheet2.addCell(new Label(1, i2, f2.getFactoryName()));
				sheet2.addCell(new Number(2, i2, f2.getTotalAmount()));
				sheet2.addCell(new Number(3, i2, f2.getTotalMoney()));
				sheet2.addCell(new Number(4, i2, f2.getTotalPay()));
				sheet.addCell(new Number(5, i2, f2.getOwnBalance())); 
				sheet.addCell(new Label(6, i2++, f2.getPayPercentage())); 
				
			}
			//合计
			Double[]doubles2=(Double[])list2.get(0).getTotal();
			sheet2.addCell(new Label(0, i2, "合计"));
			sheet2.addCell(new Label(1, i2, ""));
			sheet2.addCell(new Number(2, i2,doubles2[0] ));
			sheet2.addCell(new Number(3, i2, doubles2[1]));
			sheet2.addCell(new Number(4, i2, doubles2[2]));
			sheet2.addCell(new Number(5, i2, doubles2[3]));
			sheet2.addCell(new Label(6, i2, ""));
			
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

		
		
		//excel编辑代码...
		
	}
}
