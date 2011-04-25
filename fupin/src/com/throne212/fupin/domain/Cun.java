package com.throne212.fupin.domain;

public class Cun extends Diqu {
	private Zhen zhen;
	private Org org;
	
	private Integer familyNum;//户数
	private Integer personNum;//人口
	private Integer needBanFamily;//需要搬迁户数
	private Integer needBanPerson;//需要搬迁人数
	private Integer labor;
	private Integer outLabor;
	private Integer trainingNum;//培训人次
	private Integer transNum;//转移人数
	private Integer poorFamilyNum;
	private Integer poorPersonNum;
	private Integer poorFamilyNum1;
	private Integer poorPersonNum1;
	private Integer poorFamilyNum2;
	private Integer poorPersonNum2;
	private Integer poorFamilyNum3;
	private Integer poorPersonNum3;
	private Integer poorFamilyNum4;
	private Integer poorPersonNum4;
	private Integer dibaoFamily;
	private Integer dibaoPerson;
	private Integer dian;
	private Integer you;
	private Integer mianji;
	private Integer house;
	private Integer weiHouse;
	private Integer water;
	private Integer tv;
	private Double income;
	private String ying;
	private String office;
	private String item;
	
	private String pinyin;
	
	//新增字段
	private Integer pureWater;//纯净水
	private Integer tel;//电话
	private Integer light;//路灯
	
	
	//完整名
	private String absName;
	
	public void setAbsName(String absName) {
		this.absName = absName;
	}

	public String getAbsName(){
		if(zhen!=null && zhen.getArea()!=null){
			return zhen.getArea().getName()+zhen.getName()+name;
		}
		return "";
	}

	public Zhen getZhen() {
		return zhen;
	}

	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Integer getFamilyNum() {
		return familyNum;
	}

	public void setFamilyNum(Integer familyNum) {
		this.familyNum = familyNum;
	}

	public Integer getPersonNum() {
		return personNum;
	}

	public void setPersonNum(Integer personNum) {
		this.personNum = personNum;
	}

	public Integer getNeedBanFamily() {
		return needBanFamily;
	}

	public void setNeedBanFamily(Integer needBanFamily) {
		this.needBanFamily = needBanFamily;
	}

	public Integer getNeedBanPerson() {
		return needBanPerson;
	}

	public void setNeedBanPerson(Integer needBanPerson) {
		this.needBanPerson = needBanPerson;
	}

	public Integer getLabor() {
		return labor;
	}

	public void setLabor(Integer labor) {
		this.labor = labor;
	}

	public Integer getOutLabor() {
		return outLabor;
	}

	public void setOutLabor(Integer outLabor) {
		this.outLabor = outLabor;
	}

	public Integer getTrainingNum() {
		return trainingNum;
	}

	public void setTrainingNum(Integer trainingNum) {
		this.trainingNum = trainingNum;
	}

	public Integer getTransNum() {
		return transNum;
	}

	public void setTransNum(Integer transNum) {
		this.transNum = transNum;
	}

	public Integer getPoorFamilyNum() {
		return poorFamilyNum;
	}

	public void setPoorFamilyNum(Integer poorFamilyNum) {
		this.poorFamilyNum = poorFamilyNum;
	}

	public Integer getPoorPersonNum() {
		return poorPersonNum;
	}

	public void setPoorPersonNum(Integer poorPersonNum) {
		this.poorPersonNum = poorPersonNum;
	}

	public Integer getDibaoFamily() {
		return dibaoFamily;
	}

	public void setDibaoFamily(Integer dibaoFamily) {
		this.dibaoFamily = dibaoFamily;
	}

	public Integer getDibaoPerson() {
		return dibaoPerson;
	}

	public void setDibaoPerson(Integer dibaoPerson) {
		this.dibaoPerson = dibaoPerson;
	}

	public Integer getDian() {
		return dian;
	}

	public void setDian(Integer dian) {
		this.dian = dian;
	}

	public Integer getYou() {
		return you;
	}

	public void setYou(Integer you) {
		this.you = you;
	}

	public Integer getMianji() {
		return mianji;
	}

	public void setMianji(Integer mianji) {
		this.mianji = mianji;
	}

	public Integer getHouse() {
		return house;
	}

	public void setHouse(Integer house) {
		this.house = house;
	}

	public Integer getWeiHouse() {
		return weiHouse;
	}

	public void setWeiHouse(Integer weiHouse) {
		this.weiHouse = weiHouse;
	}

	public Integer getWater() {
		return water;
	}

	public void setWater(Integer water) {
		this.water = water;
	}

	public Integer getTv() {
		return tv;
	}

	public void setTv(Integer tv) {
		this.tv = tv;
	}

	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public String getYing() {
		return ying;
	}

	public void setYing(String ying) {
		this.ying = ying;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public Integer getPoorFamilyNum1() {
		return poorFamilyNum1;
	}

	public void setPoorFamilyNum1(Integer poorFamilyNum1) {
		this.poorFamilyNum1 = poorFamilyNum1;
	}

	public Integer getPoorPersonNum1() {
		return poorPersonNum1;
	}

	public void setPoorPersonNum1(Integer poorPersonNum1) {
		this.poorPersonNum1 = poorPersonNum1;
	}

	public Integer getPoorFamilyNum2() {
		return poorFamilyNum2;
	}

	public void setPoorFamilyNum2(Integer poorFamilyNum2) {
		this.poorFamilyNum2 = poorFamilyNum2;
	}

	public Integer getPoorPersonNum2() {
		return poorPersonNum2;
	}

	public void setPoorPersonNum2(Integer poorPersonNum2) {
		this.poorPersonNum2 = poorPersonNum2;
	}

	public Integer getPoorFamilyNum3() {
		return poorFamilyNum3;
	}

	public void setPoorFamilyNum3(Integer poorFamilyNum3) {
		this.poorFamilyNum3 = poorFamilyNum3;
	}

	public Integer getPoorPersonNum3() {
		return poorPersonNum3;
	}

	public void setPoorPersonNum3(Integer poorPersonNum3) {
		this.poorPersonNum3 = poorPersonNum3;
	}

	public Integer getPoorFamilyNum4() {
		return poorFamilyNum4;
	}

	public void setPoorFamilyNum4(Integer poorFamilyNum4) {
		this.poorFamilyNum4 = poorFamilyNum4;
	}

	public Integer getPoorPersonNum4() {
		return poorPersonNum4;
	}

	public void setPoorPersonNum4(Integer poorPersonNum4) {
		this.poorPersonNum4 = poorPersonNum4;
	}

	public Integer getPureWater() {
		return pureWater;
	}

	public void setPureWater(Integer pureWater) {
		this.pureWater = pureWater;
	}

	public Integer getTel() {
		return tel;
	}

	public void setTel(Integer tel) {
		this.tel = tel;
	}

	public Integer getLight() {
		return light;
	}

	public void setLight(Integer light) {
		this.light = light;
	}

}
