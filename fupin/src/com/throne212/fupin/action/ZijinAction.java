package com.throne212.fupin.action;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.math.BigDecimal;
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
import com.throne212.fupin.domain.ZijinItem;

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
		return "list";
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
		
		if(z != null && z.getId() != null){//sa查看和编辑
			z = zijinBiz.getEntityById(Zijin.class, z.getId());
			year = z.getYear();
			month = z.getMonth();
			type = z.getType();
			cunId = z.getCun().getId();
		}
		
		List<Zijin> zList = zijinBiz.getEntitiesByForeColumn(Zijin.class, "cun.id", cunId, "year", year, "month",month, "type", type);
		if (zList != null && zList.size() > 0) {
			z = zList.get(0);
		} else {
			z = new Zijin();
			z.setCun(zijinBiz.getEntityById(Cun.class, cunId));
			z.setYear(year);
			z.setMonth(month);
			z.setType(type);
			zijinBiz.saveOrUpdateEntity(z);
		}
		if (z.getStatus() != null && z.getStatus().equals(1)) {
			msg = "该报表已经提交，如需修改请点击申请解锁";
		} else if (z.getStatus() != null && z.getStatus().equals(2)) {
			msg = "该报表已解锁，可以填报";
		}
		if (cunId != null)
			cun = zijinBiz.getEntityById(Cun.class, cunId);
		fillItems();
		return "edit" + type;
	}

	private void fillItems() {
		if (z == null || z.getItems().size() == 0)
			return;
		int i = 1;
		for (ZijinItem zi : z.getItems()) {
			if (i > 15)
				break;
			setZItem(i++, zi);
		}
	}

	public void setZItem(Integer i, ZijinItem val) {
		if (i == null || i == 0)
			return;
		try {
			Method m = ZijinAction.class.getMethod("setZ" + i, ZijinItem.class);
			m.invoke(this, val);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ZijinItem getZItem(Integer i) {
		if (i == null || i == 0)
			return null;
		try {
			Method m = ZijinAction.class.getMethod("getZ" + i);
			return (ZijinItem) m.invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private ZijinItem z1;
	private ZijinItem z2;
	private ZijinItem z3;
	private ZijinItem z4;
	private ZijinItem z5;
	private ZijinItem z6;
	private ZijinItem z7;
	private ZijinItem z8;
	private ZijinItem z9;
	private ZijinItem z10;
	private ZijinItem z11;
	private ZijinItem z12;
	private ZijinItem z13;
	private ZijinItem z14;
	private ZijinItem z15;

	public String save() {
		tmpSave();
		z.setStatus(1);
		zijinBiz.saveOrUpdateEntity(z);
		return edit();
	}

	public String tmpSave() {
		z = zijinBiz.getEntityById(Zijin.class, z.getId());
		for (int i = 1; i <= 15; i++) {
			ZijinItem ziNew = this.getZItem(i);
			if(ziNew == null)
				continue;
			List<ZijinItem> zList = zijinBiz.getEntitiesByTwoColumn(ZijinItem.class, "zijin", z, "index", i);
			if (zList != null && zList.size() > 0) {
				ZijinItem zi = zList.get(0);
				Long zid = zi.getId();
				ziNew.setId(zid);
			}
			ziNew.setZijin(z);
			ziNew.setIndex(i);
			zijinBiz.saveOrUpdateEntity(ziNew);
			this.setMsg("保存成功");
		}
		return edit();
	}

	public String requstUnlock() {

		return edit();
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

	public ZijinItem getZ1() {
		return z1;
	}

	public void setZ1(ZijinItem z1) {
		this.z1 = z1;
	}

	public ZijinItem getZ2() {
		return z2;
	}

	public void setZ2(ZijinItem z2) {
		this.z2 = z2;
	}

	public ZijinItem getZ3() {
		return z3;
	}

	public void setZ3(ZijinItem z3) {
		this.z3 = z3;
	}

	public ZijinItem getZ4() {
		return z4;
	}

	public void setZ4(ZijinItem z4) {
		this.z4 = z4;
	}

	public ZijinItem getZ5() {
		return z5;
	}

	public void setZ5(ZijinItem z5) {
		this.z5 = z5;
	}

	public ZijinItem getZ6() {
		return z6;
	}

	public void setZ6(ZijinItem z6) {
		this.z6 = z6;
	}

	public ZijinItem getZ7() {
		return z7;
	}

	public void setZ7(ZijinItem z7) {
		this.z7 = z7;
	}

	public ZijinItem getZ8() {
		return z8;
	}

	public void setZ8(ZijinItem z8) {
		this.z8 = z8;
	}

	public ZijinItem getZ9() {
		return z9;
	}

	public void setZ9(ZijinItem z9) {
		this.z9 = z9;
	}

	public ZijinItem getZ10() {
		return z10;
	}

	public void setZ10(ZijinItem z10) {
		this.z10 = z10;
	}

	public ZijinItem getZ11() {
		return z11;
	}

	public void setZ11(ZijinItem z11) {
		this.z11 = z11;
	}

	public ZijinItem getZ12() {
		return z12;
	}

	public void setZ12(ZijinItem z12) {
		this.z12 = z12;
	}

	public ZijinItem getZ13() {
		return z13;
	}

	public void setZ13(ZijinItem z13) {
		this.z13 = z13;
	}

	public ZijinItem getZ14() {
		return z14;
	}

	public void setZ14(ZijinItem z14) {
		this.z14 = z14;
	}

	public ZijinItem getZ15() {
		return z15;
	}

	public void setZ15(ZijinItem z15) {
		this.z15 = z15;
	}

}
