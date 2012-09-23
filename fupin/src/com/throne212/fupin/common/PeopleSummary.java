package com.throne212.fupin.common;

import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;

public class PeopleSummary {

	private Cun cun;
	private Org org;
	private int submit;
	private int year;

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public int getSubmit() {
		return submit;
	}

	public void setSubmit(int submit) {
		this.submit = submit;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

}
