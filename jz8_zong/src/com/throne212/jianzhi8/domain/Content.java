package com.throne212.jianzhi8.domain;
// default package

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


/**
 * Content entity. @author MyEclipse Persistence Tools
 */

public class Content  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1168495110342160881L;
	private Integer ctNo;
     private String ctTitle;
     private String ctContent;
     private String ctCityId;
     private String ctCityName;
     private String ctUserId;
     private String ctKind;
     private String ctClass;
     private String ctTypeId;
     private String ctTypeName;
     private String ctIscheck;
     private String ctIsclose;
     private String ctIpaddr;
     private Integer ctRenumber;
     private Integer ctReNewNumber;
     private Timestamp ctRegdate;
     private Timestamp ctUpdate;
     private Timestamp ctEnddate;
     private String ctSalary;
     private String ctLimitdate;
     private String ctUnittype;
     private String ctJobnum;
     private String ctSelsex;
     private String ctDigree;
     private Integer ctLooknum;
     private String ctIsreg;
     private String ctEmail;
     private String ctContact;
     private String ctPassword;
     private String ctIspay;
     private String ctIshuiyuan;
     private String ctCompanyname;
     private String ctJobtime;
     private String ctMobile;
     private String ctQq;
     private String ctPhone;
     private String ctUserName;
     private String ctIsyz;

     //用于表示，而不存储
     private TypeIntf type;

    // Constructors

    /** default constructor */
    public Content() {
    }

	/** minimal constructor */
    public Content(String ctTitle, String ctContent, String ctCityId, String ctUserId, String ctKind, String ctTypeId, String ctIscheck, Timestamp ctRegdate, Timestamp ctUpdate, Timestamp ctEnddate) {
        this.ctTitle = ctTitle;
        this.ctContent = ctContent;
        this.ctCityId = ctCityId;
        this.ctUserId = ctUserId;
        this.ctKind = ctKind;
        this.ctTypeId = ctTypeId;
        this.ctIscheck = ctIscheck;
        this.ctRegdate = ctRegdate;
        this.ctUpdate = ctUpdate;
        this.ctEnddate = ctEnddate;
    }
    
    /** full constructor */
    public Content(String ctTitle, String ctContent, String ctCityId, String ctCityName, String ctUserId, String ctKind, String ctClass, String ctTypeId, String ctTypeName, String ctIscheck, String ctIsclose, String ctIpaddr, Integer ctRenumber, Integer ctReNewNumber, Timestamp ctRegdate, Timestamp ctUpdate, Timestamp ctEnddate, String ctSalary, String ctLimitdate, String ctUnittype, String ctJobnum, String ctSelsex, String ctDigree, Integer ctLooknum, String ctIsreg, String ctEmail, String ctContact, String ctPassword, String ctIspay, String ctIshuiyuan, String ctCompanyname, String ctJobtime, String ctMobile, String ctQq, String ctPhone, String ctUserName, String ctIsyz) {
        this.ctTitle = ctTitle;
        this.ctContent = ctContent;
        this.ctCityId = ctCityId;
        this.ctCityName = ctCityName;
        this.ctUserId = ctUserId;
        this.ctKind = ctKind;
        this.ctClass = ctClass;
        this.ctTypeId = ctTypeId;
        this.ctTypeName = ctTypeName;
        this.ctIscheck = ctIscheck;
        this.ctIsclose = ctIsclose;
        this.ctIpaddr = ctIpaddr;
        this.ctRenumber = ctRenumber;
        this.ctReNewNumber = ctReNewNumber;
        this.ctRegdate = ctRegdate;
        this.ctUpdate = ctUpdate;
        this.ctEnddate = ctEnddate;
        this.ctSalary = ctSalary;
        this.ctLimitdate = ctLimitdate;
        this.ctUnittype = ctUnittype;
        this.ctJobnum = ctJobnum;
        this.ctSelsex = ctSelsex;
        this.ctDigree = ctDigree;
        this.ctLooknum = ctLooknum;
        this.ctIsreg = ctIsreg;
        this.ctEmail = ctEmail;
        this.ctContact = ctContact;
        this.ctPassword = ctPassword;
        this.ctIspay = ctIspay;
        this.ctIshuiyuan = ctIshuiyuan;
        this.ctCompanyname = ctCompanyname;
        this.ctJobtime = ctJobtime;
        this.ctMobile = ctMobile;
        this.ctQq = ctQq;
        this.ctPhone = ctPhone;
        this.ctUserName = ctUserName;
        this.ctIsyz = ctIsyz;
    }

   
    public String getUpdateTimeTxt(){
    	if(this.ctUpdate == null)
    		return null;
    	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
    	return fmt.format(this.ctUpdate);
    }
    
    public String getUpdateTimeTxt2(){
    	if(this.ctUpdate == null)
    		return null;
    	SimpleDateFormat fmt = new SimpleDateFormat("MM-dd");
    	return fmt.format(this.ctUpdate);
    }
    
    public boolean getDing() {
		if ("1".equals(ctIspay) && ctEnddate != null) {
			long now = System.currentTimeMillis();
			long endTime = ctEnddate.getTime();
			if (now < endTime)
				return true;
		}
		return false;
	}
    
    public boolean getIng(){
    	if ("1".equals(ctIsyz) && ctEnddate != null) {
			long now = System.currentTimeMillis();
			long endTime = ctEnddate.getTime();
			if (now < endTime)
				return true;
		}
    	return false;
    }
    
    // Property accessors

    public Integer getCtNo() {
        return this.ctNo;
    }
    
    public void setCtNo(Integer ctNo) {
        this.ctNo = ctNo;
    }

    public String getCtTitle() {
        return this.ctTitle;
    }
    
    public void setCtTitle(String ctTitle) {
        this.ctTitle = ctTitle;
    }

    public String getCtContent() {
    	if(!"0".equals(ctLimitdate)){
    		try {
				int limit = Integer.parseInt(ctLimitdate);
				//ct_update + ct_limitdate 
				long now = System.currentTimeMillis();
				long updateTime = ctUpdate.getTime();
				long endTime = updateTime + limit * 24 * 60 * 60 * 1000;
				if(now > endTime){
					this.ctContent = "本条信息已过期";
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
				this.ctContent = "信息读取错误";
			}
    	}
        return this.ctContent;
    }
    
    public void setCtContent(String ctContent) {
        this.ctContent = ctContent;
    }

    public String getCtCityId() {
        return this.ctCityId;
    }
    
    public void setCtCityId(String ctCityId) {
        this.ctCityId = ctCityId;
    }

    public String getCtCityName() {
        return this.ctCityName;
    }
    
    public void setCtCityName(String ctCityName) {
        this.ctCityName = ctCityName;
    }

    public String getCtUserId() {
        return this.ctUserId;
    }
    
    public void setCtUserId(String ctUserId) {
        this.ctUserId = ctUserId;
    }

    public String getCtKind() {
        return this.ctKind;
    }
    
    public void setCtKind(String ctKind) {
        this.ctKind = ctKind;
    }

    public String getCtClass() {
        return this.ctClass;
    }
    
    public void setCtClass(String ctClass) {
        this.ctClass = ctClass;
    }

    public String getCtTypeId() {
        return this.ctTypeId;
    }
    
    public void setCtTypeId(String ctTypeId) {
        this.ctTypeId = ctTypeId;
    }

    public String getCtTypeName() {
        return this.ctTypeName;
    }
    
    public void setCtTypeName(String ctTypeName) {
        this.ctTypeName = ctTypeName;
    }

    public String getCtIscheck() {
        return this.ctIscheck;
    }
    
    public void setCtIscheck(String ctIscheck) {
        this.ctIscheck = ctIscheck;
    }

    public String getCtIsclose() {
        return this.ctIsclose;
    }
    
    public void setCtIsclose(String ctIsclose) {
        this.ctIsclose = ctIsclose;
    }

    public String getCtIpaddr() {
        return this.ctIpaddr;
    }
    
    public void setCtIpaddr(String ctIpaddr) {
        this.ctIpaddr = ctIpaddr;
    }

    public Integer getCtRenumber() {
        return this.ctRenumber;
    }
    
    public void setCtRenumber(Integer ctRenumber) {
        this.ctRenumber = ctRenumber;
    }

    public Integer getCtReNewNumber() {
        return this.ctReNewNumber;
    }
    
    public void setCtReNewNumber(Integer ctReNewNumber) {
        this.ctReNewNumber = ctReNewNumber;
    }

    public Timestamp getCtRegdate() {
        return this.ctRegdate;
    }
    
    public void setCtRegdate(Timestamp ctRegdate) {
        this.ctRegdate = ctRegdate;
    }

    public Timestamp getCtUpdate() {
        return this.ctUpdate;
    }
    
    public void setCtUpdate(Timestamp ctUpdate) {
        this.ctUpdate = ctUpdate;
    }

    public Timestamp getCtEnddate() {
        return this.ctEnddate;
    }
    
    public void setCtEnddate(Timestamp ctEnddate) {
        this.ctEnddate = ctEnddate;
    }

    public String getCtSalary() {
        return this.ctSalary;
    }
    
    public void setCtSalary(String ctSalary) {
        this.ctSalary = ctSalary;
    }

    public String getCtLimitdate() {
        return this.ctLimitdate;
    }
    
    public void setCtLimitdate(String ctLimitdate) {
        this.ctLimitdate = ctLimitdate;
    }

    public String getCtUnittype() {
        return this.ctUnittype;
    }
    
    public void setCtUnittype(String ctUnittype) {
        this.ctUnittype = ctUnittype;
    }

    public String getCtJobnum() {
        return this.ctJobnum;
    }
    
    public void setCtJobnum(String ctJobnum) {
        this.ctJobnum = ctJobnum;
    }

    public String getCtSelsex() {
        return this.ctSelsex;
    }
    
    public void setCtSelsex(String ctSelsex) {
        this.ctSelsex = ctSelsex;
    }

    public String getCtDigree() {
        return this.ctDigree;
    }
    
    public void setCtDigree(String ctDigree) {
        this.ctDigree = ctDigree;
    }

    public Integer getCtLooknum() {
        return this.ctLooknum;
    }
    
    public void setCtLooknum(Integer ctLooknum) {
        this.ctLooknum = ctLooknum;
    }

    public String getCtIsreg() {
        return this.ctIsreg;
    }
    
    public void setCtIsreg(String ctIsreg) {
        this.ctIsreg = ctIsreg;
    }

    public String getCtEmail() {
        return this.ctEmail;
    }
    
    public void setCtEmail(String ctEmail) {
        this.ctEmail = ctEmail;
    }

    public String getCtContact() {
        return this.ctContact;
    }
    
    public void setCtContact(String ctContact) {
        this.ctContact = ctContact;
    }

    public String getCtPassword() {
        return this.ctPassword;
    }
    
    public void setCtPassword(String ctPassword) {
        this.ctPassword = ctPassword;
    }

    public String getCtIspay() {
        return this.ctIspay;
    }
    
    public void setCtIspay(String ctIspay) {
        this.ctIspay = ctIspay;
    }

    public String getCtIshuiyuan() {
        return this.ctIshuiyuan;
    }
    
    public void setCtIshuiyuan(String ctIshuiyuan) {
        this.ctIshuiyuan = ctIshuiyuan;
    }

    public String getCtCompanyname() {
        return this.ctCompanyname;
    }
    
    public void setCtCompanyname(String ctCompanyname) {
        this.ctCompanyname = ctCompanyname;
    }

    public String getCtJobtime() {
        return this.ctJobtime;
    }
    
    public void setCtJobtime(String ctJobtime) {
        this.ctJobtime = ctJobtime;
    }

    public String getCtMobile() {
        return this.ctMobile;
    }
    
    public void setCtMobile(String ctMobile) {
        this.ctMobile = ctMobile;
    }

    public String getCtQq() {
        return this.ctQq;
    }
    
    public void setCtQq(String ctQq) {
        this.ctQq = ctQq;
    }

    public String getCtPhone() {
        return this.ctPhone;
    }
    
    public void setCtPhone(String ctPhone) {
        this.ctPhone = ctPhone;
    }

    public String getCtUserName() {
        return this.ctUserName;
    }
    
    public void setCtUserName(String ctUserName) {
        this.ctUserName = ctUserName;
    }

    public String getCtIsyz() {
        return this.ctIsyz;
    }
    
    public void setCtIsyz(String ctIsyz) {
        this.ctIsyz = ctIsyz;
    }

	public TypeIntf getType() {
		return type;
	}

	public void setType(TypeIntf type) {
		this.type = type;
	}


}