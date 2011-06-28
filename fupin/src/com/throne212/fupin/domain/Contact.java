package com.throne212.fupin.domain;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

public class Contact extends MyEntity {
	private String owner;//拥有者
	private String orgName;//单位名
	private String duty;//职务
	private String contactName;//联系人姓名
	private String telNo;//电话号码
	private ContactGroup group;//所属组
	
	private String  showTreeName;
	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public ContactGroup getGroup() {
		return group;
	}
	public void setGroup(ContactGroup group) {
		this.group = group;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getShowTreeName() {
		return showTreeName;
	}
	public void setShowTreeName(String showTreeName) {
		this.showTreeName = showTreeName;
	}

	
	 @Override
	    public boolean equals(Object obj) {
		 if (this==obj) {
			 return true;
			
		}
		 if(!(obj instanceof Contact)){
			 
			 return false;
		 }
		 Contact target=(Contact)obj;
		 if (this.getId()!=null&&this.getId()>0) {
			return this.getId().equals(target.getId());
		}
		 if (target.getId()!=null&&target.getId()>0) {
			 return false;
			
		}
		 return EqualsBuilder.reflectionEquals(this, obj);
		 
	    }

	    @Override
	    public int hashCode() {
	    	
	    	if (this.getId()!=null&&this.getId()>0) {
	    		return this.getId().hashCode();
				
			}
	    	return HashCodeBuilder.reflectionHashCode(this);
//	        int hash = 7;
//	        hash = 53 * hash + (this.id != null ? this.id.hashCode() : 0);
//	        
//	        return hash;
	    }
	
}
