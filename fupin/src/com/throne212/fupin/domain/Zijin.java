package com.throne212.fupin.domain;

import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;

public class Zijin {

	private Long id;
	private Integer type;
	private Cun cun;
	private Integer year;
	private Integer month;
	private Integer status;//0 or null normal, 1代表锁定了,2表示申请jiesuo

	private Set<ZijinItem> items = new HashSet<ZijinItem>();

	//用于数据展示
	private ZijinItem z1;
	private ZijinItem z2;
	private ZijinItem z3;
	private ZijinItem z4;
	private ZijinItem z5;
	private ZijinItem z6;
	private ZijinItem z7;
	private ZijinItem z8;
	private ZijinItem z9;
	private ZijinItem z10;
	private ZijinItem z11;
	private ZijinItem z12;
	private ZijinItem z13;
	private ZijinItem z14;
	private ZijinItem z15;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Set<ZijinItem> getItems() {
		return items;
	}

	public void setItems(Set<ZijinItem> items) {
		this.items = items;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public ZijinItem getZ(Integer i) {
		if (i == null || i == 0)
			return null;
		try {
			Method m = Zijin.class.getMethod("getZ"+i);
			return (ZijinItem) m.invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setItem(Integer i, ZijinItem val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = Zijin.class.getMethod("setZ"+i, ZijinItem.class);
			m.invoke(this, val);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ZijinItem getZ1() {
		return z1;
	}

	public void setZ1(ZijinItem z1) {
		this.z1 = z1;
	}

	public ZijinItem getZ2() {
		return z2;
	}

	public void setZ2(ZijinItem z2) {
		this.z2 = z2;
	}

	public ZijinItem getZ3() {
		return z3;
	}

	public void setZ3(ZijinItem z3) {
		this.z3 = z3;
	}

	public ZijinItem getZ4() {
		return z4;
	}

	public void setZ4(ZijinItem z4) {
		this.z4 = z4;
	}

	public ZijinItem getZ5() {
		return z5;
	}

	public void setZ5(ZijinItem z5) {
		this.z5 = z5;
	}

	public ZijinItem getZ6() {
		return z6;
	}

	public void setZ6(ZijinItem z6) {
		this.z6 = z6;
	}

	public ZijinItem getZ7() {
		return z7;
	}

	public void setZ7(ZijinItem z7) {
		this.z7 = z7;
	}

	public ZijinItem getZ8() {
		return z8;
	}

	public void setZ8(ZijinItem z8) {
		this.z8 = z8;
	}

	public ZijinItem getZ9() {
		return z9;
	}

	public void setZ9(ZijinItem z9) {
		this.z9 = z9;
	}

	public ZijinItem getZ10() {
		return z10;
	}

	public void setZ10(ZijinItem z10) {
		this.z10 = z10;
	}

	public ZijinItem getZ11() {
		return z11;
	}

	public void setZ11(ZijinItem z11) {
		this.z11 = z11;
	}

	public ZijinItem getZ12() {
		return z12;
	}

	public void setZ12(ZijinItem z12) {
		this.z12 = z12;
	}

	public ZijinItem getZ13() {
		return z13;
	}

	public void setZ13(ZijinItem z13) {
		this.z13 = z13;
	}

	public ZijinItem getZ14() {
		return z14;
	}

	public void setZ14(ZijinItem z14) {
		this.z14 = z14;
	}

	public ZijinItem getZ15() {
		return z15;
	}

	public void setZ15(ZijinItem z15) {
		this.z15 = z15;
	}

}
