package com.throne212.tui5.domain;
// default package

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.Util;

/**
 * Task entity. @author Yang Lei
 */

public class Task implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private String shenhe;
	private String attachment1;//上传附件
	private String attachment2;
	private String attachment3;
	private String attachment4;
	private String attachment5;
	private String qq;
	private String tel;
	private BigDecimal money;
	private Integer gaojianMount;//稿件数量
	private BigDecimal gaojianPrice;//稿件单价
	private Integer days;
	//0/null:初始化，1:等待发布中,10:正常已发布状态,2已到期,5已结束
	private Integer status;
	private Short nospider;//1可用，0不可用
	private Timestamp publishDate;
	private Timestamp startDate;
	private Timestamp endDate;
	private Type type;//所属类型
	private User publisher;//发布者
	
	//顶贴的URL
	private String url;
	
	//用户展示
	private List<Gaojian> gjList;
	private Integer gjCount;

	// Constructors

	/** default constructor */
	public Task() {
	}

	// Property accessors

	public String getStatusTxt(){
		if(status == 1){
			return "等待发布";
		}else if(status == 2){
			return "已到期";
		}else if(status == 5){
			return "已结束";
		}else if(status == 10){
			if(System.currentTimeMillis() < endDate.getTime())
				return "进行中";
			else
				return "已到期";
		}
		return "";
	}
	
	public String getLeftHour(){
		String str = "已结束";
		if(endDate != null && Const.TASK_STATUS_PUBLISHED.equals(status)){
			Long leftTime = endDate.getTime() - System.currentTimeMillis();
			return Util.getLeftTimeTxt(leftTime);
		}
		return str;
	}
	
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShenhe() {
		return this.shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	public String getAttachment1() {
		return this.attachment1;
	}

	public void setAttachment1(String attachment1) {
		this.attachment1 = attachment1;
	}

	public String getAttachment2() {
		return this.attachment2;
	}

	public void setAttachment2(String attachment2) {
		this.attachment2 = attachment2;
	}

	public String getAttachment3() {
		return this.attachment3;
	}

	public void setAttachment3(String attachment3) {
		this.attachment3 = attachment3;
	}

	public String getAttachment4() {
		return this.attachment4;
	}

	public void setAttachment4(String attachment4) {
		this.attachment4 = attachment4;
	}

	public String getAttachment5() {
		return this.attachment5;
	}

	public void setAttachment5(String attachment5) {
		this.attachment5 = attachment5;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public BigDecimal getMoney() {
		return this.money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public Integer getGaojianMount() {
		return this.gaojianMount;
	}

	public void setGaojianMount(Integer gaojianMount) {
		this.gaojianMount = gaojianMount;
	}

	public BigDecimal getGaojianPrice() {
		return this.gaojianPrice;
	}

	public void setGaojianPrice(BigDecimal gaojianPrice) {
		this.gaojianPrice = gaojianPrice;
	}

	public Integer getDays() {
		return this.days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Short getNospider() {
		return this.nospider;
	}

	public void setNospider(Short nospider) {
		this.nospider = nospider;
	}

	public Timestamp getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}

	public Timestamp getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public User getPublisher() {
		return publisher;
	}

	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}

	public List<Gaojian> getGjList() {
		return gjList;
	}

	public void setGjList(List<Gaojian> gjList) {
		this.gjList = gjList;
	}

	public Integer getGjCount() {
		return gjCount;
	}

	public void setGjCount(Integer gjCount) {
		this.gjCount = gjCount;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}