package com.throne212.jianzhi8.domain;
// default package



/**
 * JobType entity. @author MyEclipse Persistence Tools
 */

public class JobType  implements java.io.Serializable, TypeIntf {


    /**
	 * 
	 */
	private static final long serialVersionUID = 87733777007295541L;
	// Fields    

     private String typeCode;
     private String typeName;
     private String parentTypeCode;


    // Constructors

    /** default constructor */
    public JobType() {
    }

	/** minimal constructor */
    public JobType(String typeName) {
        this.typeName = typeName;
    }
    
    /** full constructor */
    public JobType(String typeName, String parentTypeCode) {
        this.typeName = typeName;
        this.parentTypeCode = parentTypeCode;
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

    public String getParentTypeCode() {
        return this.parentTypeCode;
    }
    
    public void setParentTypeCode(String parentTypeCode) {
        this.parentTypeCode = parentTypeCode;
    }
   








}