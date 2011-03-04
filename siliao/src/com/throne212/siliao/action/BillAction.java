package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.BillLog;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.User;

public class BillAction extends BaseAction {

	private BillBiz billBiz;

	public BillBiz getBillBiz() {
		return billBiz;
	}

	public void setBillBiz(BillBiz billBiz) {
		this.billBiz = billBiz;
	}

	public String execute() {
		return SUCCESS;
	}

	private Bill bill;
	private String action;

	// 提交单据
	public String addNewBill() {
		User userInsess =(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (userInsess instanceof AreaAccount) {
			userInsess=(AreaAccount) userInsess;
			List<Area> areaList=billBiz.getEntitiesByColumn(Area.class, "account", userInsess);
			if (areaList.size()==0 || ((AreaAccount) userInsess).getArea() == null) {
				this.setMsg("账户没关联任何管区,无权进行操作！");
				return "bill_edit";
			}
		}else if (userInsess instanceof ManagerAccount) {
			userInsess=(ManagerAccount) userInsess;
			List<Farm> farmList=billBiz.getEntitiesByColumn(Farm.class, "manager", userInsess);
			if (farmList.size()==0 || ((ManagerAccount) userInsess).getFarm() == null) {
				this.setMsg("账户没关联任何农场,无权进行操作！");
				return "bill_edit";
				
			}
		}
		
		
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return "bill_edit";
		}
		/*if (bill.getFarmer().getName() != null && !bill.getFarmer().getName().equals("")) {
			Farmer farmer = billBiz.getEntityByUnique(Farmer.class, "name", bill.getFarmer().getName().trim());
			if (farmer != null)
				bill.setFarmer(farmer);
		}*/
		if (bill.getFactory().getId() != null && !"".equals(bill.getFactory().getId())) {
			Factory factory = billBiz.getEntityById(Factory.class, bill.getFactory().getId());
			if (factory == null) {
				this.setMsg("保存失败，不存在此厂商！");
				if (bill.getId() != null)
					bill = billBiz.getEntityById(Bill.class, bill.getId());
				return "bill_edit";
			}
			bill.setFactory(factory);
		}
		if (bill.getFarm().getId() != null && !"".equals(bill.getFarm().getId())) {
			Farm farm = billBiz.getEntityById(Farm.class, bill.getFarm().getId());
			if (farm == null) {
				this.setMsg("保存失败，不存在此农场！");
				if (bill.getId() != null)
					bill = billBiz.getEntityById(Bill.class, bill.getId());
				return "bill_edit";
			}
			bill.setFarm(farm);
		}
		// 数据处理
		// 如果provider.id为空，则设置provider为空
		if (bill.getProvider() != null && bill.getProvider().getId() == null)
			bill.setProvider(null);
		// 如果areaAccount.id为空，则设置areaAccount为空
		if (bill.getAreaAccount() != null && bill.getAreaAccount().getId() == null)
			bill.setAreaAccount(null);
		// 设置经理为空
		bill.setManager(null);
		// 添加
		bill.setStatus(WebConstants.BILL_STATUS_SUBMIT);
		if (bill.getId() == null)
			billBiz.addNewBill(bill);// 提交一个新的单据
		else
			billBiz.submitDraftBill(bill);// 提交草稿的单据
		this.setMsg("已提交申请单据！");
		bill = null;
		return myBillList();
	}

