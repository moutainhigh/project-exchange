package com.throne212.proj.domain;

import java.lang.reflect.Field;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

//基础实体，定义了两个必须的字段和共用的toString方法
@MappedSuperclass
public abstract class MyEntity {

	//主键
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected Long id;
	//实体的名称
	@Column
	protected String name;

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

	//共用的实体的字符串方法，打印所有字段
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		Class<? extends Object> clazz = this.getClass();
		Field[] fs = clazz.getDeclaredFields();
		for (Field f : fs) {
			try {
				sb.append("\n[" + f.getName() + "]=[" + f.get(this) + "]");
			} catch (IllegalArgumentException e) {
				// ignore
			} catch (IllegalAccessException e) {
				// ignore
			}
		}
		return sb.toString();
	}

}
