package com.throne212.tg.web.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Teams entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tg_teams")
public class Teams implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	@Column(name = "city_name", length = 50)
	private String cityName;
	@Column(name = "site_name", length = 16)
	private String siteName;
	@Column(name = "title", length = 256)
	private String title;
	@Column(name = "url", length = 128)
	private String url;
	@Column(name = "team_price", precision = 10)
	private Float teamPrice;
	@Column(name = "market_price", precision = 10)
	private Float marketPrice;
	@Column(name = "now_number")
	private Integer nowNumber;
	@Column(name = "image", length = 128)
	private String image;
	@Column(name = "left_day")
	private Integer leftDay;
	@Column(name = "left_hour")
	private Integer leftHour;
	@Column(name = "left_min")
	private Integer leftMin;
	@Column(name = "left_sec")
	private Integer leftSec;
	@Temporal(TemporalType.DATE)
	@Column(name = "create_time", length = 0)
	private Date createTime = new Date();
	@Column(name = "is_top")
	private Boolean isTop;
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER, targetEntity = TeamCategory.class)
	private TeamCategory cate;
	@Column(name = "summary")
	private String summary;

	// Constructors

	/** default constructor */
	public Teams() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	
	public String getSiteName() {
		return this.siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Float getTeamPrice() {
		return this.teamPrice;
	}

	public void setTeamPrice(Float teamPrice) {
		this.teamPrice = teamPrice;
	}

	public Float getMarketPrice() {
		return this.marketPrice;
	}

	public void setMarketPrice(Float marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Integer getNowNumber() {
		return this.nowNumber;
	}

	public void setNowNumber(Integer nowNumber) {
		this.nowNumber = nowNumber;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getLeftDay() {
		return this.leftDay;
	}

	public void setLeftDay(Integer leftDay) {
		this.leftDay = leftDay;
	}

	public Integer getLeftHour() {
		return this.leftHour;
	}

	public void setLeftHour(Integer leftHour) {
		this.leftHour = leftHour;
	}

	public Integer getLeftMin() {
		return this.leftMin;
	}

	public void setLeftMin(Integer leftMin) {
		this.leftMin = leftMin;
	}

	public Integer getLeftSec() {
		return this.leftSec;
	}

	public void setLeftSec(Integer leftSec) {
		this.leftSec = leftSec;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Boolean getIsTop() {
		return isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	public TeamCategory getCate() {
		return cate;
	}

	public void setCate(TeamCategory cate) {
		this.cate = cate;
	}
	
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public Date getEndTime(){
		long time = createTime.getTime();
		if(leftDay!=null){
			time += leftDay*24*60*60*1000;
		}
		if(leftHour!=null){
			time += leftHour*60*60*1000;
		}
		if(leftMin!=null){
			time += leftMin*60*1000;
		}
		if(leftSec!=null){
			time += leftSec*1000;
		}
		return new Date(time);
	}

}
