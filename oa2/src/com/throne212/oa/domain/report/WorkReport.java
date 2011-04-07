package com.throne212.oa.domain.report;

import java.lang.reflect.Field;
//单个报表表格
public class WorkReport {
	protected Long id;
	protected ReportFile file;
	// 字段
	protected Double c1;
	protected Double c2;
	protected Double c3;
	protected Double c4;
	protected Double c5;
	protected Double c6;
	protected Double c7;
	protected Double c8;
	protected Double c9;
	protected Double c10;
	protected Double c11;
	protected Double c12;
	protected Double c13;
	protected Double c14;
	protected Double c15;
	protected Double c16;
	protected Double c17;
	protected Double c18;
	protected Double c19;
	protected Double c20;
	protected Double c21;
	protected Double c22;
	protected Double c23;
	protected Double c24;
	protected Double c25;
	protected Double c26;
	protected Double c27;
	protected Double c28;
	protected Double c29;
	protected Double c30;
	protected Double c31;
	protected Double c32;
	protected Double c33;
	protected Double c34;
	protected Double c35;
	

	public void setC(int index, Double value) {
		Field f;
		try {
			f = WorkReport.class.getDeclaredField("c" + index);
			if(!f.isAccessible())
				f.setAccessible(true);
			f.set(this, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Double getC(int index) {
		Field f;
		try {
			f = WorkReport.class.getDeclaredField("c" + index);
			if(!f.isAccessible())
				f.setAccessible(true);
			return (Double) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ReportFile getFile() {
		return file;
	}

	public void setFile(ReportFile file) {
		this.file = file;
	}

	public Double getC1() {
		return c1;
	}

	public void setC1(Double c1) {
		this.c1 = c1;
	}

	public Double getC2() {
		return c2;
	}

	public void setC2(Double c2) {
		this.c2 = c2;
	}

	public Double getC3() {
		return c3;
	}

	public void setC3(Double c3) {
		this.c3 = c3;
	}

	public Double getC4() {
		return c4;
	}

	public void setC4(Double c4) {
		this.c4 = c4;
	}

	public Double getC5() {
		return c5;
	}

	public void setC5(Double c5) {
		this.c5 = c5;
	}

	public Double getC6() {
		return c6;
	}

	public void setC6(Double c6) {
		this.c6 = c6;
	}

	public Double getC7() {
		return c7;
	}

	public void setC7(Double c7) {
		this.c7 = c7;
	}

	public Double getC8() {
		return c8;
	}

	public void setC8(Double c8) {
		this.c8 = c8;
	}

	public Double getC9() {
		return c9;
	}

	public void setC9(Double c9) {
		this.c9 = c9;
	}

	public Double getC10() {
		return c10;
	}

	public void setC10(Double c10) {
		this.c10 = c10;
	}

	public Double getC11() {
		return c11;
	}

	public void setC11(Double c11) {
		this.c11 = c11;
	}

	public Double getC12() {
		return c12;
	}

	public void setC12(Double c12) {
		this.c12 = c12;
	}

	public Double getC13() {
		return c13;
	}

	public void setC13(Double c13) {
		this.c13 = c13;
	}

	public Double getC14() {
		return c14;
	}

	public void setC14(Double c14) {
		this.c14 = c14;
	}

	public Double getC15() {
		return c15;
	}

	public void setC15(Double c15) {
		this.c15 = c15;
	}

	public Double getC16() {
		return c16;
	}

	public void setC16(Double c16) {
		this.c16 = c16;
	}

	public Double getC17() {
		return c17;
	}

	public void setC17(Double c17) {
		this.c17 = c17;
	}

	public Double getC18() {
		return c18;
	}

	public void setC18(Double c18) {
		this.c18 = c18;
	}

	public Double getC19() {
		return c19;
	}

	public void setC19(Double c19) {
		this.c19 = c19;
	}

	public Double getC20() {
		return c20;
	}

	public void setC20(Double c20) {
		this.c20 = c20;
	}

	public Double getC21() {
		return c21;
	}

	public void setC21(Double c21) {
		this.c21 = c21;
	}

	public Double getC22() {
		return c22;
	}

	public void setC22(Double c22) {
		this.c22 = c22;
	}

	public Double getC23() {
		return c23;
	}

	public void setC23(Double c23) {
		this.c23 = c23;
	}

	public Double getC24() {
		return c24;
	}

	public void setC24(Double c24) {
		this.c24 = c24;
	}

	public Double getC25() {
		return c25;
	}

	public void setC25(Double c25) {
		this.c25 = c25;
	}

	public Double getC26() {
		return c26;
	}

	public void setC26(Double c26) {
		this.c26 = c26;
	}

	public Double getC27() {
		return c27;
	}

	public void setC27(Double c27) {
		this.c27 = c27;
	}

	public Double getC28() {
		return c28;
	}

	public void setC28(Double c28) {
		this.c28 = c28;
	}

	public Double getC29() {
		return c29;
	}

	public void setC29(Double c29) {
		this.c29 = c29;
	}

	public Double getC30() {
		return c30;
	}

	public void setC30(Double c30) {
		this.c30 = c30;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getC31() {
		return c31;
	}

	public void setC31(Double c31) {
		this.c31 = c31;
	}

	public Double getC32() {
		return c32;
	}

	public void setC32(Double c32) {
		this.c32 = c32;
	}

	public Double getC33() {
		return c33;
	}

	public void setC33(Double c33) {
		this.c33 = c33;
	}

	public Double getC34() {
		return c34;
	}

	public void setC34(Double c34) {
		this.c34 = c34;
	}

	public Double getC35() {
		return c35;
	}

	public void setC35(Double c35) {
		this.c35 = c35;
	}
}
