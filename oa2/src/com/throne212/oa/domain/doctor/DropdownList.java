package com.throne212.oa.domain.doctor;

//�����������ĸ���
public class DropdownList {
	protected Long id;//����
	protected String name;//����
	protected Integer listorder;//������
	protected String description;//����

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getListorder() {
		return listorder;
	}

	public void setListorder(Integer listorder) {
		this.listorder = listorder;
	}

}