	// 保存草稿
	public String saveBillDraft() {
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return "bill_edit";
		}
		if (bill.getFactory().getId() != null && !"".equals(bill.getFactory().getId())) {
			Factory factory = billBiz.getEntityById(Factory.class, bill.getFactory().getId());
			if (factory == null) {
				this.setMsg("保存失败，不存在此厂商！");
				return "bill_edit";
			}
			bill.setFactory(factory);
		}
		if (bill.getFarm().getId() != null && !"".equals(bill.getFarm().getId())) {
			Farm farm = billBiz.getEntityById(Farm.class, bill.getFarm().getId());
			if (farm == null) {
				this.setMsg("保存失败，不存在此农场！");
				return "bill_edit";
			}
			bill.setFarm(farm);
		}
		// 数据处理
		// 如果provider.id为空，则设置provider为空
		if (bill.getProvider() != null && bill.getProvider().getId() == null)
			bill.setProvider(null);
		// 如果areaAccount.id为空，则设置areaAccount为空
		if (bill.getAreaAccount() != null && bill.getAreaAccount().getId() == null)
			bill.setAreaAccount(null);
		// 设置经理为空
		bill.setManager(null);
		bill.setStatus(WebConstants.BILL_STATUS_DRAFT);
		billBiz.saveBillDraft(bill);
		this.setMsg("成功保存单据草稿！");
		bill = null;
		return myBillList();
	}

	// 查询单据
	private Integer page;
	private PageBean pageBean;
	private Date fromDate;// 创建日期
	private Date toDate;
	private String currMan;// 当前处理人
	private Date planFromDate;// 计划
	private Date planToDate;
	private Date sendFromDate;// 送达
	private Date sendToDate;
	private List<BillLog> billLog;// 日志列表

	// 我的单据
	public String myBillList() {
		pageBean = billBiz.getMyBillList(bill, fromDate, toDate, currMan, planFromDate, planToDate, sendFromDate, sendToDate, page);
		return "my_bill_list";
	}

	// 继续编辑单据
	public String editBill() {
		if (bill == null || bill.getId() == null) {
			this.setMsg("参数错误");
			return myBillList();
		}
		bill = billBiz.getEntityById(Bill.class, bill.getId());
		billLog = billBiz.getBillLogList(bill);
		return "bill_edit";
	}

	private InputStream downloadFile;

	// 导出我的单据的excel
	public String exportMyBillExcel() {
		String path = billBiz.getMyBillExcelDownloadFile(bill, fromDate, toDate, currMan, planFromDate, planToDate, sendFromDate, sendToDate);
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

	// 确认单据
	public String confirmBill() {
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return "bill_edit";
		}
		/*if (bill.getFarmer().getName() != null && !bill.getFarmer().getName().equals("")) {
			Farmer farmer = billBiz.getEntityByUnique(Farmer.class, "name", bill.getFarmer().getName());
			if (farmer == null) {
				this.setMsg("保存失败，不存在此农户！");
				if (bill.getId() != null)
					bill = billBiz.getEntityById(Bill.class, bill.getId());
				return "bill_edit";
			}
			bill.setFarmer(farmer);
		}*/
		if (bill.getFactory().getId() != null && !"".equals(bill.getFactory().getId())) {
			Factory factory = billBiz.getEntityById(Factory.class, bill.getFactory().getId());
			if (factory == null) {
				this.setMsg("保存失败，不存在此厂商！");
				if (bill.getId() != null)
					bill = billBiz.getEntityById(Bill.class, bill.getId());
				return "bill_edit";
			}
			bill.setFactory(factory);
		}
		if (bill.getFarm().getId() != null && !"".equals(bill.getFarm().getId())) {
			Farm farm = billBiz.getEntityById(Farm.class, bill.getFarm().getId());
			if (farm == null) {
				this.setMsg("保存失败，不存在此农场！");
				if (bill.getId() != null)
					bill = billBiz.getEntityById(Bill.class, bill.getId());
				return "bill_edit";
			}
			bill.setFarm(farm);
		}
		// 数据处理
		// 如果provider.id为空，则设置provider为空
		if (bill.getProvider() != null && bill.getProvider().getId() == null)
			bill.setProvider(null);
		// 如果areaAccount.id为空，则设置areaAccount为空
		if (bill.getAreaAccount() != null && bill.getAreaAccount().getId() == null)
			bill.setAreaAccount(null);
		// 状态
		Boolean pass = bill.getShenpiResult();
		if (pass != null && pass) {
			bill.setStatus(WebConstants.BILL_STATUS_CONFIRM);
			billBiz.confirmBill(bill);// 通过审核
			this.setMsg("已审核通过单据！");
		} else {
			bill.setStatus(WebConstants.BILL_STATUS_DRAFT);
			billBiz.saveBillDraft(bill);// 驳回
			this.setMsg("已驳回单据！");
		}
		bill = null;
		return myBillList();
	}

	// 待我处理
	private String accountName;// 管区负责人

	public String waitBillList() {
		pageBean = billBiz.getWaitBillList(bill, fromDate, toDate, currMan, accountName, page);
		return "wait_bill_list";
	}

	public String editWaitBill() {
		if (bill == null || bill.getId() == null) {
			this.setMsg("参数错误");
			return waitBillList();
		}
		bill = billBiz.getEntityById(Bill.class, bill.getId());
		billLog = billBiz.getBillLogList(bill);
		return "wait_bill_edit";
	}

	public String exportWaitBillExcel() {
		String path = billBiz.getWaitBillExcelDownloadFile(bill, fromDate, toDate, currMan, accountName);
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

	// 发料
	public String sendBill() {
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return waitBillList();
		}
		bill = billBiz.sendBill(bill);
		if (bill.getShenheResult() != null && bill.getShenheResult()) {// 发料
			this.setMsg("发料成功");
		} else {
			this.setMsg("发料请求被驳回");
		}
		bill = null;
		return waitBillList();
	}

	// 单据查询，系统管理专用
	public String adminBillList() {
		pageBean = billBiz.getAdminBillList(bill, fromDate, toDate, currMan, accountName, page);
		return "admin_bill_list";
	}

	public String editAdminBill() {
		if (bill == null || bill.getId() == null) {
			this.setMsg("参数错误");
			return adminBillList();
		}
		bill = billBiz.getEntityById(Bill.class, bill.getId());
		billLog = billBiz.getBillLogList(bill);
		return "admin_bill_edit";
	}

	public String exportAdminBillExcel() {
		String path = billBiz.getAdminBillExcelDownloadFile(bill, fromDate, toDate, currMan, accountName);
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

	// 修改状态
	public String changeBillStatus() {
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return adminBillList();
		}
		bill = billBiz.changeBillStatus(bill);
		this.setMsg("状态修改成功【" + bill.getStatusTxt() + "】");
		bill = null;
		return adminBillList();
	}

	// 对账
	public String sentBillList() {
		pageBean = billBiz.getSentBillList(bill, fromDate, toDate, currMan, accountName, page);
		return "sent_bill_list";
	}

	public String editSentBill() {
		if (bill == null || bill.getId() == null) {
			this.setMsg("参数错误");
			return sentBillList();
		}
		bill = billBiz.getEntityById(Bill.class, bill.getId());
		if(bill != null){
			bill.setFinishPrice(Util.multiplyMoney(bill.getAmount(), Util.addMoney(bill.getPriceOnOrder(), bill.getAgentUnitPrice())));
		}
		return "sent_bill_edit";
	}

	public String exportSentBillExcel() {
		String path = billBiz.getSentBillExcelDownloadFile(bill, fromDate, toDate, currMan, accountName);
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

	public String finishBill() {
		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return editSentBill();
		}
		String[] billDetail = (String[]) ActionContext.getContext().getParameters().get("billDetail");
		if (billDetail == null || billDetail.length == 0) {
			this.setMsg("单据保存失败，请检查数据分配信息是否录入完整");
			return editSentBill();
		}
		bill = billBiz.finishBill(bill, billDetail);
		this.setMsg("单据到料成功【" + bill.getStatusTxt() + "】");
		bill = null;
		return sentBillList();
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
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

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public String getCurrMan() {
		return currMan;
	}

	public void setCurrMan(String currMan) {
		this.currMan = currMan;
	}

	public Date getPlanFromDate() {
		return planFromDate;
	}

	public void setPlanFromDate(Date planFromDate) {
		this.planFromDate = planFromDate;
	}

	public Date getPlanToDate() {
		return planToDate;
	}

	public void setPlanToDate(Date planToDate) {
		this.planToDate = planToDate;
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

	public List<BillLog> getBillLog() {
		return billLog;
	}

	public void setBillLog(List<BillLog> billLog) {
		this.billLog = billLog;
	}
}
