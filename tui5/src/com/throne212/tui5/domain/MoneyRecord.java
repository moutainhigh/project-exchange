package com.throne212.tui5.domain;

import java.math.BigDecimal;
import java.util.Date;

//��ֵ�����ּ�¼
public class MoneyRecord {

	private Long id;
	private String content;// ���ݣ�ԭ��
	private String comment;// ע��
	private Date applyTime;// ����ʱ��
	private Date completeTime;// ���ʱ��
	private Integer type;// 1��ֵ��0����
	private User user;// �û�
	private BigDecimal money;// ���
	private Integer status;//1�����У�2��ɣ�3ʧ��

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

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getStatusTxt(){
		if(status == null)
			return "";
		switch (status) {
		case 1:
			return "������";
		case 2:
			return "�ѳɹ�";
		case 3:
			return "ʧ��";
		default:
			return "";
		}
	}

}
