package com.throne212.fupin.common;

import java.lang.reflect.Method;

import com.throne212.fupin.domain.Question;

public class QuestionStatDO {

	private Question q;
	
	private int[] num1 = {0,0};
	
	private int[] num2 = {0,0};
	private int[] num3 = {0,0};
	private int[] num6 = {0,0};
	private int[] num7 = {0,0};
	private int[] num8 = {0,0};
	private int[] num9 = {0,0};
	private int[] num10 = {0,0};
	private int[] num11 = {0,0};
	private int[] num12 = {0,0};
	private int[] num13 = {0,0};
	private int[] num24 = {0,0};
	
	private int[] num29 = {0,0};
	
	private int[] num47 = {0,0};
	private int[] num76 = {0,0};
	private int[] num77 = {0,0};
	private int[] num97 = {0,0};
	private int[] num98 = {0,0};
	private int[] num99 = {0,0};
	private int[] num100 = {0,0};
	
	
	
	public QuestionStatDO() {
		super();
	}

	public void addNum(Integer i, double val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = QuestionStatDO.class.getMethod("getNum"+i);
			int[] oldVal = (int[]) m.invoke(this);
			if(val == 1)
				oldVal[0] += 1;
			else if(val == 2)
				oldVal[1] += 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Question getQ() {
		return q;
	}

	public void setQ(Question q) {
		this.q = q;
	}


	public int[] getNum2() {
		return num2;
	}


	public void setNum2(int[] num2) {
		this.num2 = num2;
	}


	public int[] getNum3() {
		return num3;
	}


	public void setNum3(int[] num3) {
		this.num3 = num3;
	}


	public int[] getNum6() {
		return num6;
	}


	public void setNum6(int[] num6) {
		this.num6 = num6;
	}


	public int[] getNum7() {
		return num7;
	}


	public void setNum7(int[] num7) {
		this.num7 = num7;
	}


	public int[] getNum8() {
		return num8;
	}


	public void setNum8(int[] num8) {
		this.num8 = num8;
	}


	public int[] getNum9() {
		return num9;
	}


	public void setNum9(int[] num9) {
		this.num9 = num9;
	}


	public int[] getNum10() {
		return num10;
	}


	public void setNum10(int[] num10) {
		this.num10 = num10;
	}


	public int[] getNum11() {
		return num11;
	}


	public void setNum11(int[] num11) {
		this.num11 = num11;
	}


	public int[] getNum12() {
		return num12;
	}


	public void setNum12(int[] num12) {
		this.num12 = num12;
	}


	public int[] getNum13() {
		return num13;
	}


	public void setNum13(int[] num13) {
		this.num13 = num13;
	}


	public int[] getNum24() {
		return num24;
	}


	public void setNum24(int[] num24) {
		this.num24 = num24;
	}


	public int[] getNum47() {
		return num47;
	}


	public void setNum47(int[] num47) {
		this.num47 = num47;
	}


	public int[] getNum76() {
		return num76;
	}


	public void setNum76(int[] num76) {
		this.num76 = num76;
	}


	public int[] getNum77() {
		return num77;
	}


	public void setNum77(int[] num77) {
		this.num77 = num77;
	}


	public int[] getNum97() {
		return num97;
	}


	public void setNum97(int[] num97) {
		this.num97 = num97;
	}


	public int[] getNum98() {
		return num98;
	}


	public void setNum98(int[] num98) {
		this.num98 = num98;
	}


	public int[] getNum99() {
		return num99;
	}


	public void setNum99(int[] num99) {
		this.num99 = num99;
	}


	public int[] getNum100() {
		return num100;
	}


	public void setNum100(int[] num100) {
		this.num100 = num100;
	}

	public int[] getNum1() {
		return num1;
	}

	public void setNum1(int[] num1) {
		this.num1 = num1;
	}

	public int[] getNum29() {
		return num29;
	}

	public void setNum29(int[] num29) {
		this.num29 = num29;
	}

	
	
}
