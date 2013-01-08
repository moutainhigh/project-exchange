package com.throne212.fupin.dataobject;

import java.lang.reflect.Method;


public class State {

	private String area;
	private String zhen;
	private String cun;
	private String org;

	private String ok1;
	private String ok2;
	private String ok3;
	private String ok4;
	private String ok5;
	private String ok6;
	private String ok7;
	private String ok8;
	private String ok9;
	private String ok10;
	private String ok11;
	private String ok12;

	public String getOk(Integer i) {
		if (i == null || i == 0)
			return null;
		try {
			Method m = this.getClass().getMethod("getOk"+i);
			return (String) m.invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setOk(Integer i, String val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = this.getClass().getMethod("setOk"+i, String.class);
			m.invoke(this, val);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getZhen() {
		return zhen;
	}

	public void setZhen(String zhen) {
		this.zhen = zhen;
	}

	public String getCun() {
		return cun;
	}

	public void setCun(String cun) {
		this.cun = cun;
	}

	public String getOk1() {
		return ok1;
	}

	public void setOk1(String ok1) {
		this.ok1 = ok1;
	}

	public String getOk2() {
		return ok2;
	}

	public void setOk2(String ok2) {
		this.ok2 = ok2;
	}

	public String getOk3() {
		return ok3;
	}

	public void setOk3(String ok3) {
		this.ok3 = ok3;
	}

	public String getOk4() {
		return ok4;
	}

	public void setOk4(String ok4) {
		this.ok4 = ok4;
	}

	public String getOk5() {
		return ok5;
	}

	public void setOk5(String ok5) {
		this.ok5 = ok5;
	}

	public String getOk6() {
		return ok6;
	}

	public void setOk6(String ok6) {
		this.ok6 = ok6;
	}

	public String getOk7() {
		return ok7;
	}

	public void setOk7(String ok7) {
		this.ok7 = ok7;
	}

	public String getOk8() {
		return ok8;
	}

	public void setOk8(String ok8) {
		this.ok8 = ok8;
	}

	public String getOk9() {
		return ok9;
	}

	public void setOk9(String ok9) {
		this.ok9 = ok9;
	}

	public String getOk10() {
		return ok10;
	}

	public void setOk10(String ok10) {
		this.ok10 = ok10;
	}

	public String getOk11() {
		return ok11;
	}

	public void setOk11(String ok11) {
		this.ok11 = ok11;
	}

	public String getOk12() {
		return ok12;
	}

	public void setOk12(String ok12) {
		this.ok12 = ok12;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

}
