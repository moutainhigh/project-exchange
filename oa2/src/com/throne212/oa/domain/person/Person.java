package com.throne212.oa.domain.person;

import java.text.ParseException;
import java.util.Date;

import com.throne212.oa.common.Util;

//����ʵ��
public class Person {

	private Long id;// ����
	private OrgType orgType;// ��λ����
	private OrgName orgName;// ��λ����
	private String name;// ����
	private Boolean gender;// �Ա�trueΪ�У�false��nullΪŮ
	private Date birthday;// ����
	private Integer age;// ����
	private PersonNation nation;// ����
	private String jiguan;// ����
	private ZhengZhi zhengzhi;// ������ò
	private String idNo;// ���֤
	private String phone;// �ֻ�����

	private FullDayXueLi fullDayXueli;// ȫ����ѧ��
	private Date fullDayStartDay;// ��ʼ����
	private Date fullDayEndDay;// ��������
	private String fullDaySchool;// ѧУ
	private String fullDayMajor;// רҵ
	private String fullDayXueliName;// ѧ������

	private OnJobXueLi onjobXueli;// ��ְѧ��
	private XueLiCengci cengci;// ѧ�����
	private Date onjobStartDay;// ��ʼ����
	private Date onjobEndDay;// ��������
	private String onjobSchool;// ѧУ
	private String onjobMajor;// רҵ
	private String onjobXueliName;// ѧ������

	private ShenFen shenFen;// ���
	private ZhiCheng zhiCheng;// ְ��
	private ZhuanYe zhuanYe;// רҵ
	private XingZhengGrade xingZhengGrade;// ��������
	private ZhiWu zhiWu;// ְ��
	private String jianzhi;// ��ְ

	private Date cizhi;// ��ְ
	private Date zidongLizhi;// �Զ���ְ
	private Date tuixiu;// ����
	private Date diaoruBenshi;// ���뱾��
	private Date tuichuBenshi;// �˳�����
	private Date shineiDiaodong;// ���ڵ���

	private Integer kaoheYear;// �������
	private KaoHeResult kaoheResult;// ���˽��

	private Date workExprStartDate;// ����������ʼ����
	private Date workExprEndDate;// ����������������
	private String workExprOrg;// ������λ
	private String workExprZhiwu;// ְ��

	private String relation;// �뱾������ϵ
	private String relationName;// ����
	private ZhengZhi relationZhengzhi;// ������ò
	private String relationOrg;// ������λ
	private String relationZhiwu;// ְ��

	private Date renmianDate;// ְ����������
	private Boolean renmian;// ���⣬trueΪ���Σ�false��nullΪ���
	private String renmianDesc;// �������
	private String renmianOrg;// ���ⵥλ

	private Date jiangchengDate;// ��������
	private Boolean jiangcheng;// ���ͣ�trueΪ������false��nullΪ����
	private String jiangchengDesc;// �������
	private String jiangchengOrg;// ���͵�λ

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public OrgType getOrgType() {
		return orgType;
	}

	public void setOrgType(OrgType orgType) {
		this.orgType = orgType;
	}

	public OrgName getOrgName() {
		return orgName;
	}

