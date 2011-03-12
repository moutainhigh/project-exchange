package com.throne212.fupin.domain;

public class CuoshiFamily extends Cuoshi {
	private Family family;

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}
	
	public String getShortContent(){
		String shortContent;
		if (this.getContent().length()>16) {
			shortContent=this.getContent().substring(0, 16);
		}else {
			shortContent=this.getContent();
		}
		
		return shortContent;
	}
}