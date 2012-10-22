package com.throne212.tui5.domain;

import java.sql.Timestamp;

// default package


/**
 * Gaojian entity. @author Yang Lei
 */

public class Gaojian implements java.io.Serializable {

	// Fields

	private Long id;
	// 0/null:��ʼ����1:��Ͷ�壬�ȴ����,2:ͨ��,3ʧ��
	private Integer status;
	private User user;// Ͷ����
	private Task task;// ��������
	private Timestamp submitDate;//�ύʱ��
	private Timestamp checkDate;//��˼��ʱ��

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

}