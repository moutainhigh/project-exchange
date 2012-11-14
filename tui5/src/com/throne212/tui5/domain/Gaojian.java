package com.throne212.tui5.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.throne212.tui5.common.Const;

// default package


/**
 * Gaojian entity. @author Yang Lei
 */

public class Gaojian implements java.io.Serializable {

	// Fields

	private Long id;
	// 0:��Ͷ�壬�ȴ����,1:ͨ��,2ʧ��
	private Integer status;
	private User user;// Ͷ����
	private Task task;// ��������
	private Timestamp submitDate;//�ύʱ��
	private Timestamp checkDate;//��˼��ʱ��
	private Short hide;//1�����أ�0����
	private String content;//����
	private String attachment;//����ͼƬ�б�
	private BigDecimal money;//���ý���
	private Integer price123;//�������Ƚ�
	
	public String getStatusTxt(){
		if(Const.GAOJIAN_STATUS_INIT.equals(status)){
			return "�ȴ����";
		}else if(Const.GAOJIAN_STATUS_SUCC.equals(status)){
			return "�Ѳ���";
		}else if(Const.GAOJIAN_STATUS_FAIL.equals(status)){
			return "δ����";
		}
		return "";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Timestamp getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Timestamp submitDate) {
		this.submitDate = submitDate;
	}

	public Timestamp getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Timestamp checkDate) {
		this.checkDate = checkDate;
	}

	public Short getHide() {
		return hide;
	}

	public void setHide(Short hide) {
		this.hide = hide;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public Integer getPrice123() {
		return price123;
	}

	public void setPrice123(Integer price123) {
		this.price123 = price123;
	}

}