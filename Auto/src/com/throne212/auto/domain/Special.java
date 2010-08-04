package com.throne212.auto.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "auto_sale_special")
public class Special extends MyEntity{//се╩щ
	
	@ManyToOne(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	private Category category;

	@Column
	private String title;
	@Column
	private String content;
	@Column
	private String from;
	@Column
	private String author;
	@Column
	private Date publishDate;
	@Column
	private int type;
	
	
	
}