	public void setOrgName(OrgName orgName) {
		this.orgName = orgName;
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

	public Integer getAge() {
		if(age != null && age.intValue() > 0)
			return age;
		if(birthday == null)
			return null;
		long now = System.currentTimeMillis();
		long start = birthday.getTime();
		age = new Integer(((now-start)/1000/60/60/24/365)+"");
		return age;
	}
	
	public static void main(String[] args) {
		try {
			System.out.println((System.currentTimeMillis()-Util.getDateByTxt("1983-11-19").getTime())/1000/60/60/24/365);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public PersonNation getNation() {
		return nation;
	}

	public void setNation(PersonNation nation) {
		this.nation = nation;
	}

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	public ZhengZhi getZhengzhi() {
		return zhengzhi;
	}

	public void setZhengzhi(ZhengZhi zhengzhi) {
		this.zhengzhi = zhengzhi;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public FullDayXueLi getFullDayXueli() {
		return fullDayXueli;
	}

	public void setFullDayXueli(FullDayXueLi fullDayXueli) {
		this.fullDayXueli = fullDayXueli;
	}

	public Date getFullDayStartDay() {
		return fullDayStartDay;
	}

	public void setFullDayStartDay(Date fullDayStartDay) {
		this.fullDayStartDay = fullDayStartDay;
	}

	public Date getFullDayEndDay() {
		return fullDayEndDay;
	}

	public void setFullDayEndDay(Date fullDayEndDay) {
		this.fullDayEndDay = fullDayEndDay;
	}

	public String getFullDaySchool() {
		return fullDaySchool;
	}

	public void setFullDaySchool(String fullDaySchool) {
		this.fullDaySchool = fullDaySchool;
	}

	public String getFullDayMajor() {
		return fullDayMajor;
	}

	public void setFullDayMajor(String fullDayMajor) {
		this.fullDayMajor = fullDayMajor;
	}

	public String getFullDayXueliName() {
		return fullDayXueliName;
	}

	public void setFullDayXueliName(String fullDayXueliName) {
		this.fullDayXueliName = fullDayXueliName;
	}

	public OnJobXueLi getOnjobXueli() {
		return onjobXueli;
	}

	public void setOnjobXueli(OnJobXueLi onjobXueli) {
		this.onjobXueli = onjobXueli;
	}

	public XueLiCengci getCengci() {
		return cengci;
	}

	public void setCengci(XueLiCengci cengci) {
		this.cengci = cengci;
	}

	public Date getOnjobStartDay() {
		return onjobStartDay;
	}

	public void setOnjobStartDay(Date onjobStartDay) {
		this.onjobStartDay = onjobStartDay;
	}

	public Date getOnjobEndDay() {
		return onjobEndDay;
	}

	public void setOnjobEndDay(Date onjobEndDay) {
		this.onjobEndDay = onjobEndDay;
	}

	public String getOnjobSchool() {
		return onjobSchool;
	}

	public void setOnjobSchool(String onjobSchool) {
		this.onjobSchool = onjobSchool;
	}

	public String getOnjobMajor() {
		return onjobMajor;
	}

	public void setOnjobMajor(String onjobMajor) {
		this.onjobMajor = onjobMajor;
	}

	public String getOnjobXueliName() {
		return onjobXueliName;
	}

	public void setOnjobXueliName(String onjobXueliName) {
		this.onjobXueliName = onjobXueliName;
	}

	public ShenFen getShenFen() {
		return shenFen;
	}

	public void setShenFen(ShenFen shenFen) {
		this.shenFen = shenFen;
	}

	public ZhiCheng getZhiCheng() {
		return zhiCheng;
	}

	public void setZhiCheng(ZhiCheng zhiCheng) {
		this.zhiCheng = zhiCheng;
	}

	public ZhuanYe getZhuanYe() {
		return zhuanYe;
	}

	public void setZhuanYe(ZhuanYe zhuanYe) {
		this.zhuanYe = zhuanYe;
	}

	public XingZhengGrade getXingZhengGrade() {
		return xingZhengGrade;
	}

	public void setXingZhengGrade(XingZhengGrade xingZhengGrade) {
		this.xingZhengGrade = xingZhengGrade;
	}

	public ZhiWu getZhiWu() {
		return zhiWu;
	}

	public void setZhiWu(ZhiWu zhiWu) {
		this.zhiWu = zhiWu;
	}

	public String getJianzhi() {
		return jianzhi;
	}

	public void setJianzhi(String jianzhi) {
		this.jianzhi = jianzhi;
	}

	public Date getCizhi() {
		return cizhi;
	}

	public void setCizhi(Date cizhi) {
		this.cizhi = cizhi;
	}

	public Date getZidongLizhi() {
		return zidongLizhi;
	}

	public void setZidongLizhi(Date zidongLizhi) {
		this.zidongLizhi = zidongLizhi;
	}

	public Date getTuixiu() {
		return tuixiu;
	}

	public void setTuixiu(Date tuixiu) {
		this.tuixiu = tuixiu;
	}

	public Date getDiaoruBenshi() {
		return diaoruBenshi;
	}

	public void setDiaoruBenshi(Date diaoruBenshi) {
		this.diaoruBenshi = diaoruBenshi;
	}

	public Date getTuichuBenshi() {
		return tuichuBenshi;
	}

	public void setTuichuBenshi(Date tuichuBenshi) {
		this.tuichuBenshi = tuichuBenshi;
	}

	public Date getShineiDiaodong() {
		return shineiDiaodong;
	}

	public void setShineiDiaodong(Date shineiDiaodong) {
		this.shineiDiaodong = shineiDiaodong;
	}

	public Integer getKaoheYear() {
		return kaoheYear;
	}

	public void setKaoheYear(Integer kaoheYear) {
		this.kaoheYear = kaoheYear;
	}

	public KaoHeResult getKaoheResult() {
		return kaoheResult;
	}

	public void setKaoheResult(KaoHeResult kaoheResult) {
		this.kaoheResult = kaoheResult;
	}

	public Date getWorkExprStartDate() {
		return workExprStartDate;
	}

	public void setWorkExprStartDate(Date workExprStartDate) {
		this.workExprStartDate = workExprStartDate;
	}

	public Date getWorkExprEndDate() {
		return workExprEndDate;
	}

	public void setWorkExprEndDate(Date workExprEndDate) {
		this.workExprEndDate = workExprEndDate;
	}

	public String getWorkExprOrg() {
		return workExprOrg;
	}

	public void setWorkExprOrg(String workExprOrg) {
		this.workExprOrg = workExprOrg;
	}

	public String getWorkExprZhiwu() {
		return workExprZhiwu;
	}

	public void setWorkExprZhiwu(String workExprZhiwu) {
		this.workExprZhiwu = workExprZhiwu;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getRelationName() {
		return relationName;
	}

	public void setRelationName(String relationName) {
		this.relationName = relationName;
	}

	public ZhengZhi getRelationZhengzhi() {
		return relationZhengzhi;
	}

	public void setRelationZhengzhi(ZhengZhi relationZhengzhi) {
		this.relationZhengzhi = relationZhengzhi;
	}

	public String getRelationOrg() {
		return relationOrg;
	}

	public void setRelationOrg(String relationOrg) {
		this.relationOrg = relationOrg;
	}

	public String getRelationZhiwu() {
		return relationZhiwu;
	}

	public void setRelationZhiwu(String relationZhiwu) {
		this.relationZhiwu = relationZhiwu;
	}

	public Date getRenmianDate() {
		return renmianDate;
	}

	public void setRenmianDate(Date renmianDate) {
		this.renmianDate = renmianDate;
	}

	public Boolean getRenmian() {
		return renmian;
	}

	public void setRenmian(Boolean renmian) {
		this.renmian = renmian;
	}

	public String getRenmianDesc() {
		return renmianDesc;
	}

	public void setRenmianDesc(String renmianDesc) {
		this.renmianDesc = renmianDesc;
	}

	public String getRenmianOrg() {
		return renmianOrg;
	}

	public void setRenmianOrg(String renmianOrg) {
		this.renmianOrg = renmianOrg;
	}

	public Date getJiangchengDate() {
		return jiangchengDate;
	}

	public void setJiangchengDate(Date jiangchengDate) {
		this.jiangchengDate = jiangchengDate;
	}

	public Boolean getJiangcheng() {
		return jiangcheng;
	}

	public void setJiangcheng(Boolean jiangcheng) {
		this.jiangcheng = jiangcheng;
	}

	public String getJiangchengDesc() {
		return jiangchengDesc;
	}

	public void setJiangchengDesc(String jiangchengDesc) {
		this.jiangchengDesc = jiangchengDesc;
	}

	public String getJiangchengOrg() {
		return jiangchengOrg;
	}

	public void setJiangchengOrg(String jiangchengOrg) {
		this.jiangchengOrg = jiangchengOrg;
	}

}
