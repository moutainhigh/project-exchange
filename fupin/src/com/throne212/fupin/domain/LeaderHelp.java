package com.throne212.fupin.domain;

//干部所帮扶的贫困户映射中间表，通过这个映射找到干部帮扶的多个贫困户
public class LeaderHelp extends MyEntity{
	
	private Leader leader;
	private Family family;
	
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
}
