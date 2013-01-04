package com.throne212.fupin.domain;

import java.lang.reflect.Method;
import java.math.BigDecimal;

public class ZijinItem {

	private Long id;
	private Zijin zijin;
	private String file;
	private String content;
	private int index;
	
	private BigDecimal item1;
	private BigDecimal item2;
	private BigDecimal item3;
	private BigDecimal item4;
	private BigDecimal item5;
	private BigDecimal item6;
	private BigDecimal item7;
	private BigDecimal item8;
	private BigDecimal item9;
	private BigDecimal item10;
	private BigDecimal item11;
	private BigDecimal item12;
	private BigDecimal item13;
	private BigDecimal item14;
	private BigDecimal item15;
	private BigDecimal item16;
	private BigDecimal item17;
	private BigDecimal item18;
	private BigDecimal item19;
	private BigDecimal item20;
	private BigDecimal item21;
	private BigDecimal item22;
	private BigDecimal item23;
	private BigDecimal item24;
	private BigDecimal item25;
	
	
	public BigDecimal getItem(Integer i) {
		if (i == null || i == 0)
			return null;
		try {
			Method m = ZijinItem.class.getMethod("getItem"+i);
			return (BigDecimal) m.invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setItem(Integer i, BigDecimal val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = ZijinItem.class.getMethod("setItem"+i, BigDecimal.class);
			m.invoke(this, val);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public BigDecimal getItem1() {
		return item1;
	}

	public void setItem1(BigDecimal item1) {
		this.item1 = item1;
	}

	public BigDecimal getItem2() {
		return item2;
	}

	public void setItem2(BigDecimal item2) {
		this.item2 = item2;
	}

	public BigDecimal getItem3() {
		return item3;
	}

	public void setItem3(BigDecimal item3) {
		this.item3 = item3;
	}

	public BigDecimal getItem4() {
		return item4;
	}

	public void setItem4(BigDecimal item4) {
		this.item4 = item4;
	}

	public BigDecimal getItem5() {
		return item5;
	}

	public void setItem5(BigDecimal item5) {
		this.item5 = item5;
	}

	public BigDecimal getItem6() {
		return item6;
	}

	public void setItem6(BigDecimal item6) {
		this.item6 = item6;
	}

	public BigDecimal getItem7() {
		return item7;
	}

	public void setItem7(BigDecimal item7) {
		this.item7 = item7;
	}

	public BigDecimal getItem8() {
		return item8;
	}

	public void setItem8(BigDecimal item8) {
		this.item8 = item8;
	}

	public BigDecimal getItem9() {
		return item9;
	}

	public void setItem9(BigDecimal item9) {
		this.item9 = item9;
	}

	public BigDecimal getItem10() {
		return item10;
	}

	public void setItem10(BigDecimal item10) {
		this.item10 = item10;
	}

	public BigDecimal getItem11() {
		return item11;
	}

	public void setItem11(BigDecimal item11) {
		this.item11 = item11;
	}

	public BigDecimal getItem12() {
		return item12;
	}

	public void setItem12(BigDecimal item12) {
		this.item12 = item12;
	}

	public BigDecimal getItem13() {
		return item13;
	}

	public void setItem13(BigDecimal item13) {
		this.item13 = item13;
	}

	public BigDecimal getItem14() {
		return item14;
	}

	public void setItem14(BigDecimal item14) {
		this.item14 = item14;
	}

	public BigDecimal getItem15() {
		return item15;
	}

	public void setItem15(BigDecimal item15) {
		this.item15 = item15;
	}

	public BigDecimal getItem16() {
		return item16;
	}

	public void setItem16(BigDecimal item16) {
		this.item16 = item16;
	}

	public BigDecimal getItem17() {
		return item17;
	}

	public void setItem17(BigDecimal item17) {
		this.item17 = item17;
	}

	public BigDecimal getItem18() {
		return item18;
	}

	public void setItem18(BigDecimal item18) {
		this.item18 = item18;
	}

	public BigDecimal getItem19() {
		return item19;
	}

	public void setItem19(BigDecimal item19) {
		this.item19 = item19;
	}

	public BigDecimal getItem20() {
		return item20;
	}

	public void setItem20(BigDecimal item20) {
		this.item20 = item20;
	}

	public BigDecimal getItem21() {
		return item21;
	}

	public void setItem21(BigDecimal item21) {
		this.item21 = item21;
	}

	public BigDecimal getItem22() {
		return item22;
	}

	public void setItem22(BigDecimal item22) {
		this.item22 = item22;
	}

	public BigDecimal getItem23() {
		return item23;
	}

	public void setItem23(BigDecimal item23) {
		this.item23 = item23;
	}

	public BigDecimal getItem24() {
		return item24;
	}

	public void setItem24(BigDecimal item24) {
		this.item24 = item24;
	}

	public BigDecimal getItem25() {
		return item25;
	}

	public void setItem25(BigDecimal item25) {
		this.item25 = item25;
	}

	public Zijin getZijin() {
		return zijin;
	}

	public void setZijin(Zijin zijin) {
		this.zijin = zijin;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
	
	
}
