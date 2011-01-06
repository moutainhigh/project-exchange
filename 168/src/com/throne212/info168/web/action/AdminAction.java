package com.throne212.info168.web.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.ValueStack;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.EncryptUtil;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.HotCitySetting;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.KeyWordSetting;
import com.throne212.info168.web.domain.LinkSetting;
import com.throne212.info168.web.domain.Setting;
import com.throne212.info168.web.domain.TopPriceSetting;
import com.throne212.info168.web.domain.User;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;

public class AdminAction extends BaseAction {

	private UserBiz userBiz;
	private InfoBiz infoBiz;
	private CommonBiz commonBiz;

	public String index() {
		return "index";
	}

	// 修改密码
	private String oldpassword;
	private String newpassword;
	private String renewpassword;

	public String changePwd() {
		if (Util.isEmpty(oldpassword) || Util.isEmpty(newpassword) || Util.isEmpty(renewpassword)) {
			this.setMsg("请完整输入所有密码输入框");
		} else if (newpassword.length() < 6 || renewpassword.length() < 6) {
			this.setMsg("密码长度不小于6");
		} else if (!newpassword.equals(renewpassword)) {
			this.setMsg("两次新密码输入不一致");
		} else {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (!oldpassword.equals(user.getPassword()) && !EncryptUtil.md5Encode(oldpassword).equals(user.getPassword())) {
				this.setMsg("原密码错误");
			} else {
				user.setPassword(EncryptUtil.md5Encode(newpassword));
				userBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
				this.setMsg("密码修改成功");
			}
		}
		return "password";
	}

	// 信息列表
	private PageBean pageBean;
	private Integer page;

	public String infoList() {
		if (page == null || page < 1)
			page = 1;
		pageBean = infoBiz.getAllInfo(page);
		return "info_list";
	}

	public String unchckedinfoList() {
		if (page == null || page < 1)
			page = 1;
		pageBean = infoBiz.getAllUncheckInfo(page);
		return "info_list";
	}

	public String passInfoCheck() {
		Info info = infoBiz.getEntityById(Info.class, infoId);
		info.setIsChecked(true);
		infoBiz.saveOrUpdateEntity(info);
		this.setMsg("信息审核通过");
		return infoList();
	}

	public String recommend() {
		Info info = infoBiz.getEntityById(Info.class, infoId);
		info.setRecommend(true);
		infoBiz.saveOrUpdateEntity(info);
		this.setMsg("信息热门推荐成功");
		return infoList();
	}

	public String topInfo() {
		Info info = infoBiz.getEntityById(Info.class, infoId);
		info.setIsTop(true);
		infoBiz.saveOrUpdateEntity(info);
		this.setMsg("信息置顶成功");
		return infoList();
	}

	public String editInfo() {
		if (info != null && info.getId() != null) {
			info = infoBiz.modifyInfo(info);
			this.setMsg("信息修改成功");
		} else if (infoId != null) {
			info = infoBiz.getEntityById(Info.class, infoId);
		}
		return "info_edit";
	}

	// 删除信息
	private String infoListFrom;
	private Long infoId;

	public String deleteInfo() {
		if (infoId != null) {
			infoBiz.deleteEntity(Info.class, infoId);
			this.setMsg("信息删除成功");
		}
		return infoList();
	}

	// 批量操作
	public String batchDeleteInfo() {
		String[] infoIds = (String[]) ActionContext.getContext().getParameters().get("infoIds");
		if (infoIds != null && infoIds.length > 0) {
			for (String idStr : infoIds) {
				infoBiz.deleteEntity(Info.class, Long.parseLong(idStr));
			}
			this.setMsg("批量删除信息成功");
		}
		return infoList();
	}

	public String batchPassInfo() {
		String[] infoIds = (String[]) ActionContext.getContext().getParameters().get("infoIds");
		if (infoIds != null && infoIds.length > 0) {
			for (String idStr : infoIds) {
				Info info = infoBiz.getEntityById(Info.class, Long.parseLong(idStr));
				info.setIsChecked(true);
				infoBiz.saveOrUpdateEntity(info);
			}
			this.setMsg("批量通过信息审核成功");
		}
		return infoList();
	}

	// ******************系统设置********************//
	// 热门城市列表
	private List<Setting> hotCities;

	public String hotCity() {
		hotCities = commonBiz.getSetting(HotCitySetting.class);
		return "hot_city";
	}

