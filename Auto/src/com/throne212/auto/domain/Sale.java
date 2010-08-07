package com.throne212.auto.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "auto_sales")
public class Sale extends User {// 4sµê

	@Column
	protected String fullName;
	@Column
	protected Date lastLogin;
	@Column
	protected String lastIp;
	@Column
	protected Date lastChgpwd;
	@Column
	protected Boolean isLocked;
	@Column
	protected String email;
	@Column
	protected String tel;
	@Column
	protected String address;
	@Column
	protected String qq;
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, mappedBy = "sale", targetEntity = Car.class)
	private Set<Car> cars = new HashSet<Car>();
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, mappedBy = "sale", targetEntity = Car.class)
	private Set<Special> specials = new HashSet<Special>();

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public Date getLastChgpwd() {
		return lastChgpwd;
	}

	public void setLastChgpwd(Date lastChgpwd) {
		this.lastChgpwd = lastChgpwd;
	}

	public Boolean getIsLocked() {
		return isLocked;
	}

	public void setIsLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Set<Car> getCars() {
		return cars;
	}

	public void setCars(Set<Car> cars) {
		this.cars = cars;
	}

	public Set<Special> getSpecials() {
		return specials;
	}

	public void setSpecials(Set<Special> specials) {
		this.specials = specials;
	}

}
