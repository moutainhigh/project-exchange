package com.throne212.siliao.biz.impl;

import com.throne212.siliao.biz.BillBiz;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.dao.BillDao;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Provider;

public class BillBizImpl extends BaseBizImpl implements BillBiz {

	private BillDao billDao;

	public Bill addNewBill(Bill bill) {
		Farm farm = billDao.getEntityById(Farm.class, bill.getFarm().getId());
		Provider provider = billDao.getEntityById(Provider.class, bill.getProvider().getId());
		
		bill.setOrderId(Util.genOrderId(farm.getName(),provider.getName(),0L));
		return null;
	}

	public BillDao getBillDao() {
		return billDao;
	}

	public void setBillDao(BillDao billDao) {
		this.billDao = billDao;
	}

}