	private Long cityId;

	public String addHotCity() {
		if (cityId != null) {
			Area city = commonBiz.getEntityById(Area.class, cityId);
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			for (Setting setting : hotCities) {
				HotCitySetting hotCity = (HotCitySetting) setting;
				if (hotCity.getName().equals(city.getName()) && hotCity.getPinyin().equals(city.getPinyin())) {
					this.setMsg("该城市已经是热门城市了");
					return hotCity();
				}
			}
			HotCitySetting newHot = new HotCitySetting();
			newHot.setName(city.getName());
			newHot.setPinyin(city.getPinyin());
			newHot.setDate(new Date());
			newHot.setEntityId(city.getId());
			commonBiz.saveOrUpdateEntity(newHot);
			this.setMsg("热门城市添加成功");

			// 更新缓存
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.HOT_CITIES, hotCities);
		}
		return hotCity();
	}

	public String removeHotCity() {
		if (cityId != null) {
			commonBiz.deleteEntity(HotCitySetting.class, cityId);
			this.setMsg("热门城市移除成功");
			// 更新缓存
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.HOT_CITIES, hotCities);
		}
		return hotCity();
	}

	// 网站配置
	private String title;
	private String keywords;
	private String desc;

	public String siteSetting() {
		if (!Util.isEmpty(title)) {
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path + File.separator + "site.properties";
			Writer writer = null;
			try {
				Properties props = new Properties();
				props.put("site_title", title);
				props.put("site_desc", desc);
				props.put("site_keywords", keywords);
				writer = new PrintWriter(new FileOutputStream(path));
				props.store(writer, null);
				ActionContext.getContext().getApplication().put(WebConstants.APP_TITLE, props.get("site_title"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_DESC, props.get("site_desc"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_KEY_WORDS, props.get("site_keywords"));
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException ex) {
				ex.printStackTrace();
			} finally {
				if (writer != null) {
					try {
						writer.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		}
		return "site_setting";
	}

	private String key;

	// 用户列表
	public String userList() {
		if (page == null || page < 1)
			page = 1;
		if (Util.isEmpty(key))
			pageBean = userBiz.getAllUsers(page);
		else {
			logger.info("搜索用户，key=" + key);
			pageBean = userBiz.getAllUsers(page, key);
		}
		return "user_list";
	}

	// 编辑用户
	private User user;

	public String editUser() {
		if (user != null && !Util.isEmpty(user.getLoginName())) {// 保存数据
			infoBiz.saveOrUpdateEntity(user);
			this.setMsg("用户资料保存成功");
			return "user_edit";
		} else if (user != null && Util.isEmpty(user.getLoginName())) {// 展示用户资料
			user = userBiz.getEntityById(User.class, user.getId());
			return "user_edit";
		}
		return userList();
	}

	// 用户的信息列表
	public String userInfoList() {
		if (page == null || page < 1)
			page = 1;
		user = userBiz.getEntityById(User.class, user.getId());
		pageBean = userBiz.getInfosByUser(page, user);
		return "user_info_list";
	}

	// 友情链接
	private List<Setting> linkList;

	public String link() {
		linkList = commonBiz.getSetting(LinkSetting.class);
		return "link";
	}

	private String linkName;
	private String linkUrl;

	public String addLink() {
		if (!Util.isEmpty(linkName) && !Util.isEmpty(linkUrl)) {
			LinkSetting link = new LinkSetting();
			link.setName(linkName);
			link.setUrl(linkUrl);
			commonBiz.saveOrUpdateEntity(link);
			this.setMsg("友情链接添加成功:" + linkName);
			logger.info("友情链接添加成功:" + linkName);
			// 更新缓存
			linkList = commonBiz.getSetting(LinkSetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.FREIND_LINKS, linkList);
		}
		return link();
	}

	private Long linkId;

	public String removeLink() {
		if (linkId != null) {
			commonBiz.deleteEntity(LinkSetting.class, linkId);
			this.setMsg("友情链接移除成功");
			// 更新缓存
			linkList = commonBiz.getSetting(LinkSetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.FREIND_LINKS, linkList);
		}
		return link();
	}

	private FreemarkerManager freemarkerManager;

	@Inject
	public void setFreemarkerManager(FreemarkerManager mgr) {
		System.out.println("自动调用设置freemarker管理器...");
		this.freemarkerManager = mgr;
	}

	private Info info;
	private List<Info> relateInfos;

	// 生成HTML
	private Long startId;
	private Long endId;

	public String generateHtml() {
		if (startId != null && endId != null) {
			logger.info("批量生成HTML，id范围是：" + startId + "-" + endId);
			// 开始生成
			long sum = 0;
			for (long id = startId; id <= endId; id++) {
				try {
					info = infoBiz.getEntityById(Info.class, id);
					if (info == null)
						continue;
					relateInfos = infoBiz.getRelateInfos(info);
					// 生成静态页面的的模板类
					Configuration configuration = freemarkerManager.getConfiguration(ServletActionContext.getServletContext());
					Template staticTemplate = configuration.getTemplate("front/page.ftl", configuration.getLocale());
					TemplateModel model = createModel(info, configuration);
					String path = ServletActionContext.getServletContext().getRealPath("info") + File.separator;
					Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + info.getId() + ".html"), "UTF-8"));
					if (preTemplateProcess(staticTemplate, model)) {
						try {
							staticTemplate.process(model, out);
							logger.debug("编号[" + info.getId() + "]生成成功");
							sum++;
						} finally {
							out.flush();
							out.close();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.setMsg("HTML生成完成[" + startId + "]-[" + endId + "]，总数为：" + sum);
		} else {
			List<Info> allInfo = infoBiz.getAll(Info.class);
			// 开始生成
			for (Info i : allInfo) {
				try {
					info = infoBiz.getEntityById(Info.class, i.getId());
					relateInfos = infoBiz.getRelateInfos(info);
					// 生成静态页面的的模板类
					Configuration configuration = freemarkerManager.getConfiguration(ServletActionContext.getServletContext());
					Template staticTemplate = configuration.getTemplate("front/page.ftl", configuration.getLocale());
					TemplateModel model = createModel(i, configuration);
					String path = ServletActionContext.getServletContext().getRealPath("info") + File.separator;
					Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + i.getId() + ".html"), "UTF-8"));
					if (preTemplateProcess(staticTemplate, model)) {
						try {
							staticTemplate.process(model, out);
						} finally {
							out.flush();
							out.close();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.setMsg("HTML生成完成");
		}
		return "gen_html";
	}

	protected TemplateModel createModel(Info i, Configuration configuration) throws TemplateModelException {
		ApplicationContext ac = (ApplicationContext) ActionContext.getContext().getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

		ServletContext servletContext = ServletActionContext.getServletContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		ValueStack stack = ServletActionContext.getContext().getValueStack();
		Object action = this;
		// if (invocation != null)
		// action = invocation.getAction(); // Added for NullPointException
		TemplateModel model = freemarkerManager.buildTemplateModel(stack, action, servletContext, request, response, configuration.getObjectWrapper());
		return model;
	}

	protected boolean preTemplateProcess(Template template, TemplateModel model) throws IOException {
		Object attrContentType = template.getCustomAttribute("content_type");
		if (attrContentType != null) {
			ServletActionContext.getResponse().setContentType(attrContentType.toString());
		} else {
			String contentType = null;
			if (contentType == null) {
				contentType = "text/html";
			}
			String encoding = template.getEncoding();
			if (encoding != null) {
				contentType = contentType + "; charset=" + encoding;
			}
			ServletActionContext.getResponse().setContentType(contentType);
		}
		return true;
	}

	// 关键词设置
	private KeyWordSetting keyword;
	private List<KeyWordSetting> keyWordList;

	public String addKeyword() {
		if (keyword != null && keyword.getName() != null && keyword.getCate() != null){
			commonBiz.saveOrUpdateEntity(keyword);
			this.setMsg("关键词添加成功");
			List keywordsList = commonBiz.getSetting(KeyWordSetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.KEY_WORD_LIST, keywordsList);
		}
		return keywords();
	}

	public String keywords() {
		keyWordList = commonBiz.getSetting(KeyWordSetting.class);
		return "keywords";
	}
	
	public String updateKeyword() {
		if (keyword != null && keyword.getId() != null){
			KeyWordSetting keywordInDB = commonBiz.getEntityById(KeyWordSetting.class, keyword.getId());
			keywordInDB.setName(keyword.getName());
			commonBiz.saveOrUpdateEntity(keywordInDB);
			this.setMsg("关键词更新成功");
			//更新缓存
			List keywordsList = commonBiz.getSetting(KeyWordSetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.KEY_WORD_LIST, keywordsList);
		}
		return keywords();
	}
	
	public String removeKeyword() {
		if (keyword != null && keyword.getId() != null){
			commonBiz.deleteEntity(KeyWordSetting.class, keyword.getId());
			this.setMsg("关键词删除成功");
			List keywordsList = commonBiz.getSetting(KeyWordSetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.KEY_WORD_LIST, keywordsList);
		}
		return keywords();
	}
	
	//置顶价格
	private List<TopPriceSetting> topPriceList;
	public String topPrice() {
		topPriceList = commonBiz.getSetting(TopPriceSetting.class);
		return "top_price";
	}
	private TopPriceSetting topPriceSetting;
	public String addTopPrice() {
		if (topPriceSetting != null && topPriceSetting.getPrice() != null && topPriceSetting.getCate() != null && topPriceSetting.getArea()!=null){
			commonBiz.saveTopPriceSetting(topPriceSetting);
			this.setMsg("置顶价格添加成功");
		}
		return topPrice();
	}
	public String updateTopPrice() {
		if (topPriceSetting != null && topPriceSetting.getId() != null){
			TopPriceSetting topPriceInDB = commonBiz.getEntityById(TopPriceSetting.class, topPriceSetting.getId());
			topPriceInDB.setPrice(topPriceSetting.getPrice());
			commonBiz.saveOrUpdateEntity(topPriceInDB);
			this.setMsg("置顶价格更新成功");
		}
		return topPrice();
	}
	//手动充值
	private Double money;
	public String money() {
		return "add_money";
	}
	public String addMoney() {
		if (user != null && user.getId() != null){
			user = userBiz.getEntityById(User.class, user.getId());
			BigDecimal balance = new BigDecimal(user.getBalance());
			BigDecimal mount = new BigDecimal(money);
			user.setBalance(balance.add(mount).doubleValue());
			userBiz.saveOrUpdateEntity(user);
			this.setMsg("用户["+user.getLoginName()+"]充值成功，金额为：" + money);
		}
		return userList();
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRenewpassword() {
		return renewpassword;
	}

	public void setRenewpassword(String renewpassword) {
		this.renewpassword = renewpassword;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public InfoBiz getInfoBiz() {
		return infoBiz;
	}

	public void setInfoBiz(InfoBiz infoBiz) {
		this.infoBiz = infoBiz;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getInfoListFrom() {
		return infoListFrom;
	}

	public void setInfoListFrom(String infoListFrom) {
		this.infoListFrom = infoListFrom;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}

	public List<Setting> getHotCities() {
		return hotCities;
	}

	public void setHotCities(List<Setting> hotCities) {
		this.hotCities = hotCities;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public List<Setting> getLinkList() {
		return linkList;
	}

	public void setLinkList(List<Setting> linkList) {
		this.linkList = linkList;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public Long getLinkId() {
		return linkId;
	}

	public void setLinkId(Long linkId) {
		this.linkId = linkId;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public FreemarkerManager getFreemarkerManager() {
		return freemarkerManager;
	}

	public List<Info> getRelateInfos() {
		return relateInfos;
	}

	public void setRelateInfos(List<Info> relateInfos) {
		this.relateInfos = relateInfos;
	}

	public Long getStartId() {
		return startId;
	}

	public void setStartId(Long startId) {
		this.startId = startId;
	}

	public Long getEndId() {
		return endId;
	}

	public void setEndId(Long endId) {
		this.endId = endId;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public KeyWordSetting getKeyword() {
		return keyword;
	}

	public void setKeyword(KeyWordSetting keyword) {
		this.keyword = keyword;
	}

	public List<KeyWordSetting> getKeyWordList() {
		return keyWordList;
	}

	public void setKeyWordList(List<KeyWordSetting> keyWordList) {
		this.keyWordList = keyWordList;
	}

	public List<TopPriceSetting> getTopPriceList() {
		return topPriceList;
	}

	public void setTopPriceList(List<TopPriceSetting> topPriceList) {
		this.topPriceList = topPriceList;
	}

	public TopPriceSetting getTopPriceSetting() {
		return topPriceSetting;
	}

	public void setTopPriceSetting(TopPriceSetting topPriceSetting) {
		this.topPriceSetting = topPriceSetting;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

}
