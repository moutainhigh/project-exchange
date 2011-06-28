package com.throne212.fupin.domain;

import java.util.List;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

public class ContactGroup extends MyEntity {
	
	private String userName;//拥有者名字
	private String groupName;//分组名称
	private ContactGroup parentGroup;//父组
	private Boolean isLeaf=true;
	
	private String showTreeName;//用于树形展示
	private List<ContactGroup> childs;
	private List<Contact> contactList;
	
	
	public ContactGroup getParentGroup() {
		return parentGroup;
	}
	public void setParentGroup(ContactGroup parentGroup) {
		this.parentGroup = parentGroup;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
//	public List<ContactGroup> getChilds() {
//		return childs;
//	}
//	public void setChilds(List<ContactGroup> childs) {
//		this.childs = childs;
//	}
	public Boolean getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
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
		 if(!(obj instanceof ContactGroup)){
			 
			 return false;
		 }
		 ContactGroup target=(ContactGroup)obj;
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
		public List<ContactGroup> getChilds() {
			return childs;
		}
		public void setChilds(List<ContactGroup> childs) {
			this.childs = childs;
		}
		public List<Contact> getContactList() {
			return contactList;
		}
		public void setContactList(List<Contact> contactList) {
			this.contactList = contactList;
		}


	

}
