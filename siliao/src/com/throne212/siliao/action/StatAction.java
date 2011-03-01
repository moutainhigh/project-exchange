package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.ProviderStatDO;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.ProviderFinance;
import com.throne212.siliao.domain.User;

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
	
	
	//农户结算
	public String settleFarmer() {
		pageBean = statBiz.getFarmerSettleFinanceList(ff, sendFromDate, sendToDate, fnishiFromDate, finishToDate, page);
		return "farmer_settlement";
	}

	public String exportSettleFarmerFinanceExcel() {
		String path = statBiz.getFarmerSettleFinanceExcelDownloadFile(ff, sendFromDate, sendToDate,fnishiFromDate,finishToDate);
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
	//从农户那里收款
	public String payFarmer(){
		ff = statBiz.payFarmer(ff);
		if(ff.getId() == null){
			this.setMsg("收款失败，请联系管理员");
		}else{
			this.setMsg("收款成功，金额为：" + ff.getMoney());
		}
		return settleFarmer();
	}
	
	//农场统计
	private Long farmId;
	private List<FarmerStatDO> farmerStatList;
	private List<ProviderStatDO> providerStatList;

	public String queryFarmStat() {
		Object[] arr = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Admin){
			if(farmId == null)
				return "farm_list";
			arr = statBiz.getFarmStatListArr(farmId);
		}else if(user instanceof AreaAccount){
			arr = statBiz.getFarmStatListArr(((AreaAccount)user).getArea().getFarm().getId());
		}else if(user instanceof ManagerAccount){
			arr = statBiz.getFarmStatListArr(((ManagerAccount)user).getFarm().getId());
		}
		farmerStatList = (List<FarmerStatDO>) arr[0];
		providerStatList = (List<ProviderStatDO>) arr[1];
		return "farm_list";
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

	public Long getFarmId() {
		return farmId;
	}

	public void setFarmId(Long farmId) {
		this.farmId = farmId;
	}

	public List<FarmerStatDO> getFarmerStatList() {
		return farmerStatList;
	}

	public void setFarmerStatList(List<FarmerStatDO> farmerStatList) {
		this.farmerStatList = farmerStatList;
	}

	public List<ProviderStatDO> getProviderStatList() {
		return providerStatList;
	}

	public void setProviderStatList(List<ProviderStatDO> providerStatList) {
		this.providerStatList = providerStatList;
	}

}