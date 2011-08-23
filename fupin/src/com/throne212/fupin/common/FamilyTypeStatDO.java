package com.throne212.fupin.common;

public class FamilyTypeStatDO {

	private String cunName;
	private Long type1;
	private Long type2;
	private Long type3;
	private Long type4;
	private Long sum;

	public FamilyTypeStatDO() {
		super();
	}

	public FamilyTypeStatDO(String cunName, Long type1, Long type2, Long type3, Long type4, Long sum) {
		super();
		this.cunName = cunName;
		this.type1 = type1;
		this.type2 = type2;
		this.type3 = type3;
		this.type4 = type4;
		this.sum = sum;
	}

	public String getRate() {
		if (type1 == null || type3 == null || sum == null)
			return "";
		double rate = (type1 + type3) / (1.0 * sum);
		rate = ((int) (rate * 10000)) / 100.0;
		return rate + "%";
	}

	public String getCunName() {
		return cunName;
	}

	public void setCunName(String cunName) {
		this.cunName = cunName;
	}

	public Long getType1() {
		return type1;
	}

	public void setType1(Long type1) {
		this.type1 = type1;
	}

	public Long getType2() {
		return type2;
	}

	public void setType2(Long type2) {
		this.type2 = type2;
	}

	public Long getType3() {
		return type3;
	}

	public void setType3(Long type3) {
		this.type3 = type3;
	}

	public Long getType4() {
		return type4;
	}

	public void setType4(Long type4) {
		this.type4 = type4;
	}

	public Long getSum() {
		return sum;
	}

	public void setSum(Long sum) {
		this.sum = sum;
	}

}
