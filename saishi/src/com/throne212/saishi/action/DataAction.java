package com.throne212.saishi.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.saishi.biz.BaseBiz;
import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.domain.Admin;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Manager;
import com.throne212.saishi.domain.Music;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.User;

public class DataAction extends BaseAction {
	private PageBean pageBean;
	private Integer pageIndex;
	private int pageSize;
	private String orderBy;
	private String orderType;
	private BaseBiz baseBiz;
	private DataBiz dataBiz;
	private Date fromDate;
	private Date toDate;

	// 用户管理
	private User user;
	private String role;

	public String saveUser() {
		if (user == null) {
			this.setMsg("用户保存失败，请检查数据是否录入完整");
			return "user_edit";
		}
		if (user != null && !Util.isEmpty(user.getLoginName())) {// 添加或更新用户信息
			if (user.getName() != null && user.getId() == null && !"".equals(user.getName())) {
				User userInDB = dataBiz.getEntityByUnique(User.class, "name", user.getName());
				if (userInDB != null) {
					this.setMsg("登录名重复，请重新填入！");
					return "user_edit";
				}
			}

			if (user.getId() == null) {
				User userInDB = dataBiz.getEntityByUnique(User.class, "loginName", user.getLoginName());
				if (userInDB != null) {
					this.setMsg("已存在此用户,请重新输入用户名!");
					return "user_edit";
				}
			}
			User newUser = null;
			if (!Util.isEmpty(role)) {
				if (WebConstants.USER_NAME_ADMIN.endsWith(role)) {// 添加或更新系统管理员
					newUser = new Admin();
				} else if (WebConstants.USER_NAME_MANAGER.endsWith(role)) {
					newUser = new Manager();
				}
				newUser.setLoginName(user.getLoginName());
				newUser.setId(user.getId());
				newUser.setPassword(user.getPassword());
				newUser.setRemark(user.getRemark());
				newUser.setName(user.getName());
				newUser.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
				user = dataBiz.saveUser(newUser);
				this.setMsg("用户保存成功【" + user.getName() + "】");
				this.setUser(null);
				this.setRole(null);
				return userList();
			} else {
				this.setMsg("用户角色参数缺失");
			}
		} else if (user != null && user.getId() != null) {// 查看用户户详情
			user = dataBiz.getEntityById(User.class, user.getId());
			return "user_edit";
		}
		return "user_edit";
	}

	// 用户列表
	public String userList() {
		pageBean = dataBiz.getUserList(user, fromDate, toDate, pageIndex, role, orderBy, orderType, pageSize);
		return "user_list";
	}

	// 删除用户
	public String deleteUser() {
		if (user != null && user.getId() != null) {
			dataBiz.deleteUser(user);
			this.setMsg("用户删除成功");
		} else {
			this.setMsg("用户删除失败，参数不完整");
		}
		return userList();
	}

	// 赛事录入或修改
	private Game game;

	public String saveGame() {
		if (game == null) {
			this.setMsg("赛事保存失败，请检查数据是否录入完整");
			return "game_edit";
		}
		if (game != null && game.getStartDate() != null && !Util.isEmpty(game.getStartDate().toString())) {// 添加或更新赛事信息
			game.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			game = dataBiz.saveGame(game);
			this.setMsg("赛事保存成功,类型【" + game.getType() + "】");
			game = null;
			return gameList();
		} else if (game != null && game.getId() != null) {// 查看赛事详情
			game = dataBiz.getEntityById(Game.class, game.getId());
			return "game_edit";
		}
		return "game_edit";
	}

	// 赛事列表
	private Date startDate;
	private Date endDate;

	public String gameList() {
		pageBean = dataBiz.getGameList(game, startDate, endDate, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
		return "game_list";
	}

	// 删除赛事
	public String deleteGame() {
		if (game != null && game.getId() != null) {
			dataBiz.deleteGame(game);
			this.setMsg("赛事删除成功");
		} else {
			this.setMsg("赛事删除失败，参数不完整");
		}
		return gameList();

	}

	// 新闻管理
	private News news;
	public String saveNews() {
		if (news == null) {
			this.setMsg("新闻保存失败，请检查数据是否录入完整");
			return "news_edit";
		}
		if (news != null && !Util.isEmpty(news.getTitle())) {// 添加或更新赛事信息
			news.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			news = dataBiz.saveNews(news);
			this.setMsg("新闻保存成功,标题【" + news.getTitle() + "】");
			news = null;
			return newsList();
		} else if (news != null && news.getId() != null) {// 查看赛事详情
			news = dataBiz.getEntityById(News.class, news.getId());
			return "news_edit";
		}
		return "news_edit";

	}

	// 新闻列表
	public String newsList() {
		pageBean = dataBiz.getNewsList(news, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
		return "news_list";
	}

	// 删除新闻
	public String deleteNews() {
		if (news != null && news.getId() != null) {
			dataBiz.deleteNews(news);
			this.setMsg("新闻删除成功");
		} else {
			this.setMsg("新闻删除失败，参数不完整");
		}
		return newsList();
	}

	// 音乐管理
	private Music music;

	// 音乐列表
	public String musicList() {
		pageBean = dataBiz.getMusicList(music, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
		return "music_list";
	}

	// 保存或修改音乐
	public String saveMusic() {
		if (music == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "music_edit";
		}
		if (music != null && !Util.isEmpty(music.getSinger())) {// 添加或更新音乐信息
			String musicUrl = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_MUSIC);
			if (music != null) {
				music.setUrl(musicUrl);
				ActionContext.getContext().getSession().remove(WebConstants.SESS_MUSIC);
				music.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
				music = dataBiz.saveMusic(music);
			} else {
				this.setMsg("音乐未能上传，请先上传音乐，再确认操作");
				return "music_edit";
			}
			this.setMsg("保存音乐【"+music.getSongName()+"】成功！");
			music = null;
			return musicList();
		} else if (music != null && music.getId() != null) {// 查看详情
			music = dataBiz.getEntityById(Music.class, music.getId());
		}
		return "music_edit";
	}
	
	//删除音乐
	public String deleteMusic(){
		if (music != null && music.getId() != null) {
			dataBiz.deleteMusic(music);
			this.setMsg("音乐删除成功");
		} else {
			this.setMsg("音乐删除失败，参数不完整");
		}
		return musicList();
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

}
