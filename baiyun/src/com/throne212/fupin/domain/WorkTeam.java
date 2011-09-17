package com.throne212.fupin.domain;

import java.util.List;

public class WorkTeam extends User {

	private static final long serialVersionUID = 1L;

	private Area area;// 工作组所在的区，即由哪个区指派的工作组

	private Zhen zhen;// 所对应帮扶的镇
	
	//用于显示，不进行保存
	private List<Cun> cunList;
	
	public String getCunTxt(){
		if(cunList == null || cunList.size() == 0)
			return "";
		StringBuffer sb = new StringBuffer();
		for(Cun c : cunList){
			sb.append(c.getName());
			sb.append(",");
		}
		return sb.toString();
	}
	public String getCunIdTxt(){
		if(cunList == null || cunList.size() == 0)
			return "";
		StringBuffer sb = new StringBuffer();
		for(Cun c : cunList){
			sb.append(c.getId());
			sb.append(",");
		}
		return sb.toString();
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Zhen getZhen() {
		return zhen;
	}

	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}

	public List<Cun> getCunList() {
		return cunList;
	}

	public void setCunList(List<Cun> cunList) {
		this.cunList = cunList;
	}

}
