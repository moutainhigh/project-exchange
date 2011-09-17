package com.throne212.fupin.domain;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

//报表父类
public class Report extends MyEntity{

	private Org org;
	private Cun cun;
	private Integer year;
	private String type;
	private String time;
	
	//锁定
	private Integer lock;//0代表未锁/已解锁，1代表锁定，2代表请求解锁, 3代表暂存

	// 项目
	private String item1;
	private String item2;
	private String item3;
	private String item4;
	private String item5;
	private String item6;
	private String item7;
	private String item8;
	private String item9;
	private String item10;
	private String item11;
	private String item12;
	private String item13;
	private String item14;
	private String item15;
	private String item16;
	private String item17;
	private String item18;
	private String item19;
	private String item20;
	private String item21;
	private String item22;
	private String item23;
	private String item24;
	private String item25;
	private String item26;
	private String item27;
	private String item28;
	private String item29;
	private String item30;
	private String item31;
	private String item32;
	private String item33;
	private String item34;
	private String item35;
	private String item36;
	private String item37;
	private String item38;
	private String item39;
	private String item40;
	private String item41;
	private String item42;
	private String item43;
	private String item44;
	private String item45;
	private String item46;
	private String item47;
	private String item48;
	private String item49;
	private String item50;
	private String item51;
	private String item52;
	private String item53;
	private String item54;
	private String item55;
	private String item56;
	private String item57;
	private String item58;
	private String item59;
	private String item60;
	
	public String getReportName(){
		if(this.getClass().getName().equals(Report1.class.getName())){
			return "工作统计表";
		}else if(this.getClass().getName().equals(Report2.class.getName())){
			return "工作落实情况统计表";
		}
		return null;
	}

