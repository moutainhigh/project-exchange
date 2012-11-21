package com.throne212.tui5.domain;
// default package

import java.lang.reflect.Field;
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
	
	private Integer priceClass;//1,计件，2单人中标，3多人中标
	private Double rate1;//多人中标，一等奖比例
	private Double rate2;//多人中标，2等奖比例
	private Double rate3;//多人中标，3等奖比例
	private Integer people1;//多人中标，一等奖人数
	private Integer people2;//多人中标，2等奖人数
	private Integer people3;//多人中标，3等奖人数
	
	private Integer wbType;//1新浪，2腾讯
	private Integer wbSend;//发送规则,0,6,12,24
	
	private BigDecimal fs1;//粉丝1
	private BigDecimal fs2;//粉丝2
	private BigDecimal fs3;//粉丝3
	private BigDecimal fs4;//粉丝4
	private BigDecimal fs5;//粉丝5
	private BigDecimal fs6;//粉丝6
	private BigDecimal fs7;//粉丝7
	private BigDecimal fs8;//粉丝8
	private BigDecimal fs9;//粉丝9
	private BigDecimal fs10;//粉丝10
	private BigDecimal fs11;//粉丝11
	private BigDecimal fs12;//粉丝12
	
	private Integer passGaojian;//合格的稿件数量
	private BigDecimal passMoney;//合格的稿件奖金合计
	
	private Integer republish;//重发次数,0,1,2
	
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
	
	public String getpriceClassTxt(){
		if(priceClass == null) 
			return "";
		switch (priceClass) {
		case 1:
			return "计件任务模式";
		case 2:
			return "单人中标任务模式";
		case 3:
			return "多人中标任务模式";
		default:
			break;
		}
		return "";
	}

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

	public Integer getPriceClass() {
		return priceClass;
	}

	public void setPriceClass(Integer priceClass) {
		this.priceClass = priceClass;
	}

	public Double getRate1() {
		return rate1;
	}

	public void setRate1(Double rate1) {
		this.rate1 = rate1;
	}

	public Double getRate2() {
		return rate2;
	}

	public void setRate2(Double rate2) {
		this.rate2 = rate2;
	}

	public Double getRate3() {
		return rate3;
	}

	public void setRate3(Double rate3) {
		this.rate3 = rate3;
	}
	
	public Double getRate(int i){
		try {
			Field f = this.getClass().getDeclaredField("rate" + i);
			if(f != null){
				f.setAccessible(true);
				return (Double) f.get(this);
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Integer getPeople(int i){
		try {
			Field f = this.getClass().getDeclaredField("people" + i);
			if(f != null){
				f.setAccessible(true);
				return (Integer) f.get(this);
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Integer getPeople1() {
		return people1;
	}

	public void setPeople1(Integer people1) {
		this.people1 = people1;
	}

	public Integer getPeople2() {
		return people2;
	}

	public void setPeople2(Integer people2) {
		this.people2 = people2;
	}

	public Integer getPeople3() {
		return people3;
	}

	public void setPeople3(Integer people3) {
		this.people3 = people3;
	}

	public Integer getPassGaojian() {
		return passGaojian;
	}

	public void setPassGaojian(Integer passGaojian) {
		this.passGaojian = passGaojian;
	}

	public Integer getWbType() {
		return wbType;
	}

	public void setWbType(Integer wbType) {
		this.wbType = wbType;
	}

	public Integer getWbSend() {
		return wbSend;
	}

	public void setWbSend(Integer wbSend) {
		this.wbSend = wbSend;
	}

	public BigDecimal getFs1() {
		return fs1;
	}

	public void setFs1(BigDecimal fs1) {
		this.fs1 = fs1;
	}

	public BigDecimal getFs2() {
		return fs2;
	}

	public void setFs2(BigDecimal fs2) {
		this.fs2 = fs2;
	}

	public BigDecimal getFs3() {
		return fs3;
	}

	public void setFs3(BigDecimal fs3) {
		this.fs3 = fs3;
	}

	public BigDecimal getFs4() {
		return fs4;
	}

	public void setFs4(BigDecimal fs4) {
		this.fs4 = fs4;
	}

	public BigDecimal getFs5() {
		return fs5;
	}

	public void setFs5(BigDecimal fs5) {
		this.fs5 = fs5;
	}

	public BigDecimal getFs6() {
		return fs6;
	}

	public void setFs6(BigDecimal fs6) {
		this.fs6 = fs6;
	}

	public BigDecimal getFs7() {
		return fs7;
	}

	public void setFs7(BigDecimal fs7) {
		this.fs7 = fs7;
	}

	public BigDecimal getFs8() {
		return fs8;
	}

	public void setFs8(BigDecimal fs8) {
		this.fs8 = fs8;
	}

	public BigDecimal getFs9() {
		return fs9;
	}

	public void setFs9(BigDecimal fs9) {
		this.fs9 = fs9;
	}

	public BigDecimal getFs10() {
		return fs10;
	}

	public void setFs10(BigDecimal fs10) {
		this.fs10 = fs10;
	}

	public BigDecimal getFs11() {
		return fs11;
	}

	public void setFs11(BigDecimal fs11) {
		this.fs11 = fs11;
	}

	public BigDecimal getFs12() {
		return fs12;
	}

	public void setFs12(BigDecimal fs12) {
		this.fs12 = fs12;
	}
	
	public BigDecimal getFs(int i){
		try {
			Field f = this.getClass().getDeclaredField("fs" + i);
			if(f != null){
				f.setAccessible(true);
				return (BigDecimal) f.get(this);
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String getWbSendTxt(){
		switch (wbSend) {
		case 0:
			return "一个微博只能做一次";
		case 6:
			return "一个微博6小时可以发一条";
		case 12:
			return "一个微博12小时可以发一条";
		case 24:
			return "一个微博24小时可以发一条";
		}
		return "";
	}

	public BigDecimal getPassMoney() {
		return passMoney;
	}

	public void setPassMoney(BigDecimal passMoney) {
		this.passMoney = passMoney;
	}

	public Integer getRepublish() {
		return republish;
	}

	public void setRepublish(Integer republish) {
		this.republish = republish;
	}
}