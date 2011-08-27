package com.throne212.fupin.domain;

//重点帮扶钟落潭镇项目
public class ProjectZhongdian extends Project {

	private String content;// 建设规模及内容
	private String lixiang;// 立项;
	private String baojian;// 报建
	private String shishi;// 实施
	private Double moneyShi;// 市财政
	private Double moneyQu;// 区财政
	private Double moneyZhen;// 镇街财政
	private Double moneyShehui;// 社会资金
	private String money;// 总投资
	private Double amount;// 数量

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLixiang() {
		return lixiang;
	}

	public void setLixiang(String lixiang) {
		this.lixiang = lixiang;
	}

	public String getBaojian() {
		return baojian;
	}

	public void setBaojian(String baojian) {
		this.baojian = baojian;
	}

	public String getShishi() {
		return shishi;
	}

	public void setShishi(String shishi) {
		this.shishi = shishi;
	}

	public Double getMoneyShi() {
		return moneyShi;
	}

	public void setMoneyShi(Double moneyShi) {
		this.moneyShi = moneyShi;
	}

	public Double getMoneyQu() {
		return moneyQu;
	}

	public void setMoneyQu(Double moneyQu) {
		this.moneyQu = moneyQu;
	}

	public Double getMoneyZhen() {
		return moneyZhen;
	}

	public void setMoneyZhen(Double moneyZhen) {
		this.moneyZhen = moneyZhen;
	}

	public Double getMoneyShehui() {
		return moneyShehui;
	}

	public void setMoneyShehui(Double moneyShehui) {
		this.moneyShehui = moneyShehui;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getMoney() {
		return money;
	}

}
