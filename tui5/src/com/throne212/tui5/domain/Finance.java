package com.throne212.tui5.domain;

import java.math.BigDecimal;
import java.util.Date;

//�����¼
public class Finance {

	private Long id;
	private String content;//���ݣ�ԭ��
	private String comment;//ע��
	private Date time;
	private Integer type;// 1,��Ǯ��0��Ǯ
	private User user;//�û�
	private BigDecimal money;// ���

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

}
