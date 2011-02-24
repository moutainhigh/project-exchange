package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Farmer;

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


	public String addNewBill() {	

		if (bill == null) {
			this.setMsg("单据保存失败，请检查数据是否录入完整");
			return "add_bill";
		}
		
		if(bill.getFarmer().getName()!=null&&!bill.getFarmer().getName().equals("")){
			Farmer farmer=	billBiz.getEntityByUnique(Farmer.class, "name", bill.getFarmer().getName());
				if (farmer==null) {
					this.setMsg("保存失败，不存在此农户！");
					return "add_bill";
				}
				bill.setFarmer(farmer);
			}
		
		if(bill.getFactory().getId()!=null&&!"".equals(bill.getFactory().getId())){
		Factory factory=	billBiz.getEntityById(Factory.class,bill.getFactory().getId());
			if (factory==null) {
				this.setMsg("保存失败，不存在此厂商！");
				return "add_bill";
			}
			bill.setFactory(factory);
		}
		
		if(bill.getFarm().getId()!=null&&!"".equals(bill.getFarm().getId())){
			Farm farm=	billBiz.getEntityById(Farm.class,bill.getFarm().getId());
				if (farm==null) {
					this.setMsg("保存失败，不存在此农场！");
					return "add_bill";
				}
				bill.setFarm(farm);
			}
		
		//添加
		if(bill.getId()==null&&!"".equals(bill.getFarmer().getName())){
			if("addNew".equals(action)){
				bill.setStatus(WebConstants.BILL_STATUS_SUBMIT);
				billBiz.addNewBill(bill);
				this.setMsg("已提交申请单据！");
				return "add_bill";
			}else if ("saveDraft".equals(action)) {
				bill.setStatus(WebConstants.BILL_STATUS_DRAFT);
				billBiz.addNewBill(bill);
				this.setMsg("成功保存草稿！");
				return "add_bill";
			}else {
				this.setMsg("提交错误！");
				return "add_bill";
			}
			
		}else if (bill.getId()!=null&&"".equals(bill.getFarmer().getName())) {
			//查看单据详情
			bill=billBiz.getEntityById(Bill.class, bill.getId());
			return "add_bill";
		}
		return "add_bill";
	}
	//查询单据
	private Integer page;
	private PageBean pageBean;
	private Date fromDate;
	private Date toDate;
	
	public String billList() {
		
		pageBean = billBiz.getBillList(bill, fromDate, toDate, page);
		return "bill_list";
		
	}
	
	private InputStream downloadFile;


	public String exportBillExcel() {
		String path = billBiz.getBillExcelDownloadFile(bill, fromDate, toDate);
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
}