	public String getItem(Integer i) {
		if (i == null || i == 0)
			return null;
		try {
			Method m = Report.class.getMethod("getItem"+i);
			return (String) m.invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setItem(Integer i, String val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = Report.class.getMethod("setItem"+i, String.class);
			m.invoke(this, val);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getItem1() {
		return item1;
	}

	public void setItem1(String item1) {
		this.item1 = item1;
	}

	public String getItem2() {
		return item2;
	}

	public void setItem2(String item2) {
		this.item2 = item2;
	}

	public String getItem3() {
		return item3;
	}

	public void setItem3(String item3) {
		this.item3 = item3;
	}

	public String getItem4() {
		return item4;
	}

	public void setItem4(String item4) {
		this.item4 = item4;
	}

	public String getItem5() {
		return item5;
	}

	public void setItem5(String item5) {
		this.item5 = item5;
	}

	public String getItem6() {
		return item6;
	}

	public void setItem6(String item6) {
		this.item6 = item6;
	}

	public String getItem7() {
		return item7;
	}

	public void setItem7(String item7) {
		this.item7 = item7;
	}

	public String getItem8() {
		return item8;
	}

	public void setItem8(String item8) {
		this.item8 = item8;
	}

	public String getItem9() {
		return item9;
	}

	public void setItem9(String item9) {
		this.item9 = item9;
	}

	public String getItem10() {
		return item10;
	}

	public void setItem10(String item10) {
		this.item10 = item10;
	}

	public String getItem11() {
		return item11;
	}

	public void setItem11(String item11) {
		this.item11 = item11;
	}

	public String getItem12() {
		return item12;
	}

	public void setItem12(String item12) {
		this.item12 = item12;
	}

	public String getItem13() {
		return item13;
	}

	public void setItem13(String item13) {
		this.item13 = item13;
	}

	public String getItem14() {
		return item14;
	}

	public void setItem14(String item14) {
		this.item14 = item14;
	}

	public String getItem15() {
		return item15;
	}

	public void setItem15(String item15) {
		this.item15 = item15;
	}

	public String getItem16() {
		return item16;
	}

	public void setItem16(String item16) {
		this.item16 = item16;
	}

	public String getItem17() {
		return item17;
	}

	public void setItem17(String item17) {
		this.item17 = item17;
	}

	public String getItem18() {
		return item18;
	}

	public void setItem18(String item18) {
		this.item18 = item18;
	}

	public String getItem19() {
		return item19;
	}

	public void setItem19(String item19) {
		this.item19 = item19;
	}

	public String getItem20() {
		return item20;
	}

	public void setItem20(String item20) {
		this.item20 = item20;
	}

	public String getItem21() {
		return item21;
	}

	public void setItem21(String item21) {
		this.item21 = item21;
	}

	public String getItem22() {
		return item22;
	}

	public void setItem22(String item22) {
		this.item22 = item22;
	}

	public String getItem23() {
		return item23;
	}

	public void setItem23(String item23) {
		this.item23 = item23;
	}

	public String getItem24() {
		return item24;
	}

	public void setItem24(String item24) {
		this.item24 = item24;
	}

	public String getItem25() {
		return item25;
	}

	public void setItem25(String item25) {
		this.item25 = item25;
	}

	public String getItem26() {
		return item26;
	}

	public void setItem26(String item26) {
		this.item26 = item26;
	}

	public String getItem27() {
		return item27;
	}

	public void setItem27(String item27) {
		this.item27 = item27;
	}

	public String getItem28() {
		return item28;
	}

	public void setItem28(String item28) {
		this.item28 = item28;
	}

	public String getItem29() {
		return item29;
	}

	public void setItem29(String item29) {
		this.item29 = item29;
	}

	public String getItem30() {
		return item30;
	}

	public void setItem30(String item30) {
		this.item30 = item30;
	}

	public String getItem31() {
		return item31;
	}

	public void setItem31(String item31) {
		this.item31 = item31;
	}

	public String getItem32() {
		return item32;
	}

	public void setItem32(String item32) {
		this.item32 = item32;
	}

	public String getItem33() {
		return item33;
	}

	public void setItem33(String item33) {
		this.item33 = item33;
	}

	public String getItem34() {
		return item34;
	}

	public void setItem34(String item34) {
		this.item34 = item34;
	}

	public String getItem35() {
		return item35;
	}

	public void setItem35(String item35) {
		this.item35 = item35;
	}

	public String getItem36() {
		return item36;
	}

	public void setItem36(String item36) {
		this.item36 = item36;
	}

	public String getItem37() {
		return item37;
	}

	public void setItem37(String item37) {
		this.item37 = item37;
	}

	public String getItem38() {
		return item38;
	}

	public void setItem38(String item38) {
		this.item38 = item38;
	}

	public String getItem39() {
		return item39;
	}

	public void setItem39(String item39) {
		this.item39 = item39;
	}

	public String getItem40() {
		return item40;
	}

	public void setItem40(String item40) {
		this.item40 = item40;
	}

	public String getItem41() {
		return item41;
	}

	public void setItem41(String item41) {
		this.item41 = item41;
	}

	public String getItem42() {
		return item42;
	}

	public void setItem42(String item42) {
		this.item42 = item42;
	}

	public String getItem43() {
		return item43;
	}

	public void setItem43(String item43) {
		this.item43 = item43;
	}

	public String getItem44() {
		return item44;
	}

	public void setItem44(String item44) {
		this.item44 = item44;
	}

	public String getItem45() {
		return item45;
	}

	public void setItem45(String item45) {
		this.item45 = item45;
	}

	public String getItem46() {
		return item46;
	}

	public void setItem46(String item46) {
		this.item46 = item46;
	}

	public String getItem47() {
		return item47;
	}

	public void setItem47(String item47) {
		this.item47 = item47;
	}

	public String getItem48() {
		return item48;
	}

	public void setItem48(String item48) {
		this.item48 = item48;
	}

	public String getItem49() {
		return item49;
	}

	public void setItem49(String item49) {
		this.item49 = item49;
	}

	public String getItem50() {
		return item50;
	}

	public void setItem50(String item50) {
		this.item50 = item50;
	}

	public String getItem51() {
		return item51;
	}

	public void setItem51(String item51) {
		this.item51 = item51;
	}

	public String getItem52() {
		return item52;
	}

	public void setItem52(String item52) {
		this.item52 = item52;
	}

	public String getItem53() {
		return item53;
	}

	public void setItem53(String item53) {
		this.item53 = item53;
	}

	public String getItem54() {
		return item54;
	}

	public void setItem54(String item54) {
		this.item54 = item54;
	}

	public String getItem55() {
		return item55;
	}

	public void setItem55(String item55) {
		this.item55 = item55;
	}

	public String getItem56() {
		return item56;
	}

	public void setItem56(String item56) {
		this.item56 = item56;
	}

	public String getItem57() {
		return item57;
	}

	public void setItem57(String item57) {
		this.item57 = item57;
	}

	public String getItem58() {
		return item58;
	}

	public void setItem58(String item58) {
		this.item58 = item58;
	}

	public String getItem59() {
		return item59;
	}

	public void setItem59(String item59) {
		this.item59 = item59;
	}

	public String getItem60() {
		return item60;
	}

	public void setItem60(String item60) {
		this.item60 = item60;
	}

	public Integer getLock() {
		return lock;
	}

	public void setLock(Integer lock) {
		this.lock = lock;
	}

}
