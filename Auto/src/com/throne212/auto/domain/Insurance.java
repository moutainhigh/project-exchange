package com.throne212.auto.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "auto_insurance")
public class Insurance extends MyEntity{//±£ÏÕÍÆ¼ö
	
	@Column
	private String tel;
	@Column(length=Short.MAX_VALUE)
	private String content;
	@Column
	private String image;
	@Column
	protected Boolean recommend;//ÍÆ¼ö
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Boolean getRecommend() {
		return recommend;
	}
	public void setRecommend(Boolean recommend) {
		this.recommend = recommend;
	}
	
}
