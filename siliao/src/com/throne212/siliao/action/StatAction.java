package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ProviderFinance;

public class StatAction extends BaseAction {

	private StatBiz statBiz;

	public StatBiz getStatBiz() {
		return statBiz;
	}

	public void setStatBiz(StatBiz statBiz) {
		this.statBiz = statBiz;
	}

	// 厂商统计
	private InputStream downloadFile;
	private ProviderFinance pf;
	private Date fromDate;
	private Date toDate;
	private PageBean pageBean;
	private Integer page;

	public String queryFactory() {

		pageBean = statBiz.getProviderFinanceList(pf, fromDate, toDate, page);
		return "factory_list";
	}

	public String exportProviderFinanceExcel() {
		String path = statBiz.getProviderFinanceExcelDownloadFile(pf, fromDate, toDate);
		if (path != null) {
			try {
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}

	// 农户统计
	private FarmerFinance ff;
	private Date sendFromDate;
	private Date sendToDate;
	private Date fnishiFromDate;
	private Date finishToDate;

	public String queryFarmer() {
//		if (ff != null && ff.getFarmer() != null && ff.getFarmer().getName() != null) {
//			Farmer farmer = statBiz.getEntityByUnique(Farmer.class, "name", ff.getFarmer().getName());
//			if (farmer == null) {
//				this.setMsg("不存在此农户！");
//				return "farmer_list";
//			} else {
//				ff.setFarmer(farmer);
//			}
//		}
		pageBean = statBiz.getFarmerFinanceList(ff, sendFromDate, sendToDate, fnishiFromDate, finishToDate, page);
		return "farmer_list";
	}

	public String exportFarmerFinanceExcel() {
		String path = statBiz.getFarmerFinanceExcelDownloadFile(ff, sendFromDate, sendToDate, fnishiFromDate, finishToDate);
		if (path != null) {
			try {
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}
	
	//厂商结算
	public String settleFactory() {
		pageBean = statBiz.getProviderSettleFinanceList(pf, fromDate, toDate, page);
		return "factory_settlement";
	}

	public String exportSettleProviderFinanceExcel() {
		String path = statBiz.getProviderSettleFinanceExcelDownloadFile(pf, fromDate, toDate);
		if (path != null) {
			try {
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}
	//付款给厂商
	public String payProvider(){
		pf = statBiz.payProvider(pf);
		if(pf.getId() == null){
			this.setMsg("付款失败，请联系管理员");
		}else{
			this.setMsg("付款成功，金额为：" + pf.getMoney());
		}
		return settleFactory();
	}

	public ProviderFinance getPf() {
		return pf;
	}

	public void setPf(ProviderFinance pf) {
		this.pf = pf;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public FarmerFinance getFf() {
		return ff;
	}

	public void setFf(FarmerFinance ff) {
		this.ff = ff;
	}

	public Date getSendFromDate() {
		return sendFromDate;
	}

	public void setSendFromDate(Date sendFromDate) {
		this.sendFromDate = sendFromDate;
	}

	public Date getSendToDate() {
		return sendToDate;
	}

	public void setSendToDate(Date sendToDate) {
		this.sendToDate = sendToDate;
	}

	public Date getFnishiFromDate() {
		return fnishiFromDate;
	}

	public void setFnishiFromDate(Date fnishiFromDate) {
		this.fnishiFromDate = fnishiFromDate;
	}

	public Date getFinishToDate() {
		return finishToDate;
	}

	public void setFinishToDate(Date finishToDate) {
		this.finishToDate = finishToDate;
	}

}
