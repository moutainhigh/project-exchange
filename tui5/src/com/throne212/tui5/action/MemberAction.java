package com.throne212.tui5.action;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

public class MemberAction extends BaseAction {
	
	private BaseBiz baseBiz;
	
	//公共参数
	private int currNav = 1;

	//首页
	public String index() {
		return "member/member";
	}
	
	//发布的任务列表
	public String taskList(){
		
		return "member/task_list";
	}
	
	//发布任务
	private Map<String, List<Type>> typeMap;
	private List<Type> topTypeList;
	private String toptypepinyin;
	private String typepinyin;
	public String publish(){
		currNav = 2;//当前tab下标
		buildTopTypeList();//构建分类类型
		if(!Util.isEmpty(typepinyin)){
			Type t = baseBiz.getEntityByUnique(Type.class, "pinyin", typepinyin);
			if(t != null){
				Type topType = baseBiz.getEntityByUnique(Type.class, "id", t.getParentId());
				toptypepinyin = topType.getPinyin();
			}
		}
		return "member/publish";
	}
	private void buildTopTypeList(){
		typeMap = new TreeMap<String, List<Type>>(new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		topTypeList = baseBiz.getEntitiesByColumn(Type.class, "parentId", null);
		for(Type t : topTypeList){
			List<Type> tList = baseBiz.getEntitiesByColumn(Type.class, "parentId", t.getId());
			t.setChilds(tList);
			typeMap.put(t.getPinyin(), tList);
		}
	}
	
	//资料修改
	private String userName;
	private String userMobile;
	private String userQq;
	private String userSex;
	public String info(){
		return "member/info";
	}
	public String saveInfo(){
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		logger.debug("save username=" + userName);
		user.setUserName(userName);
		user.setUserMobile(userMobile);
		user.setUserQq(userQq);
		user.setUserSex(userSex);
		try {
			baseBiz.saveOrUpdateEntity(user);
			ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
			this.setMsg("保存成功");
			logger.info("save user info succ");
		} catch (Exception e) {
			e.printStackTrace();
			this.setMsg("保存失败，服务器内错误，请稍候再试");
		}
		return info();
	}
	
	//修改密码
	private String oldpwd;
	private String pwd;
	private String pwd2;
	public String pwd(){
		if(!Util.isEmpty(oldpwd) && !Util.isEmpty(pwd) && !Util.isEmpty(pwd2) && pwd.equals(pwd2)){
			oldpwd = oldpwd.trim();
			pwd = pwd.trim();
			pwd2 = pwd2.trim();
			User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
			if(!EncryptUtil.md5Encode(oldpwd).equals(user.getUserPassword())){
				this.setMsg("原密码错误");
				return "member/pwd";
			}
			try {
				user.setUserPassword(EncryptUtil.md5Encode(pwd));
				baseBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
				this.setMsg("保存成功");
				logger.info("save user pwd succ");
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("保存失败，服务器内错误，请稍候再试");
			}
		}
		return "member/pwd";
	}

	public int getCurrNav() {
		return currNav;
	}
	public void setCurrNav(int currNav) {
		this.currNav = currNav;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
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

	
}
