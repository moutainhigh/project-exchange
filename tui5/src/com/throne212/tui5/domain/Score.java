package com.throne212.tui5.domain;

import java.util.Date;

//���ּ�¼
public class Score {

	private Long id;
	private String content;//���ݣ�ԭ��
	private String comment;//ע��
	private Date time;
	private Integer type;// 1,�ӻ��֣��ۻ���
	private User user;//�û�
	private int mount;//���

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getMount() {
		return mount;
	}

	public void setMount(int mount) {
		this.mount = mount;
	}

}
