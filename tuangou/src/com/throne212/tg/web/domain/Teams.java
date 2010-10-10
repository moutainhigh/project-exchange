package com.throne212.tg.web.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Teams entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teams")
public class Teams implements java.io.Serializable {

	// Fields

	private Integer id;
	private String cityName;
	private String siteName;
	private String title;
	private String url;
	private Float teamPrice;
	private Float marketPrice;
	private Integer nowNumber;
	private String image;
	private Integer leftDay;
	private Integer leftHour;
	private Integer leftMin;
	private Integer leftSec;
	private Date createTime;

	// Constructors

	/** default constructor */
	public Teams() {
	}

	/** full constructor */
	public Teams(String cityName, String siteName, String title, String url, Float teamPrice, Float marketPrice, Integer nowNumber, String image, Integer leftDay, Integer leftHour, Integer leftMin,
			Integer leftSec, Date createTime) {
		this.cityName = cityName;
		this.siteName = siteName;
		this.title = title;
		this.url = url;
		this.teamPrice = teamPrice;
		this.marketPrice = marketPrice;
		this.nowNumber = nowNumber;
		this.image = image;
		this.leftDay = leftDay;
		this.leftHour = leftHour;
		this.leftMin = leftMin;
		this.leftSec = leftSec;
		this.createTime = createTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "city_name", length = 50)
	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Column(name = "site_name", length = 16)
	public String getSiteName() {
		return this.siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	@Column(name = "title", length = 256)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "url", length = 128)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "team_price", precision = 10)
	public Float getTeamPrice() {
		return this.teamPrice;
	}

	public void setTeamPrice(Float teamPrice) {
		this.teamPrice = teamPrice;
	}

	@Column(name = "market_price", precision = 10)
	public Float getMarketPrice() {
		return this.marketPrice;
	}

	public void setMarketPrice(Float marketPrice) {
		this.marketPrice = marketPrice;
	}

	@Column(name = "now_number")
	public Integer getNowNumber() {
		return this.nowNumber;
	}

	public void setNowNumber(Integer nowNumber) {
		this.nowNumber = nowNumber;
	}

	@Column(name = "image", length = 128)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "left_day")
	public Integer getLeftDay() {
		return this.leftDay;
	}

	public void setLeftDay(Integer leftDay) {
		this.leftDay = leftDay;
	}

	@Column(name = "left_hour")
	public Integer getLeftHour() {
		return this.leftHour;
	}

	public void setLeftHour(Integer leftHour) {
		this.leftHour = leftHour;
	}

	@Column(name = "left_min")
	public Integer getLeftMin() {
		return this.leftMin;
	}

	public void setLeftMin(Integer leftMin) {
		this.leftMin = leftMin;
	}

	@Column(name = "left_sec")
	public Integer getLeftSec() {
		return this.leftSec;
	}

	public void setLeftSec(Integer leftSec) {
		this.leftSec = leftSec;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}