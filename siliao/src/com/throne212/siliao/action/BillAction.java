package com.throne212.siliao.action;

import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.domain.Bill;

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

	public String addNewBill() {
		billBiz.addNewBill(bill);
		return "add_bill";
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

}
