package com.throne212.jianzhi8.domain;
// default package



/**
 * JZWords entity. @author MyEclipse Persistence Tools
 */

public class JZWords  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -1934671847759993571L;
	private Integer keyNo;
     private String keyType;
     private String keyName;
     private String keyIscheck;


    // Constructors

    /** default constructor */
    public JZWords() {
    }

	/** minimal constructor */
    public JZWords(String keyType, String keyName) {
        this.keyType = keyType;
        this.keyName = keyName;
    }
    
    /** full constructor */
    public JZWords(String keyType, String keyName, String keyIscheck) {
        this.keyType = keyType;
        this.keyName = keyName;
        this.keyIscheck = keyIscheck;
    }

   
    // Property accessors

    public Integer getKeyNo() {
        return this.keyNo;
    }
    
    public void setKeyNo(Integer keyNo) {
        this.keyNo = keyNo;
    }

    public String getKeyType() {
        return this.keyType;
    }
    
    public void setKeyType(String keyType) {
        this.keyType = keyType;
    }

    public String getKeyName() {
        return this.keyName;
    }
    
    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    public String getKeyIscheck() {
        return this.keyIscheck;
    }
    
    public void setKeyIscheck(String keyIscheck) {
        this.keyIscheck = keyIscheck;
    }
   








}