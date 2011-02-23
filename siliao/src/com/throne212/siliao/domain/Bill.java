package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

//单据
public class Bill extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String orderId;//单据的编号，具有唯一性
	private Integer status;//状态

	private AreaAccount areaAccount;// 管区负责人
	private ManagerAccount manager;// 饲料经理
	private ProviderAccount providerAccount;// 饲料厂负责人
	
	private Farmer farmer;//农户
	private Farm farm;//农场
	private Factory factory;//饲料厂商
	private String size;//型号
	private String model;//规格
	private Double amount;//吨数
	private String applyRemark;//申请备注
	private Date planDate;//计划到料日期
	
	private Boolean shenpiResult;//饲料经理审批结果，true为通过，false为驳回
	private Provider provider;//供应饲料厂
	private String shenpiRemark;//审批意见
	
	private Boolean shenheResult;//审核结果，true为通过，false为驳回
	private String shenheRemark;//审核意见
	private Double priceOnOrder;//开票价格
	private Double agentUnitPrice;//代理单价
	private String translater;//运输人
	private String orderNo;//票号
	private String remark;//备注
	
	private String reason;//票据状态修改原因

	public AreaAccount getAreaAccount() {
		return areaAccount;
	}

	public void setAreaAccount(AreaAccount areaAccount) {
		this.areaAccount = areaAccount;
	}

	public ManagerAccount getManager() {
		return manager;
	}

	public void setManager(ManagerAccount manager) {
		this.manager = manager;
	}

	public ProviderAccount getProviderAccount() {
		return providerAccount;
	}

	public void setProviderAccount(ProviderAccount providerAccount) {
		this.providerAccount = providerAccount;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Farmer getFarmer() {
		return farmer;
	}

	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getApplyRemark() {
		return applyRemark;
	}

	public void setApplyRemark(String applyRemark) {
		this.applyRemark = applyRemark;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public Boolean getShenpiResult() {
		return shenpiResult;
	}

	public void setShenpiResult(Boolean shenpiResult) {
		this.shenpiResult = shenpiResult;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public String getShenpiRemark() {
		return shenpiRemark;
	}

	public void setShenpiRemark(String shenpiRemark) {
		this.shenpiRemark = shenpiRemark;
	}

	public Boolean getShenheResult() {
		return shenheResult;
	}

	public void setShenheResult(Boolean shenheResult) {
		this.shenheResult = shenheResult;
	}

	public String getShenheRemark() {
		return shenheRemark;
	}

	public void setShenheRemark(String shenheRemark) {
		this.shenheRemark = shenheRemark;
	}

	public Double getPriceOnOrder() {
		return priceOnOrder;
	}

	public void setPriceOnOrder(Double priceOnOrder) {
		this.priceOnOrder = priceOnOrder;
	}

	public Double getAgentUnitPrice() {
		return agentUnitPrice;
	}

	public void setAgentUnitPrice(Double agentUnitPrice) {
		this.agentUnitPrice = agentUnitPrice;
	}

	public String getTranslater() {
		return translater;
	}

	public void setTranslater(String translater) {
		this.translater = translater;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
