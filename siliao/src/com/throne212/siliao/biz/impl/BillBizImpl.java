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

import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.BillDao;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.BillLog;
import com.throne212.siliao.domain.BillOrderNum;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;

public class BillBizImpl extends BaseBizImpl implements BillBiz {

	private BillDao billDao;

	private synchronized long getCurrNum() {
		BillOrderNum num = baseDao.getAll(BillOrderNum.class).get(0);
		long currNum = num.getNum() + 1;
		num.setNum(currNum);
		baseDao.saveOrUpdate(num);
		return currNum;
	}

	//提交单据
	public Bill addNewBill(Bill bill) {
		Farm farm = billDao.getEntityById(Farm.class, bill.getFarm().getId());
		Factory factory = billDao.getEntityById(Factory.class, bill.getFactory().getId());
		// 生成订单号
		bill.setOrderId(Util.genOrderId(farm.getName(), factory.getName(), getCurrNum()));
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "草稿 -> 审核中");
		log.setBill(bill);
		log.setRemark(bill.getApplyRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("提交单据【" + bill.getOrderId() + "】成功");
		return bill;
	}

	public Bill saveBillDraft(Bill bill) {
		Farm farm = billDao.getEntityById(Farm.class, bill.getFarm().getId());
		Factory factory = billDao.getEntityById(Factory.class, bill.getFactory().getId());
		// 生成订单号
		bill.setOrderId(Util.genOrderId(farm.getName(), factory.getName(), getCurrNum()));
		baseDao.saveOrUpdate(bill);
		// 保存日志
		BillLog log = Util.getBaseLog(BillLog.class, "无 -> 审核中");
		log.setBill(bill);
		log.setRemark(bill.getApplyRemark());
		baseDao.saveOrUpdate(log);
		
		logger.info("保存单据草稿【" + bill.getOrderId() + "】成功");
		return bill;
	}

	// 查询单据
	public PageBean<Bill> getBillList(Bill condition, Date fromDate, Date toDate, Integer page) {

		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return billDao.getBillList(condition, fromDate, toDate, pageIndex);

	}

	public String getBillExcelDownloadFile(Bill condition, Date fromDate, Date toDate) {
		List<Bill> billList = billDao.getBillList(condition, fromDate, toDate);
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
				// sheet.addCell(new Label(4, i, f.getTel()));//发料日期
				// sheet.addCell(new Label(5, i, f.getEmail()));//到料日期

				sheet.addCell(new Label(6, i++, f.getSize()));
				sheet.addCell(new Number(7, i++, f.getAmount()));
				// sheet.addCell(new Label(8, i++, f.getSize()));//合计金额
				sheet.addCell(new Label(9, i++, f.getStatusTxt()));
				// sheet.addCell(new Label(10, i++, f.getSize()));//当前处理人
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

	public BillDao getBillDao() {
		return billDao;
	}

	public void setBillDao(BillDao billDao) {
		this.billDao = billDao;
	}

}
