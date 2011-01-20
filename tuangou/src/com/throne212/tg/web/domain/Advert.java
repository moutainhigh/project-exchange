package com.throne212.tg.web.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;



@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("advert")
public class Advert extends Component {
	public static String componentName = "网站广告";
	@Column(name = "title")
	private String title;

	@Column(name = "img")
	private String img;
	@Column(name = "url")
	private String url;
	@Column(name = "words")
	private String words;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}

	
}
