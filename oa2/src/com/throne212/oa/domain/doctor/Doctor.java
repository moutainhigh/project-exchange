package com.throne212.oa.domain.doctor;

import java.util.Date;

public class Doctor {
	
	private Long id;//����
	private String name;//����
	private Boolean gender;//�Ա�trueΪ�У�falseΪŮ��nullΪ��֪
	private Date birthday;//����
	private Nation nation;//����
	private String image;//��Ƭ
	private String idNo;//ʡ��֤����
	
	private XueLi xueli;//ѧ��
	private String xueyuan;//����Ժϵ
	private String major;//רҵ
	
	private String address;//��ͥ��ַ
	private String post;//�ʱ�
	
	private Zige zige;//רҵ�����ʸ�
	private String zigeNo;//ע����
	private Grade grade;//����
	
	private String org;//��������
	private String orgNo;//��������
	private String orgAddress;//������ַ
	private String orgPost;//�����ʱ�
	private Zhen areaZhen;//ְҵ�ص�,��
	private Cun areaCun;//ְҵ�ص�,��
	private Date zhushiDate;//ְҵ��ʦ�ʸ�ʱ��
	private Date yishiDate;//ְҵҽʦ�ʸ�ʱ��
	private String zhiyeGrade;//ִҵ����
	private String zhiyeKemu;//ִҵ��Ŀ
	private String chufa;//��������
	private String yewuKaohe;//ҵ�񿼺�
	private String other;//��������
	private BodyGrade bodyGrade;//����״��
	private String workExpr;//��������	
	
	private String shenpiComment;//�������	
	private Date applyDate;//��������
	private Date okDate;//��׼����
	private String shenpiOrg;//��������
	
	private String comments;//��ע
	
	private Integer status;//ע��״̬,1��ʾ������0��ʾ��ע��
	private String unregReason;//ע��ԭ��
	
	
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUnregReason() {
		return unregReason;
	}

	public void setUnregReason(String unregReason) {
		this.unregReason = unregReason;
	}
	
	
	
}
