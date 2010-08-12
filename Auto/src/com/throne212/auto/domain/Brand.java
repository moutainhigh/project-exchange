package com.throne212.auto.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "auto_car_brand")
public class Brand extends MyEntity {// Æû³µÆ·ÅÆ

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER, targetEntity = Brand.class)
	private Brand parentBrand;

	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, mappedBy = "parentBrand", targetEntity = Brand.class)
	@OrderBy("orderNum")
	private List<Brand> childBrands = new ArrayList<Brand>();

	public Brand getParentBrand() {
		return parentBrand;
	}

	public void setParentBrand(Brand parentBrand) {
		this.parentBrand = parentBrand;
	}

	public List<Brand> getChildBrands() {
		return childBrands;
	}

	public void setChildBrands(List<Brand> childBrands) {
		this.childBrands = childBrands;
	}

}
