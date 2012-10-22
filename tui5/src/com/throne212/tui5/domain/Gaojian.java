package com.throne212.tui5.domain;

import java.sql.Timestamp;

// default package


/**
 * Gaojian entity. @author Yang Lei
 */

public class Gaojian implements java.io.Serializable {

	// Fields

	private Long id;
	// 0/null:初始化，1:已投稿，等待审核,2:通过,3失败
	private Integer status;
	private User user;// 投稿者
	private Task task;// 所属任务
	private Timestamp submitDate;//提交时间
	private Timestamp checkDate;//审核检查时间

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