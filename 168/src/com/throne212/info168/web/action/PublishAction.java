package com.throne212.info168.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public class PublishAction extends BaseAction {

	private UserBiz userBiz;
	private CommonBiz commonBiz;

	private Long param;

	// 进去发布信息步骤
	private Map<String, List<Area>> areaMap;

	public String index() {
		List<Object[]> list = new ArrayList<Object[]>(4);
		for (int i = 0; i < 4; i++) {
			list.add(null);
		}
		ActionContext.getContext().getSession().put("pub_list", list);
		// 获取城市数据
		areaMap = commonBiz.getAreaMap();
		return "city";
	}

	// 选取城市
	private List<Category> cateList;

	public String city() {
		logger.debug("param=[" + param + "]");
		Area city = userBiz.getEntityById(Area.class, param);
		if (city != null) {
			List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
			Object[] arr = new Object[] { param, city.getName() };
			list.set(0, arr);
		}
		// 获取一级目录数据
		cateList = commonBiz.getCate1();
		return "cate1";
	}

	// 选取一级目录
	public String cate1() {
		logger.debug("param=[" + param + "]");
		Category cate1 = userBiz.getEntityById(Category.class, param);
		if (cate1 != null) {
			List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
			Object[] arr = new Object[] { param, cate1.getName() };
			list.set(1, arr);
		}
		// 获取二级目录数据
		cateList = commonBiz.getCate2(param);
		return "cate2";
	}

	// 选取二级目录
	private List<Area> areaList;

	public String cate2() {
		logger.debug("param=[" + param + "]");
		Category cate2 = userBiz.getEntityById(Category.class, param);
		if (cate2 != null) {
			List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
			Object[] arr = new Object[] { param, cate2.getName() };
			list.set(2, arr);
		}
		// 获取区/县数据
		List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
		Long cityId = (Long) list.get(0)[0];
		areaList = commonBiz.get2ndArea(cityId);
		return "area";
	}

	// 选取地区
	public String area() {
		logger.debug("param=[" + param + "]");
		List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
		if (param == null || param == 0) {// 跳过地区选择
			list.set(3, null);
		} else {
			Area area = userBiz.getEntityById(Area.class, param);
			if (area != null) {
				Object[] arr = new Object[] { param, area.getName() };
				list.set(3, arr);
			}
		}
		return "form";
	}

	// 提交表单
	private Info info;

	public String publish() {
		List<Object[]> list = (List<Object[]>) ActionContext.getContext().getSession().get("pub_list");
		// 数据校验
		if (info == null || list == null) {
			this.setMsg("非法输入，请检查");
			return this.index();
		}
		if (Util.isEmpty(info.getTitle())) {
			this.setMsg("请输入信息标题");
			return "form";
		}
		if (Util.isEmpty(info.getTitle())) {
			this.setMsg("请输入信息内容");
			return "form";
		}
		if (Util.isEmpty(info.getTel()) && Util.isEmpty(info.getEmail())) {
			this.setMsg("请输入联系方式");
			return "form";
		}
		if (info.getTitle().length() > 30) {
			this.setMsg("标题字数过长");
			return "form";
		}
		if (info.getContent().length() > 3000) {
			this.setMsg("内容字数过长，请控制在3000个汉字以内");
			return "form";
		}
		if (!Util.isEmpty(info.getTel()) && info.getTel().length() > 50) {
			this.setMsg("电话号码过长");
			return "form";
		}
		if (!Util.isEmpty(info.getQq()) && info.getQq().length() > 15) {
			this.setMsg("QQ号码过长");
			return "form";
		}
		if (!Util.isEmpty(info.getEmail()) && !info.getEmail().matches("(\\S)+[@]{1}(\\S)+[.]{1}(\\w)+")) {
			this.setMsg("邮件格式错误");
			return "form";
		}
		// 保存用户
		info.setUser((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
		// 地区数据
		if (list.get(3) != null) {
			Area area = userBiz.getEntityById(Area.class, (Long) list.get(3)[0]);// 县
			info.setArea(area);
		} else if (list.get(0) != null) {
			Area area = userBiz.getEntityById(Area.class, (Long) list.get(0)[0]);// 市
			info.setArea(area);
		}

		// 设置栏目
		if (list.get(2) != null) {
			Category cate = userBiz.getEntityById(Category.class, (Long) list.get(2)[0]);// 二级栏目
			info.setCate(cate);
		} else if (list.get(1) != null) {
			Category cate = userBiz.getEntityById(Category.class, (Long) list.get(1)[0]);// 一级
			info.setCate(cate);
		}
		// 图片
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			info.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
		}

		if (userBiz.publishInfo(info)) {
			ActionContext.getContext().getSession().remove("pub_list");
			return "success";
		} else {
			this.setMsg("信息内容错误，请检查或联系管理员");
			return "fail";
		}
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public Long getParam() {
		return param;
	}

	public void setParam(Long param) {
		this.param = param;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Map<String, List<Area>> getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(Map<String, List<Area>> areaMap) {
		this.areaMap = areaMap;
	}

	public List<Category> getCateList() {
		return cateList;
	}

	public void setCateList(List<Category> cateList) {
		this.cateList = cateList;
	}

	public List<Area> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<Area> areaList) {
		this.areaList = areaList;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

}
