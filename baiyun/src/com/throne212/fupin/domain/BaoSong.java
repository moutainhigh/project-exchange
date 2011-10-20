package com.throne212.fupin.domain;

import java.lang.reflect.Field;
import java.util.Date;

public class BaoSong extends Diqu {
	// 关系变量
	private User user;// org/zhen work user

	// 数据变量
	private Date date;
	private int status;// 1,org待办; 2,org已办/area待办, 3,area已发送给sa的, 4,退回给发送单位的
	private String title;
	private String content;
	private String attatch1;
	private String attatch2;
	private String attatch3;
	private String attatch4;
	private String attatch5;
	
	public String getAttatch(int i){
		try {
			Field f = this.getClass().getDeclaredField("attatch" + i);
			return (String) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public void setAttatch(int i, String value){
		try {
			Field f = this.getClass().getDeclaredField("attatch" + i);
			f.set(this, value);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttatch1() {
		return attatch1;
	}

	public void setAttatch1(String attatch1) {
		this.attatch1 = attatch1;
	}

	public String getAttatch2() {
		return attatch2;
	}

	public void setAttatch2(String attatch2) {
		this.attatch2 = attatch2;
	}

	public String getAttatch3() {
		return attatch3;
	}

	public void setAttatch3(String attatch3) {
		this.attatch3 = attatch3;
	}

	public String getAttatch4() {
		return attatch4;
	}

	public void setAttatch4(String attatch4) {
		this.attatch4 = attatch4;
	}

	public String getAttatch5() {
		return attatch5;
	}

	public void setAttatch5(String attatch5) {
		this.attatch5 = attatch5;
	}

}
