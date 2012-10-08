package com.throne212.tui5.action;

public class MemberAction extends BaseAction {

	public String index() {
		return "member/member";
	}
	
	public String taskList(){
		
		return "member/task_list";
	}
	
	public String publish(){
		
		return "member/publish";
	}
	
}
