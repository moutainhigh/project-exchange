package com.throne212.auto.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.throne212.auto.common.Util;

@Entity
@Table(name = "auto_car")
public class Car extends MyEntity {// ����

	@Column
	private String image;
	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER, targetEntity = Brand.class)
	private Brand brand;
	@Column
	private String fullName;
	@Column
	private double price;
	@Column
	private Date priceDate;
	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER, targetEntity = Sale.class)
	private Sale sale;
	@Column(length=1024)
	private String detail;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getPriceDate() {
		return priceDate;
	}
	public String getPriceDateTxt() {
		if(priceDate == null)
			return "";
		return Util.getDate(priceDate);
	}

	public void setPriceDate(Date priceDate) {
		this.priceDate = priceDate;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
