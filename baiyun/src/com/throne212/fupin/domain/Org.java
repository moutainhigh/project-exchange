package com.throne212.fupin.domain;

public class Org extends User {
	
	private static final long serialVersionUID = 1L;
	private Cun cun;//所帮扶的村
	private String orgName;//单位名
	
	//帮扶责任人信息
	private String orgTel;//单位电话
	private String chargePersonName;//责任人姓名 	
	private String chargePersonTel;//责任人电话
	private String orgAddr;//单位地址
	private String chargeDuty;//职务 	
	
	//单位联络员信息
	private String contactName;//联络员姓名
	private String contactDuty;//职务
	private String contactTel;//办公电话
	private String contactMobile;//手机号码
	private String contactFax;//传真号码
	private String contactAddr;//通讯地址
	private String contactPost;//邮政编码
	private String contactEmail;//电子邮箱 
	
	private Area area;//直属区县
	
	//白云专属字段
	private String fromDate;//驻村起始时间
	private String leaderName;//分管领导
	private String leaderMobile;//分管领导手机
	
	private String pinyin;
	
	//帮扶单位的类型,一类是政府机关单位，另一类是社会企业
	private String typeName;
	
	//帮扶类型，帮户，帮村，帮镇
	private boolean helpFamily;
	private boolean helpCun;
	private boolean helpZhen;
	
	public Cun getCun() {
		return cun;
	}
	public void setCun(Cun cun) {
		this.cun = cun;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgTel() {
		return orgTel;
	}
	public void setOrgTel(String orgTel) {
		this.orgTel = orgTel;
	}
	public String getChargePersonName() {
		return chargePersonName;
	}
	public void setChargePersonName(String chargePersonName) {
		this.chargePersonName = chargePersonName;
	}
	public String getChargePersonTel() {
		return chargePersonTel;
	}
	public void setChargePersonTel(String chargePersonTel) {
		this.chargePersonTel = chargePersonTel;
	}
	public String getOrgAddr() {
		return orgAddr;
	}
	public void setOrgAddr(String orgAddr) {
		this.orgAddr = orgAddr;
	}
	public String getChargeDuty() {
		return chargeDuty;
	}
	public void setChargeDuty(String chargeDuty) {
		this.chargeDuty = chargeDuty;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactDuty() {
		return contactDuty;
	}
	public void setContactDuty(String contactDuty) {
		this.contactDuty = contactDuty;
	}
	public String getContactTel() {
		return contactTel;
	}
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	public String getContactMobile() {
		return contactMobile;
	}
	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}
	public String getContactFax() {
		return contactFax;
	}
	public void setContactFax(String contactFax) {
		this.contactFax = contactFax;
	}
	public String getContactAddr() {
		return contactAddr;
	}
	public void setContactAddr(String contactAddr) {
		this.contactAddr = contactAddr;
	}
	public String getContactPost() {
		return contactPost;
	}
	public void setContactPost(String contactPost) {
		this.contactPost = contactPost;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getPinyin() {
		return pinyin;
	}
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public String getLeaderMobile() {
		return leaderMobile;
	}
	public void setLeaderMobile(String leaderMobile) {
		this.leaderMobile = leaderMobile;
	}
	public boolean isHelpFamily() {
		return helpFamily;
	}
	public void setHelpFamily(boolean helpFamily) {
		this.helpFamily = helpFamily;
	}
	public boolean isHelpCun() {
		return helpCun;
	}
	public void setHelpCun(boolean helpCun) {
		this.helpCun = helpCun;
	}
	public boolean isHelpZhen() {
		return helpZhen;
	}
	public void setHelpZhen(boolean helpZhen) {
		this.helpZhen = helpZhen;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
