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
	// 0:已投稿，等待审核,1:通过,2失败
	private Integer status;
	private User user;// 投稿者
	private Task task;// 所属任务
	private Timestamp submitDate;//提交时间
	private Timestamp checkDate;//审核检查时间
	private Short hide;//1不隐藏，0隐藏
	private String content;//内容
	private String attachment;//附件图片列表
	private BigDecimal money;//所得奖金
	private Integer price123;//所属几等奖
	
	public String getStatusTxt(){
		if(Const.GAOJIAN_STATUS_INIT.equals(status)){
			return "等待审核";
		}else if(Const.GAOJIAN_STATUS_SUCC.equals(status)){
			return "已采纳";
		}else if(Const.GAOJIAN_STATUS_FAIL.equals(status)){
			return "未采纳";
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