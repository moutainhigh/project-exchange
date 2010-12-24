package com.throne212.oa.domain.muyingorg;

import java.util.Date;


public class Org {
	
	private Long id;//主键
	private String name;//机构名称
	private String address;//地址
	private String tel;//电话
	private String post;//邮编
	private String style;//所有制形式
	private String type;//机构类别
	private Date date;//发证日期
	private String person;//法人代表
	private Date validDate;//有效日期
	private String no;//登记号
	private String item;//许可项目
	private String fromOrg;//发证机关
	
	
	private Integer year;
	//private 
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
}
