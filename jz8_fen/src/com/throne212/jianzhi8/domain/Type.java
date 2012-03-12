package com.throne212.jianzhi8.domain;
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
    private String parentTypeCode;


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

}