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
import com.throne212.siliao.common.PageBean;
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

		List<ProviderFinance> providerFinanceList = financeDao.getProviderFinanceList(condition, fromDate, toDate);

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

		
			// 加内容
			int i = 1;
			for (ProviderFinance f : providerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getFactory().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Number(3, i, f.getAmount()));
				sheet.addCell(new Number(4, i, f.getMoney()));
//				sheet.addCell(new Label(5, i, f.getEmail())); //单笔本息合计
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

	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getProviderFinanceList(condition,fromDate, toDate, pageIndex);
	}
	
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer page){
		
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getFarmerFinanceList(condition,sendFromDate, sendToDate,finishFromDate,finishToDate, pageIndex);
		
	}
	public String getFarmerFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate){
		
		List<FarmerFinance> farmerFinanceList = financeDao.getFarmerFinanceList(condition, sendFromDate, sendToDate,finishFromDate,finishToDate);

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
				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Label(7, i++, f.getModel()));
				sheet.addCell(new Number(8, i++, f.getAmount()));
				sheet.addCell(new Number(9, i++, f.getMoney()));
				sheet.addCell(new Label(10, i++, f.getSize()));//单笔本息
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
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page){
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return financeDao.getProviderSettleFinanceList(condition,fromDate, toDate, pageIndex);
	}
	public String  getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate){
		List<ProviderFinance> providerFinanceList = financeDao.getProviderSettleFinanceExcelDownloadFile(condition, fromDate, toDate);

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

		
			// 加内容
			int i = 1;
			for (ProviderFinance f : providerFinanceList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getProvider().getFactory().getName()));
				sheet.addCell(new Label(2, i, f.getProvider().getName()));
				sheet.addCell(new Number(3, i, f.getAmount()));
				sheet.addCell(new Number(4, i, f.getMoney()));
//				sheet.addCell(new Label(5, i, f.getEmail())); //单笔本息合计
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
}
