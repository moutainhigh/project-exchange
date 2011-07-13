package com.throne212.fupin.domain;

import java.io.Serializable;

//用户的抽象类
public class User extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private String loginName;// 登录名
	private String password;// 密码

	private String remark;
	
//	// 帮扶责任人信息
//	private String name;// 名称
//	private String tel;// 电话
//	private String email;// 邮箱
	
	public String getRoleName(){
		if(this instanceof Admin){
			return "超级管理员";
		}else if(this instanceof Org){
			return ((Org)this).getOrgName()+"•单位管理员";
		}else if(this instanceof ShiWorkOrg){
			return ((ShiWorkOrg)this).getShi().getName()+"扶贫办•市级管理员";
		}else if(this instanceof AreaWorkOrg){
			return ((AreaWorkOrg)this).getArea().getName()+"扶贫工作队•区县级管理员";
		}else if(this instanceof ZhenWorkOrg){
			return ((ZhenWorkOrg)this).getZhen().getName()+"扶贫工作组•镇级管理员";
		}else if(this instanceof WorkTeam){
			WorkTeam team = ((WorkTeam)this);
			return team.getArea().getName()+"扶贫工作组•对应帮扶"+team.getZhen().getName();
		}
		return null;
	}
	
	public String getOrgName(){
		if(this instanceof ShiWorkOrg){
			return ((ShiWorkOrg)this).getShi().getName()+"扶贫办";
		}else if(this instanceof AreaWorkOrg){
			return ((AreaWorkOrg)this).getArea().getName()+"扶贫工作队";
		}else if(this instanceof ZhenWorkOrg){
			return ((ZhenWorkOrg)this).getZhen().getName()+"扶贫工作组";
		}else if(this instanceof WorkTeam){
			WorkTeam team = ((WorkTeam)this);
			return team.getArea().getName()+"扶贫工作组•对应帮扶"+team.getZhen().getName();
		}
		return null;
	}
	
	public String getRoleType(){
		if(this instanceof Admin){
			return "超级管理员";
		}else if(this instanceof Org){
			return "帮扶单位管理员";
		}else if(this instanceof ShiWorkOrg){
			return "市级管理员";
		}else if(this instanceof AreaWorkOrg){
			return "县级管理员";
		}else if(this instanceof ZhenWorkOrg){
			return "镇级管理员";
		}else if(this instanceof WorkTeam){
			return "扶贫工作组";
		}
		return null;
	}
	
	public String getIsDiv(){
		if(this instanceof AreaWorkOrg){
			return ((AreaWorkOrg)this).getIsDiv();
		}else if(this instanceof Org){
			Org org = ((Org)this);
			if(org.getArea()!=null && org.getArea().getName().contains("白云区")){
				return "Y";
			}
		}
		return null;
	}
	
	
	public String getLoginNameTxt() {
		if(this instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) this;
			if("Y".equals(a.getIsWorkGroup())){
				return a.getLoginName2();
			}
		}
		return loginName;
	}
	
	public boolean getIs206() {
		if(this!=null && this instanceof Org){
			Org o = (Org) this;
			if(o.getCun()!=null){
				if("温泉镇".equals(o.getCun().getZhen().getName()) ||
						"吕田镇".equals(o.getCun().getZhen().getName()) ||
						"良口镇".equals(o.getCun().getZhen().getName()) ||
						"鳌头镇".equals(o.getCun().getZhen().getName()) ||
						"小楼镇".equals(o.getCun().getZhen().getName()) ||
						"正果镇".equals(o.getCun().getZhen().getName()) ||
						"派潭镇".equals(o.getCun().getZhen().getName()) ||
						"流溪河林场".equals(o.getCun().getZhen().getName()) ||
						"梯面镇".equals(o.getCun().getZhen().getName())){
					return true;
				}
			}
		}
		return false;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	

}
