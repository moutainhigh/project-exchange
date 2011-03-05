package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.common.FactoryStatDO;
import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.ProviderStatDO;
import com.throne212.siliao.common.SysStatDO;
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
	private Integer pageIndex;
	private int pageSize;

	public String queryFactory() {

		pageBean = statBiz.getProviderFinanceList(pf, fromDate, toDate, pageIndex,pageSize);
		return "factory_list";
	}

	public String exportProviderFinanceExcel() {
		String path = statBiz.getProviderFinanceExcelDownloadFile(pf, fromDate, toDate);
		if (path != null) {
			try {
				this.setMsg("provider_finance");
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
	private Date finishFromDate;
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
		pageBean = statBiz.getFarmerFinanceList(ff, sendFromDate, sendToDate, finishFromDate, finishToDate, pageIndex,pageSize);
		return "farmer_list";
	}

	public String exportFarmerFinanceExcel() {
		String path = statBiz.getFarmerFinanceExcelDownloadFile(ff, sendFromDate, sendToDate, finishFromDate, finishToDate);
		if (path != null) {
			try {
				this.setMsg("farmer_finance");
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
		pageBean = statBiz.getProviderSettleFinanceList(pf, fromDate, toDate, pageIndex,pageSize);
		return "factory_settlement";
	}

	public String exportSettleProviderFinanceExcel() {
		String path = statBiz.getProviderSettleFinanceExcelDownloadFile(pf, fromDate, toDate);
		if (path != null) {
			try {
				this.setMsg("provider_settlement");
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
		pageBean = statBiz.getFarmerSettleFinanceList(ff, sendFromDate, sendToDate, finishFromDate, finishToDate, pageIndex,pageSize);
		return "farmer_settlement";
	}

	public String exportSettleFarmerFinanceExcel() {
		String path = statBiz.getFarmerSettleFinanceExcelDownloadFile(ff, sendFromDate, sendToDate,finishFromDate,finishToDate);
		if (path != null) {
			try {
				this.setMsg("farmer_settlement");
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
	public String exportFarmStatExcel(){
		String path = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Admin){
			if(farmId == null)
				return "farm_list";
			path = statBiz.exportFarmStatList(farmId);
		}else if(user instanceof AreaAccount){
			path = statBiz.exportFarmStatList(((AreaAccount)user).getArea().getFarm().getId());
		}else if(user instanceof ManagerAccount){
			path = statBiz.exportFarmStatList(((ManagerAccount)user).getFarm().getId());
		}
		if (path != null) {
			try {
				this.setMsg("farm_stat");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}
	
	//集团统计
	private List<SysStatDO> farmStatList;
	private List<FactoryStatDO> factoryStatList;

	public String querySysStat() {
		Object[] arr = statBiz.getSysStatListArr();
		farmStatList = (List<SysStatDO>) arr[0];
		factoryStatList = (List<FactoryStatDO>) arr[1];
		return "sys_list";
	}
	
	public String exportSysStatExcel(){
		String path = statBiz.exportSysStatList();
		if (path != null) {
			try {
				this.setMsg("sys_stat");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
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



	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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

	

	public Date getFinishFromDate() {
		return finishFromDate;
	}

	public void setFinishFromDate(Date finishFromDate) {
		this.finishFromDate = finishFromDate;
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

	public List<SysStatDO> getFarmStatList() {
		return farmStatList;
	}

	public void setFarmStatList(List<SysStatDO> farmStatList) {
		this.farmStatList = farmStatList;
	}

	public List<FactoryStatDO> getFactoryStatList() {
		return factoryStatList;
	}

	public void setFactoryStatList(List<FactoryStatDO> factoryStatList) {
		this.factoryStatList = factoryStatList;
	}

}
