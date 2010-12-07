package com.throne212.tg.web.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Teams entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tg_site")
public class Site implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	@Column(name = "name", length = 50)
	private String name;
	@Column(name = "tel", length = 50)
	private String tel;
	@Column(name = "qq", length = 50)
	private String qq;
	@Column(name = "url")
	private String url;
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER, targetEntity = SiteType.class)
	private SiteType siteType;
	@Column(name = "contact")
	private String contact;
	@Column(name = "list_order")
	private String listOrder;
	@Column(name = "has_link")
	private Boolean hasLink;//是否已经交换链接
	

	// Constructors

	/** default constructor */
	public Site() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public SiteType getSiteType() {
		return siteType;
	}


	public void setSiteType(SiteType siteType) {
		this.siteType = siteType;
	}


	public String getContact() {
		return contact;
	}


	public void setContact(String contact) {
		this.contact = contact;
	}


	public String getListOrder() {
		return listOrder;
	}


	public void setListOrder(String listOrder) {
		this.listOrder = listOrder;
	}


	public Boolean getHasLink() {
		return hasLink;
	}


	public void setHasLink(Boolean hasLink) {
		this.hasLink = hasLink;
	}

	

}
