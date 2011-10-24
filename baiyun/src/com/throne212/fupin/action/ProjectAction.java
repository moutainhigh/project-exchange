package com.throne212.fupin.action;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ProjectBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Project;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectShehui;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.ProjectZhongdian;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;

public class ProjectAction extends BaseAction {

	// 村项目管理
	private ProjectCun proCun;

	private PageBean<? extends Project> pageBean;

	private Integer pageIndex;

	private ProjectBiz projectBiz;

	public String proCunList() {
		pageBean = projectBiz.getProjectCunList(pageIndex);
		return "pro_cun_list";
	}

	public String editCunPro() {
		proCun = projectBiz.getEntityById(ProjectCun.class, proCun.getId());
		return "pro_cun_edit";
	}

	public String saveProCun() {
		if (proCun == null)
			return "pro_cun_edit";

		if (proCun.getId() == null) {// 新建
			projectBiz.saveOrUpdateEntity(proCun);
			this.setMsg("保存成功");
			this.setSucc("Y");
		} else if (proCun.getId() != null) {
			projectBiz.saveOrUpdateEntity(proCun);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}

		return "pro_cun_edit";
	}

	public String deleteCunProjects() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				projectBiz.deleteEntity(ProjectCun.class, Long.parseLong(id));
			}
			this.setMsg("删除项目成功:" + ids.length);
		}
		return this.proCunList();
	}

	// 村项目进度
	private ProjectCunStat cunStat;

	public String cunStat() {
		if(cunStat != null && cunStat.getId()!=null){
			cunStat = projectBiz.getEntityById(ProjectCunStat.class, cunStat.getId());
		} else if (cunStat.getYear() == null || cunStat.getMonth() == null) {
			Calendar now = GregorianCalendar.getInstance();
			cunStat.setYear(now.get(Calendar.YEAR));
			cunStat.setMonth(now.get(Calendar.MONTH) + 1);
			ProjectCunStat cunStatInDB = projectBiz.getCunStat(cunStat);
			if (cunStatInDB != null)
				cunStat = cunStatInDB;
			else {
				this.setMsg("本单位还没有指定村帮扶项目，请联系管理员先指定");
			}
		} else if (cunStat != null || cunStat.getYear() != null || cunStat.getMonth() != null) {
			ProjectCunStat cunStatInDB = projectBiz.getCunStat(cunStat);
			if (cunStatInDB != null)
				cunStat = cunStatInDB;
			else {
				this.setMsg("该月暂时还没有进度数据");
			}
		}
		if(cunStat != null && Util.isEmpty(cunStat.getCunRemark())){
			cunStat.setCunRemark("未审核");
		}
		return "cun_stat";
	}

	public String saveProCunStat() {
		if (cunStat == null || cunStat.getId() == null || cunStat.getProject() == null || cunStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定村帮扶项目");
			return cunStat();
		}
		cunStat.setLock(1);
		projectBiz.saveOrUpdateEntity(cunStat);
		this.setMsg("保存并提交成功");
		this.setSucc("Y");
		return cunStat();
	}

	public String tmpSaveProCunStat() {
		if (cunStat == null || cunStat.getId() == null || cunStat.getProject() == null || cunStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定村帮扶项目");
			return cunStat();
		}
		cunStat.setLock(3);
		projectBiz.saveOrUpdateEntity(cunStat);
		this.setMsg("暂时保存成功");
		this.setSucc("Y");
		return cunStat();
	}

	public String requstUnlockProCunStat() {
		if (cunStat == null || cunStat.getId() == null || cunStat.getProject() == null || cunStat.getProject().getId() == null) {
			this.setMsg("不能解锁，还未指定村帮扶项目");
			return cunStat();
		}
		cunStat = projectBiz.getEntityById(ProjectCunStat.class, cunStat.getId());
		cunStat.setLock(2);
		cunStat.setCunRemark("未审核");
		projectBiz.saveOrUpdateEntity(cunStat);
		this.setMsg("已发出解锁请求");
		this.setSucc("Y");
		return cunStat();
	}

	// 解锁列表
	private List<ProjectCunStat> proCunStatList;

	public String proCunStatLockList() {
		proCunStatList = projectBiz.getEntitiesByColumn(ProjectCunStat.class, "lock", 2);
		return "cun_stat_lock_list";
	}

	public String unlockProCunStat() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				ProjectCunStat s = projectBiz.getEntityById(ProjectCunStat.class, Long.parseLong(idStr));
				s.setLock(0);// 0表示已经解锁
				s.setCunRemark("未审核");
				projectBiz.saveOrUpdateEntity(s);
			}
			this.setMsg("成功解锁" + ids.length + "个报表");
		}
		return proCunStatLockList();
	}
	
	//cun remark
	public String cunStatForCunRemark() {
//		if(cunStat == null){
//			cunStat = new ProjectCunStat();
//			Calendar now = GregorianCalendar.getInstance();
//			cunStat.setYear(now.get(Calendar.YEAR));
//			cunStat.setMonth(now.get(Calendar.MONTH) + 1);
//			ProjectCunStat cunStatInDB = projectBiz.getCunStat(cunStat);
//			if (cunStatInDB != null)
//				cunStat = cunStatInDB;
//			else {
//				this.setMsg("本单位还没有指定村帮扶项目，请联系管理员先指定");
//			}
//		} else if (cunStat != null || cunStat.getYear() != null || cunStat.getMonth() != null) {
//			ProjectCunStat cunStatInDB = projectBiz.getCunStat(cunStat);
//			if (cunStatInDB != null)
//				cunStat = cunStatInDB;
//			else {
//				this.setMsg("该月暂时还没有进度数据");
//			}
//		}
		cunStat = projectBiz.getEntityById(ProjectCunStat.class, cunStat.getId());
		return "cun_stat";
	}
	public String shenheProCunStat() {
		if (cunStat == null || cunStat.getId() == null || cunStat.getProject() == null || cunStat.getProject().getId() == null) {
			this.setMsg("不能操作，还未指定村帮扶项目");
			return cunStat();
		}
		cunStat = projectBiz.getEntityById(ProjectCunStat.class, cunStat.getId());
		cunStat.setCunRemark("已审核");
		projectBiz.saveOrUpdateEntity(cunStat);
		this.setMsg("已审核");
		this.setSucc("Y");
		return cunStat();
	}

	public String tuihuiProCunStat() {
		if (cunStat == null || cunStat.getId() == null || cunStat.getProject() == null || cunStat.getProject().getId() == null) {
			this.setMsg("不能操作，还未指定村帮扶项目");
			return cunStat();
		}
		cunStat = projectBiz.getEntityById(ProjectCunStat.class, cunStat.getId());
		cunStat.setLock(0);
		cunStat.setCunRemark("退回修改");
		projectBiz.saveOrUpdateEntity(cunStat);
		this.setMsg("退回修改");
		this.setSucc("Y");
		return cunStat();
	}
	
	
	

	// 重点项目管理
	private ProjectZhongdian proZd;

	public String proZdList() {
		pageBean = projectBiz.getProjectZdList(pageIndex);
		return "pro_zd_list";
	}

	public String editZdPro() {
		if (proZd != null && proZd.getId() != null)
			proZd = projectBiz.getEntityById(ProjectZhongdian.class, proZd.getId());
		return "pro_zd_edit";
	}

	public String saveProZd() {
		if (proZd == null)
			return "pro_zd_edit";

		if (proZd.getId() == null) {// 新建
			projectBiz.saveOrUpdateEntity(proZd);
			this.setMsg("保存成功");
			this.setSucc("Y");
		} else if (proZd.getId() != null) {
			projectBiz.saveOrUpdateEntity(proZd);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}

		return "pro_zd_edit";
	}

	public String deleteZdProjects() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				projectBiz.deleteEntity(ProjectZhongdian.class, Long.parseLong(id));
			}
			this.setMsg("删除项目成功:" + ids.length);
		}
		return this.proZdList();
	}

	// 获取所有的单位
	public List<Org> getAllOrgList() {
		return projectBiz.getAll(Org.class, "id", "asc");
	}

	// 重点项目进度
	private ProjectZdStat zdStat;

	public String zdStat() {
		if(zdStat != null && zdStat.getId()!=null){
			zdStat = projectBiz.getEntityById(ProjectZdStat.class, zdStat.getId());
		} else if (zdStat == null || zdStat.getYear() == null || zdStat.getMonth() == null) {
			Calendar now = GregorianCalendar.getInstance();
			zdStat.setYear(now.get(Calendar.YEAR));
			zdStat.setMonth(now.get(Calendar.MONTH) + 1);
			ProjectZdStat zdStatInDB = projectBiz.getZdStat(zdStat);
			if (zdStatInDB != null)
				zdStat = zdStatInDB;
			else {
				this.setMsg("本单位还没有指定重点镇帮扶项目，请联系管理员先指定");
			}
		} else if (zdStat != null || zdStat.getYear() != null || zdStat.getMonth() != null) {
			ProjectZdStat zdStatInDB = projectBiz.getZdStat(zdStat);
			if (zdStatInDB != null)
				zdStat = zdStatInDB;
			else {
				this.setMsg("该月暂时还没有进度数据");
			}
		}
		if(zdStat != null && Util.isEmpty(zdStat.getCunRemark())){
			zdStat.setCunRemark("未审核");
		}
		return "zd_stat";
	}

	public String saveProZdStat() {
		if (zdStat == null || zdStat.getId() == null || zdStat.getProject() == null || zdStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定重点镇帮扶项目");
			return zdStat();
		}
		zdStat.setLock(1);
		projectBiz.saveOrUpdateEntity(zdStat);
		this.setMsg("保存成功");
		this.setSucc("Y");
		return zdStat();
	}
	
	public String tmpSaveProZdStat() {
		if (zdStat == null || zdStat.getId() == null || zdStat.getProject() == null || zdStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定重点镇帮扶项目");
			return zdStat();
		}
		zdStat.setLock(3);
		projectBiz.saveOrUpdateEntity(zdStat);
		this.setMsg("暂时保存成功");
		this.setSucc("Y");
		return zdStat();
	}

	public String requstUnlockProZdStat() {
		if (zdStat == null || zdStat.getId() == null || zdStat.getProject() == null || zdStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定重点镇帮扶项目");
			return zdStat();
		}
		zdStat = projectBiz.getEntityById(ProjectZdStat.class, zdStat.getId());
		zdStat.setLock(2);
		zdStat.setCunRemark("未审核");
		projectBiz.saveOrUpdateEntity(zdStat);
		this.setMsg("已发出解锁请求");
		this.setSucc("Y");
		return zdStat();
	}

	// 解锁列表
	private List<ProjectZdStat> proZdStatList;

	public String proZdStatLockList() {
		proZdStatList = projectBiz.getEntitiesByColumn(ProjectZdStat.class, "lock", 2);
		return "zd_stat_lock_list";
	}

	public String unlockProZdStat() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				ProjectZdStat s = projectBiz.getEntityById(ProjectZdStat.class, Long.parseLong(idStr));
				s.setLock(0);// 0表示已经解锁
				s.setCunRemark("未审核");
				projectBiz.saveOrUpdateEntity(s);
			}
			this.setMsg("成功解锁" + ids.length + "个报表");
		}
		return proZdStatLockList();
	}
	
	//cun remark
	public String zdStatForCunRemark() {
		zdStat = projectBiz.getEntityById(ProjectZdStat.class, zdStat.getId());
		return "cun_stat";
	}
	public String shenheProZdStat() {
		if (zdStat == null || zdStat.getId() == null || zdStat.getProject() == null || zdStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定重点镇帮扶项目");
			return zdStat();
		}
		zdStat = projectBiz.getEntityById(ProjectZdStat.class, zdStat.getId());
		zdStat.setCunRemark("已审核");
		projectBiz.saveOrUpdateEntity(zdStat);
		this.setMsg("已审核");
		this.setSucc("Y");
		return zdStat();
	}

	public String tuihuiProZdStat() {
		if (zdStat == null || zdStat.getId() == null || zdStat.getProject() == null || zdStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定重点镇帮扶项目");
			return zdStat();
		}
		zdStat = projectBiz.getEntityById(ProjectZdStat.class, zdStat.getId());
		zdStat.setLock(0);
		zdStat.setCunRemark("退回修改");
		projectBiz.saveOrUpdateEntity(zdStat);
		this.setMsg("退回修改");
		this.setSucc("Y");
		return zdStat();
	}
	
	

	// 社会资金管理
	private ProjectShehui proSh;

	public String proShList() {
		pageBean = projectBiz.getProjectShList(pageIndex);
		return "pro_sh_list";
	}

	public String editShPro() {
		if (proSh != null && proSh.getId() != null)
			proSh = projectBiz.getEntityById(ProjectShehui.class, proSh.getId());
		return "pro_sh_edit";
	}

	public String saveProSh() {
		if (proSh == null)
			return "pro_sh_edit";

		if (proSh.getId() == null) {// 新建
			projectBiz.saveOrUpdateEntity(proSh);
			this.setMsg("保存成功");
			this.setSucc("Y");
		} else if (proSh.getId() != null) {
			projectBiz.saveOrUpdateEntity(proSh);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}

		return "pro_sh_edit";
	}

	public String deleteShProjects() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				projectBiz.deleteEntity(ProjectShehui.class, Long.parseLong(id));
			}
			this.setMsg("删除项目成功:" + ids.length);
		}
		return this.proShList();
	}

	// 社会募捐进度
	private ProjectShStat shStat;

	public String shStat() {
		if (shStat.getYear() == null || shStat.getMonth() == null) {
			Calendar now = GregorianCalendar.getInstance();
			shStat.setYear(now.get(Calendar.YEAR));
			shStat.setMonth(now.get(Calendar.MONTH) + 1);
			ProjectShStat shStatInDB = projectBiz.getShStat(shStat);
			if (shStatInDB != null)
				shStat = shStatInDB;
			else {
				this.setMsg("本单位还没有指定社会资金帮扶项目，请联系管理员先指定");
			}
		} else if (shStat != null || shStat.getYear() != null || shStat.getMonth() != null) {
			ProjectShStat shStatInDB = projectBiz.getShStat(shStat);
			if (shStatInDB != null)
				shStat = shStatInDB;
			else {
				this.setMsg("该月暂时还没有进度数据");
			}
		}
		return "sh_stat";
	}

	public String saveProShStat() {
		if (shStat == null || shStat.getId() == null || shStat.getProject() == null || shStat.getProject().getId() == null) {
			this.setMsg("不能保存，还未指定社会资金帮扶项目");
			return shStat();
		}
		projectBiz.saveOrUpdateEntity(shStat);
		this.setMsg("保存成功");
		this.setSucc("Y");
		return shStat();
	}

	public ProjectCun getProCun() {
		return proCun;
	}

	public void setProCun(ProjectCun proCun) {
		this.proCun = proCun;
	}

	public PageBean<? extends Project> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<? extends Project> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public ProjectBiz getProjectBiz() {
		return projectBiz;
	}

	public void setProjectBiz(ProjectBiz projectBiz) {
		this.projectBiz = projectBiz;
	}

	public ProjectZhongdian getProZd() {
		return proZd;
	}

	public void setProZd(ProjectZhongdian proZd) {
		this.proZd = proZd;
	}

	public ProjectShehui getProSh() {
		return proSh;
	}

	public void setProSh(ProjectShehui proSh) {
		this.proSh = proSh;
	}

	public ProjectCunStat getCunStat() {
		return cunStat;
	}

	public void setCunStat(ProjectCunStat cunStat) {
		this.cunStat = cunStat;
	}

	public ProjectZdStat getZdStat() {
		return zdStat;
	}

	public void setZdStat(ProjectZdStat zdStat) {
		this.zdStat = zdStat;
	}

	public ProjectShStat getShStat() {
		return shStat;
	}

	public void setShStat(ProjectShStat shStat) {
		this.shStat = shStat;
	}

	public List<ProjectCunStat> getProCunStatList() {
		return proCunStatList;
	}

	public void setProCunStatList(List<ProjectCunStat> proCunStatList) {
		this.proCunStatList = proCunStatList;
	}

	public List<ProjectZdStat> getProZdStatList() {
		return proZdStatList;
	}

	public void setProZdStatList(List<ProjectZdStat> proZdStatList) {
		this.proZdStatList = proZdStatList;
	}

}
