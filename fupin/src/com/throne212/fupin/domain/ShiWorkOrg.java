package com.throne212.fupin.domain;

public class ShiWorkOrg extends User {

	private static final long serialVersionUID = 1L;

	private Shi shi;
	private Zhen zhen;//对口的镇
	

	public Shi getShi() {
		return shi;
	}

	public void setShi(Shi shi) {
		this.shi = shi;
	}

	public Zhen getZhen() {
		return zhen;
	}

	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}


	
	
}
