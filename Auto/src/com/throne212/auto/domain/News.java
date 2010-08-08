package com.throne212.auto.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.throne212.auto.common.WebConstants;

@Entity
@Table(name = "auto_news")
public class News extends MyEntity{//��Ϣ
	
	@ManyToOne(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	protected Category category;

	@Column
	protected String title;
	@Column
	protected String content;
	@Column(name="fromWhere")
	protected String from;
	@Column
	protected String author;
	@Column
	protected Date publishDate;
	@Column
	protected int type;
	@Column
	protected Boolean recommend;//�Ƽ�
	@Column
	protected Boolean passed;//ͨ�����
	@Column
	protected String seoTitle;
	@Column
	protected String seoDesc;
	@Column
	protected long click;//������
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
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
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Boolean getRecommend() {
		return recommend;
	}
	public void setRecommend(Boolean recommend) {
		this.recommend = recommend;
	}
	public Boolean getPassed() {
		return passed;
	}
	public void setPassed(Boolean passed) {
		this.passed = passed;
	}
	public String getSeoTitle() {
		return seoTitle;
	}
	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}
	public String getSeoDesc() {
		return seoDesc;
	}
	public void setSeoDesc(String seoDesc) {
		this.seoDesc = seoDesc;
	}
	public long getClick() {
		return click;
	}
	public void setClick(long click) {
		this.click = click;
	}
	public String getTypeText() {
		switch (type) {
		case WebConstants.NEWS_NEWS:
			return "����";
		case WebConstants.NEWS_JINGJI_XINDE:
			return "�����ͳ������ĵ�";
		case WebConstants.NEWS_ZHONGJI_XINDE:
			return "���ͳ������ĵ�";
		case WebConstants.NEWS_CEPING:
			return "רҵ����";
		case WebConstants.NEWS_BAOXIAN:
			return "��������";
		case WebConstants.NEWS_BAOYANG:
			return "ά�ޱ���";
		case WebConstants.NEWS_CHENGBEN:
			return "�����ɱ�";
		case WebConstants.NEWS_ZHUANGSHI:
			return "����װ��";
		case WebConstants.NEWS_BEIJING:
			return "��������";
		default:
			break;
		}
		return "";
	}
	
}
