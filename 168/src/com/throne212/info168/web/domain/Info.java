package com.throne212.info168.web.domain;

import java.util.Date;

public class Info {

	private Long id;// 主见
	private Area area;// 信息所处位置
	private Category cate;// 类别
	private String title;// 标题，30个汉字以内
	private String content;// 内容，5000个汉字以内
	private String tel;// 联系电话
	private String email;// 邮箱地址
	private String qq;//qq
	private User user;//发布者
	private Date publishDate;//发布时间
	private Boolean isChecked;//是否通过审核
	private Boolean recommend;//热门推荐
	private Boolean isTop;//置顶
	private Date topEndDate;//置顶结束日期
	private String image;//图片地址
	private Date endDate;//失效日期
	private Integer validDay;//有效天数

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Boolean getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(Boolean isChecked) {
		this.isChecked = isChecked;
	}

	public Boolean getRecommend() {
		return recommend;
	}

	public void setRecommend(Boolean recommend) {
		this.recommend = recommend;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Boolean getIsTop() {
		return isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public String getEndDateTimeMill(){
		return endDate == null?"":endDate.getTime()+"";
	}

	public Integer getValidDay() {
		return validDay;
	}

	public void setValidDay(Integer validDay) {
		this.validDay = validDay;
	}

	public Date getTopEndDate() {
		return topEndDate;
	}

	public void setTopEndDate(Date topEndDate) {
		this.topEndDate = topEndDate;
	}

}
