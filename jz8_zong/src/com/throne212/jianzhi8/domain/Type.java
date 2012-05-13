package com.throne212.jianzhi8.domain;

import java.util.List;

// default package



/**
 * Type entity. @author MyEclipse Persistence Tools
 */

public class Type  implements java.io.Serializable, TypeIntf {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -433055620018468715L;

	private String typeCode;
    private String typeName;
    private String typeId;
    private String parentTypeCode;

    private List<Type> childTypes;//用作数据读取，不做关系存储
    private int count;//已经有的数量

    // Constructors

    /** default constructor */
    public Type() {
    }


	public String getTypeCode() {
		return typeCode;
	}


	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}


	public String getTypeName() {
		return typeName;
	}


	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public String getParentTypeCode() {
		return parentTypeCode;
	}


	public void setParentTypeCode(String parentTypeCode) {
		this.parentTypeCode = parentTypeCode;
	}


	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}


	public String getTypeId() {
		return typeId;
	}


	public List<Type> getChildTypes() {
		return childTypes;
	}


	public void setChildTypes(List<Type> childTypes) {
		this.childTypes = childTypes;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}

}