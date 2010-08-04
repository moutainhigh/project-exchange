package com.throne212.auto.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import com.throne212.auto.common.Util;


/**
 * 所有实体的父类
 * */
@Entity
@javax.persistence.Inheritance(strategy=InheritanceType.JOINED)
@Table(name="auto_common_entity")
public abstract class MyEntity implements Serializable {

	protected static final long serialVersionUID = 1L;
	
	/**
	 * 主键
	 * */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected Long id;

	/**
	 * 实体名字
	 * */
	@Column
	protected String name;

	/**
	 * 实体创建时间
	 * */
	@Column
	protected Date createdDate = Util.getDateOnly(new Date());

	/**
	 * 实体最后更改时间
	 * */
	@Column
	protected Date lastModifyDate = new Date();

	/**
	 * 实体是否有效
	 * */
	@Column
	protected Boolean isActive = true;
	
	/**
	 * 实体描述
	 * */
	@Column
	protected String description;
	
	/**
	 * 排序编号
	 * */
	protected Integer orderNum;
	

	//setters and getters	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatedDate() {
		return createdDate;
	}
	public String getCreatedDateText() {
		return Util.getDate(createdDate);
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

}
