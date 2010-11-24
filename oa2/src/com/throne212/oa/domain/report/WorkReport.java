package com.throne212.oa.domain.report;

import java.lang.reflect.Field;

public class WorkReport {

	protected Long id;//���
	protected Year year;//�������
	//��������,
	//y:�걨��;
	//h:�ϰ���;
	//9:1-9;
	//s:������;
	//m:�±���
	protected String dateType;
	protected HospitalType orgType;//������
	protected Hospital org;//��λ
	
	//�ֶ�
	protected Integer c1;
	protected Integer c2;
	protected Integer c3;
	protected Integer c4;
	protected Integer c5;
	protected Integer c6;
	protected Integer c7;
	protected Integer c8;
	protected Integer c9;
	protected Integer c10;
	protected Integer c11;
	protected Integer c12;
	protected Integer c13;
	protected Integer c14;
	protected Integer c15;
	protected Integer c16;
	protected Integer c17;
	protected Integer c18;
	protected Integer c19;
	protected Integer c20;
	protected Integer c21;
	protected Integer c22;
	protected Integer c23;
	protected Integer c24;
	protected Integer c25;
	protected Integer c26;
	protected Integer c27;
	protected Integer c28;
	protected Integer c29;
	protected Integer c30;

	public void setC(int index,Integer value){
		Field f;
		try {
			f = this.getClass().getDeclaredField("c"+index);
			f.set(this, value);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public Integer getC(int index){
		Field f;
		try {
			f = this.getClass().getDeclaredField("c"+index);
			return (Integer) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Year getYear() {
		return year;
	}

	public void setYear(Year year) {
		this.year = year;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	public HospitalType getOrgType() {
		return orgType;
	}

	public void setOrgType(HospitalType orgType) {
		this.orgType = orgType;
	}

	public Hospital getOrg() {
		return org;
	}

	public void setOrg(Hospital org) {
		this.org = org;
	}

	public Integer getC1() {
		return c1;
	}

	public void setC1(Integer c1) {
		this.c1 = c1;
	}

	public Integer getC2() {
		return c2;
	}

	public void setC2(Integer c2) {
		this.c2 = c2;
	}

	public Integer getC3() {
		return c3;
	}

	public void setC3(Integer c3) {
		this.c3 = c3;
	}

	public Integer getC4() {
		return c4;
	}

	public void setC4(Integer c4) {
		this.c4 = c4;
	}

	public Integer getC5() {
		return c5;
	}

	public void setC5(Integer c5) {
		this.c5 = c5;
	}

	public Integer getC6() {
		return c6;
	}

	public void setC6(Integer c6) {
		this.c6 = c6;
	}

	public Integer getC7() {
		return c7;
	}

	public void setC7(Integer c7) {
		this.c7 = c7;
	}

	public Integer getC8() {
		return c8;
	}

	public void setC8(Integer c8) {
		this.c8 = c8;
	}

	public Integer getC9() {
		return c9;
	}

	public void setC9(Integer c9) {
		this.c9 = c9;
	}

	public Integer getC10() {
		return c10;
	}

	public void setC10(Integer c10) {
		this.c10 = c10;
	}

	public Integer getC11() {
		return c11;
	}

	public void setC11(Integer c11) {
		this.c11 = c11;
	}

	public Integer getC12() {
		return c12;
	}

	public void setC12(Integer c12) {
		this.c12 = c12;
	}

	public Integer getC13() {
		return c13;
	}

	public void setC13(Integer c13) {
		this.c13 = c13;
	}

	public Integer getC14() {
		return c14;
	}

	public void setC14(Integer c14) {
		this.c14 = c14;
	}

	public Integer getC15() {
		return c15;
	}

	public void setC15(Integer c15) {
		this.c15 = c15;
	}

	public Integer getC16() {
		return c16;
	}

	public void setC16(Integer c16) {
		this.c16 = c16;
	}

	public Integer getC17() {
		return c17;
	}

	public void setC17(Integer c17) {
		this.c17 = c17;
	}

	public Integer getC18() {
		return c18;
	}

	public void setC18(Integer c18) {
		this.c18 = c18;
	}

	public Integer getC19() {
		return c19;
	}

	public void setC19(Integer c19) {
		this.c19 = c19;
	}

	public Integer getC20() {
		return c20;
	}

	public void setC20(Integer c20) {
		this.c20 = c20;
	}

	public Integer getC21() {
		return c21;
	}

	public void setC21(Integer c21) {
		this.c21 = c21;
	}

	public Integer getC22() {
		return c22;
	}

	public void setC22(Integer c22) {
		this.c22 = c22;
	}

	public Integer getC23() {
		return c23;
	}

	public void setC23(Integer c23) {
		this.c23 = c23;
	}

	public Integer getC24() {
		return c24;
	}

	public void setC24(Integer c24) {
		this.c24 = c24;
	}

	public Integer getC25() {
		return c25;
	}

	public void setC25(Integer c25) {
		this.c25 = c25;
	}

	public Integer getC26() {
		return c26;
	}

	public void setC26(Integer c26) {
		this.c26 = c26;
	}

	public Integer getC27() {
		return c27;
	}

	public void setC27(Integer c27) {
		this.c27 = c27;
	}

	public Integer getC28() {
		return c28;
	}

	public void setC28(Integer c28) {
		this.c28 = c28;
	}

	public Integer getC29() {
		return c29;
	}

	public void setC29(Integer c29) {
		this.c29 = c29;
	}

	public Integer getC30() {
		return c30;
	}

	public void setC30(Integer c30) {
		this.c30 = c30;
	}

}
