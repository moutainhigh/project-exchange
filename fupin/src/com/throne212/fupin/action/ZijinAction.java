package com.throne212.fupin.action;

import java.io.InputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ZijinBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zijin;

public class ZijinAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	private Integer type;
	private Integer year;
	private Integer month;
	private Cun cun;

	// excel导出文件
	private InputStream downloadFile;

	private Zijin z;
	private ZijinBiz zijinBiz;

	public String list() {
		pageBean = zijinBiz.listZijin(areaId, zhenId, cunId, pageIndex, type, year, month);
		return "list1";
	}

	public String edit() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			if (org.getCun() == null) {
				this.setMsg("单位还未指定帮扶的村");
				return "edit" + type;
			}
			cunId = org.getCun().getId();
		}

		Calendar c = GregorianCalendar.getInstance();
		if (year == null) {
			year = c.get(Calendar.YEAR);
		}
		if (month == null) {
			month = c.get(Calendar.MONTH) + 1;
		}
		List<Zijin> zList = zijinBiz.getEntitiesByThreeColumn(Zijin.class, "cun.id", cunId, "year", year, "month", month);
		if (zList != null && zList.size() > 0) {
			z = zList.get(0);
		} else {
			z = new Zijin();
			z.setCun(zijinBiz.getEntityById(Cun.class, cunId));
			z.setYear(year);
			z.setMonth(month);
			z.setType(1);
			zijinBiz.saveOrUpdateEntity(z);
		}
		if (z.getStatus() != null && z.getStatus().equals(1)) {
			msg = "该报表已经提交，如需修改请点击申请解锁";
		} else if (z.getStatus() != null && z.getStatus().equals(2)) {
			msg = "该报表已解锁，可以填报";
		}
		if(cunId != null)
			cun = zijinBiz.getEntityById(Cun.class, cunId);
		return "edit" + type;
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

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getZhenId() {
		return zhenId;
	}

	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public Zijin getZ() {
		return z;
	}

	public void setZ(Zijin z) {
		this.z = z;
	}

	public ZijinBiz getZijinBiz() {
		return zijinBiz;
	}

	public void setZijinBiz(ZijinBiz zijinBiz) {
		this.zijinBiz = zijinBiz;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

}
