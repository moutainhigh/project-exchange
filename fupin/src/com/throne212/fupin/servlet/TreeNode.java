package com.throne212.fupin.servlet;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {

	private String id;
	private String text;
	private String value;
	private boolean showcheck = true;
	private boolean isexpand = false;
	private int checkstate = 0;
	private boolean hasChildren = false;
	private List<TreeNode> ChildNodes = new ArrayList<TreeNode>();
	private boolean complete = true;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isShowcheck() {
		return showcheck;
	}

	public void setShowcheck(boolean showcheck) {
		this.showcheck = showcheck;
	}

	public boolean isIsexpand() {
		return isexpand;
	}

	public void setIsexpand(boolean isexpand) {
		this.isexpand = isexpand;
	}

	public int isCheckstate() {
		return checkstate;
	}
	
	public int getCheckstate() {
		return checkstate;
	}

	public void setCheckstate(int checkstate) {
		this.checkstate = checkstate;
	}

	public boolean isHasChildren() {
		return hasChildren;
	}

	public void setHasChildren(boolean hasChildren) {
		this.hasChildren = hasChildren;
	}

	public List<TreeNode> getChildNodes() {
		return ChildNodes;
	}

	public void setChildNodes(List<TreeNode> childNodes) {
		ChildNodes = childNodes;
	}

	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}

}
