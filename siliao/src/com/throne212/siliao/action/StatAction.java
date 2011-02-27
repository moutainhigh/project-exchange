package com.throne212.siliao.action;

import java.util.Date;

import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.domain.Provider;
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
	private ProviderFinance pf;
	private Date fromDate;
	private Date toDate;

	public String queryFactory() {

		return "factory_list";
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

}
