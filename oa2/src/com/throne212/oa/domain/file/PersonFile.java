package com.throne212.oa.domain.file;

import java.util.Date;

//�����ļ�
public class PersonFile {

	private Long id;// ����
	private FileType fileType;// �ļ�����
	private String title;// ����
	private String fileNo;// �ĺ�
	private String org;// ���ĵ�λ
	private Date date;// ����
	private SecretGrade secretGrade;// �ܼ�
	private String mainWords;// �����
	private String desc;// ժҪ
	private String content;// ����
	private String comments;// ��ע

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public FileType getFileType() {
		return fileType;
	}

	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public SecretGrade getSecretGrade() {
		return secretGrade;
	}

	public void setSecretGrade(SecretGrade secretGrade) {
		this.secretGrade = secretGrade;
	}

	public String getMainWords() {
		return mainWords;
	}

	public void setMainWords(String mainWords) {
		this.mainWords = mainWords;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
