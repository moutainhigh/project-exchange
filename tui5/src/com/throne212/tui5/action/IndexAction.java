package com.throne212.tui5.action;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;

public class IndexAction extends BaseAction {
	
	private BaseBiz baseBiz;
	private TaskBiz taskBiz;
	
	private Map<String, List<Type>> typeMap;
	private List<Type> topTypeList;
	private String toptypepinyin;
	private String typepinyin;

	private List<Task> topTasks;
	
	private String allianceUserId;
	
	public String execute() {
		buildTopTypeList();// 构建分类类型
		//最新的任务列表
		topTasks = taskBiz.getTaskTop(30, Const.TASK_STATUS_PUBLISHED);
		//判断是否为推客推荐过来的用户
		if(!Util.isEmpty(allianceUserId)){
			ActionContext.getContext().getSession().put(Const.SESS_ALLIANCE_USER_ID, allianceUserId);
		}
		return "index";
	}
	
	private void buildTopTypeList() {
		typeMap = new TreeMap<String, List<Type>>(new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		topTypeList = baseBiz.getEntitiesByColumn(Type.class, "parentId", null);
		for (Type t : topTypeList) {
			List<Type> tList = baseBiz.getEntitiesByColumn(Type.class, "parentId", t.getId());
			t.setChilds(tList);
			typeMap.put(t.getPinyin(), tList);
		}
	}

	public Map<String, List<Type>> getTypeMap() {
		return typeMap;
	}

	public void setTypeMap(Map<String, List<Type>> typeMap) {
		this.typeMap = typeMap;
	}

	public List<Type> getTopTypeList() {
		return topTypeList;
	}

	public void setTopTypeList(List<Type> topTypeList) {
		this.topTypeList = topTypeList;
	}

	public String getToptypepinyin() {
		return toptypepinyin;
	}

	public void setToptypepinyin(String toptypepinyin) {
		this.toptypepinyin = toptypepinyin;
	}

	public String getTypepinyin() {
		return typepinyin;
	}

	public void setTypepinyin(String typepinyin) {
		this.typepinyin = typepinyin;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public TaskBiz getTaskBiz() {
		return taskBiz;
	}

	public void setTaskBiz(TaskBiz taskBiz) {
		this.taskBiz = taskBiz;
	}

	public List<Task> getTopTasks() {
		return topTasks;
	}

	public void setTopTasks(List<Task> topTasks) {
		this.topTasks = topTasks;
	}

	public String getAllianceUserId() {
		return allianceUserId;
	}

	public void setAllianceUserId(String allianceUserId) {
		this.allianceUserId = allianceUserId;
	}
	
}