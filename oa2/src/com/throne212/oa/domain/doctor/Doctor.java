package com.throne212.oa.domain.doctor;

import java.util.Date;

public class Doctor {
	
	private Long id;//主键
	private String name;//姓名
	private Boolean gender;//性别，true为男，false为女，null为不知
	private Date birthday;//生日
	private Nation nation;//民族
	private String image;//照片
	private String idNo;//省份证号码
	
	private XueLi xueli;//学历
	private String xueyuan;//所在院系
	private String major;//专业
	
	private String address;//家庭地址
	private String post;//邮编
	
	private Zige zige;//专业技术资格
	private String zigeNo;//注册编号
	private Grade grade;//级别
	
	private String org;//机构名称
	private String orgNo;//机构号码
	private String orgAddress;//机构地址
	private String orgPost;//机构邮编
	private Zhen areaZhen;//职业地点,镇
	private Cun areaCun;//职业地点,村
	private Date zhushiDate;//职业助师资格时间
	private Date yishiDate;//职业医师资格时间
	private String zhiyeGrade;//执业级别
	private String zhiyeKemu;//执业科目
	private String chufa;//处罚处分
	private String yewuKaohe;//业务考核
	private String other;//其它问题
	private BodyGrade bodyGrade;//身体状况
	private String workExpr;//工作经历	
	
	private String shenpiComment;//审批意见	
	private Date applyDate;//申请日期
	private Date okDate;//批准日期
	private String shenpiOrg;//审批机构
	
	private String comments;//备注
	
	
	//setter and getters

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Nation getNation() {
		return nation;
	}

	public void setNation(Nation nation) {
		this.nation = nation;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public XueLi getXueli() {
		return xueli;
	}

	public void setXueli(XueLi xueli) {
		this.xueli = xueli;
	}

	public String getXueyuan() {
		return xueyuan;
	}

	public void setXueyuan(String xueyuan) {
		this.xueyuan = xueyuan;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Zige getZige() {
		return zige;
	}

	public void setZige(Zige zige) {
		this.zige = zige;
	}

	public String getZigeNo() {
		return zigeNo;
	}

	public void setZigeNo(String zigeNo) {
		this.zigeNo = zigeNo;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getOrgNo() {
		return orgNo;
	}

	public void setOrgNo(String orgNo) {
		this.orgNo = orgNo;
	}

	public String getOrgAddress() {
		return orgAddress;
	}

	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}

	public String getOrgPost() {
		return orgPost;
	}

	public void setOrgPost(String orgPost) {
		this.orgPost = orgPost;
	}

	public Zhen getAreaZhen() {
		return areaZhen;
	}

	public void setAreaZhen(Zhen areaZhen) {
		this.areaZhen = areaZhen;
	}

	public Cun getAreaCun() {
		return areaCun;
	}

	public void setAreaCun(Cun areaCun) {
		this.areaCun = areaCun;
	}

	public Date getZhushiDate() {
		return zhushiDate;
	}

	public void setZhushiDate(Date zhushiDate) {
		this.zhushiDate = zhushiDate;
	}

	public Date getYishiDate() {
		return yishiDate;
	}

	public void setYishiDate(Date yishiDate) {
		this.yishiDate = yishiDate;
	}

	public String getZhiyeGrade() {
		return zhiyeGrade;
	}

	public void setZhiyeGrade(String zhiyeGrade) {
		this.zhiyeGrade = zhiyeGrade;
	}

	public String getZhiyeKemu() {
		return zhiyeKemu;
	}

	public void setZhiyeKemu(String zhiyeKemu) {
		this.zhiyeKemu = zhiyeKemu;
	}

	public String getChufa() {
		return chufa;
	}

	public void setChufa(String chufa) {
		this.chufa = chufa;
	}

	public String getYewuKaohe() {
		return yewuKaohe;
	}

	public void setYewuKaohe(String yewuKaohe) {
		this.yewuKaohe = yewuKaohe;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public BodyGrade getBodyGrade() {
		return bodyGrade;
	}

	public void setBodyGrade(BodyGrade bodyGrade) {
		this.bodyGrade = bodyGrade;
	}

	public String getWorkExpr() {
		return workExpr;
	}

	public void setWorkExpr(String workExpr) {
		this.workExpr = workExpr;
	}

	public String getShenpiComment() {
		return shenpiComment;
	}

	public void setShenpiComment(String shenpiComment) {
		this.shenpiComment = shenpiComment;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public Date getOkDate() {
		return okDate;
	}

	public void setOkDate(Date okDate) {
		this.okDate = okDate;
	}

	public String getShenpiOrg() {
		return shenpiOrg;
	}

	public void setShenpiOrg(String shenpiOrg) {
		this.shenpiOrg = shenpiOrg;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
}
