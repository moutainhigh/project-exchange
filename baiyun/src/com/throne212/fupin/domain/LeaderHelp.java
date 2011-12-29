package com.throne212.fupin.domain;

import java.util.Date;

import com.throne212.fupin.common.Util;

//干部所帮扶的贫困户映射中间表，通过这个映射找到干部帮扶的多个贫困户
public class LeaderHelp extends MyEntity{
	
	private Leader leader;
	private Family family;
	private Date startDate;
	
	public Leader getLeader() {
		return leader;
	}
	public void setLeader(Leader leader) {
		this.leader = leader;
	}
	public Family getFamily() {
		return family;
	}
	public void setFamily(Family family) {
		this.family = family;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getStartDateTxt() {
		if(startDate != null){
			return Util.getDate(startDate);
		}
		return null;
	}
}
