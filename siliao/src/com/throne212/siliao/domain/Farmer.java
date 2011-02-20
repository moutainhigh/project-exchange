package com.throne212.siliao.domain;

import java.io.Serializable;

//农户
public class Farmer extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 名字
	private String tel;// 手机号码
	private String email;// 邮箱地址
	private String no;// 唐口号
	private String ramark;// 备注
	private Area area;// 所属管区

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRamark() {
		return ramark;
	}

	public void setRamark(String ramark) {
		this.ramark = ramark;
	}

}
