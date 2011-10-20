package com.throne212.fupin.domain;

public class CunWorkOrg extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Cun cun;
	private ZhenWorkOrg zhenWorkOrg;
	
	private String fuze;//负责人
	private String zhiwu;//职务
	private String address;//地址
	private String tel;//电话
	
	public Cun getCun() {
		return cun;
	}
	public void setCun(Cun cun) {
		this.cun = cun;
	}
	public ZhenWorkOrg getZhenWorkOrg() {
		return zhenWorkOrg;
	}
	public void setZhenWorkOrg(ZhenWorkOrg zhenWorkOrg) {
		this.zhenWorkOrg = zhenWorkOrg;
	}
	public String getFuze() {
		return fuze;
	}
	public void setFuze(String fuze) {
		this.fuze = fuze;
	}
	public String getZhiwu() {
		return zhiwu;
	}
	public void setZhiwu(String zhiwu) {
		this.zhiwu = zhiwu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	
}
