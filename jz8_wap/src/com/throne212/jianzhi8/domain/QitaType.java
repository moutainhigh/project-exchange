package com.throne212.jianzhi8.domain;
// default package

/**
 * QitaType entity. @author MyEclipse Persistence Tools
 */

public class QitaType implements java.io.Serializable {

	// Fields

	private String typeCode;
	private String typeName;

	// Constructors

	/** default constructor */
	public QitaType() {
	}

	/** full constructor */
	public QitaType(String typeCode, String typeName) {
		this.typeCode = typeCode;
		this.typeName = typeName;
	}

	// Property accessors

	public String getTypeCode() {
		return this.typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}