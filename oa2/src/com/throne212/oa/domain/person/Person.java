package com.throne212.oa.domain.person;

import java.text.ParseException;
import java.util.Date;

import com.throne212.oa.common.Util;

//人事实体
public class Person {

	private Long id;// 主键
	private OrgType orgType;// 单位类型
	private OrgName orgName;// 单位名称
	private String name;// 姓名
	private Boolean gender;// 性别，true为男，false和null为女
	private Date birthday;// 生日
	private Integer age;// 年龄
	private PersonNation nation;// 名族
	private String jiguan;// 籍贯
	private ZhengZhi zhengzhi;// 政治面貌
	private String idNo;// 身份证
	private String phone;// 手机号码

	private FullDayXueLi fullDayXueli;// 全日制学历
	private Date fullDayStartDay;// 开始日期
	private Date fullDayEndDay;// 结束日期
	private String fullDaySchool;// 学校
	private String fullDayMajor;// 专业
	private String fullDayXueliName;// 学历名称

	private OnJobXueLi onjobXueli;// 在职学历
	private XueLiCengci cengci;// 学历层次
	private Date onjobStartDay;// 开始日期
	private Date onjobEndDay;// 结束日期
	private String onjobSchool;// 学校
	private String onjobMajor;// 专业
	private String onjobXueliName;// 学历名称

	private ShenFen shenFen;// 身份
	private ZhiCheng zhiCheng;// 职称
	private ZhuanYe zhuanYe;// 专业
	private XingZhengGrade xingZhengGrade;// 行政级别
	private ZhiWu zhiWu;// 职务
	private String jianzhi;// 兼职

	private Date cizhi;// 辞职
	private Date zidongLizhi;// 自动离职
	private Date tuixiu;// 退休
	private Date diaoruBenshi;// 调入本市
	private Date tuichuBenshi;// 退出本市
	private Date shineiDiaodong;// 市内调动

	private Integer kaoheYear;// 考核年度
	private KaoHeResult kaoheResult;// 考核结果

	private Date workExprStartDate;// 工作经历开始日期
	private Date workExprEndDate;// 工作经历结束日期
	private String workExprOrg;// 工作单位
	private String workExprZhiwu;// 职务

	private String relation;// 与本人社会关系
	private String relationName;// 姓名
	private ZhengZhi relationZhengzhi;// 政治面貌
	private String relationOrg;// 工作单位
	private String relationZhiwu;// 职务

	private Date renmianDate;// 职务任免日期
	private Boolean renmian;// 任免，true为上任，false和null为免除
	private String renmianDesc;// 任免情况
	private String renmianOrg;// 任免单位

	private Date jiangchengDate;// 奖惩日期
	private Boolean jiangcheng;// 奖惩，true为奖励，false和null为处罚
	private String jiangchengDesc;// 奖惩情况
	private String jiangchengOrg;// 奖惩单位

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
