package com.throne212.fupin.dao.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ReportDao;
import com.throne212.fupin.dataobject.ProCunStat;
import com.throne212.fupin.dataobject.ProZdStat;
import com.throne212.fupin.dataobject.Report1Stat;
import com.throne212.fupin.dataobject.Report3Stat;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.ProjectZhongdian;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report2;
import com.throne212.fupin.domain.Report3;
import com.throne212.fupin.domain.Report3Item;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class ReportDaoImpl extends BaseDaoImpl implements ReportDao {

	public Report getReport(String reportType, Org org, Cun cun, Integer year, String type, String time) {
		Class clazz = null;
		if ("1".equals(reportType)) {
			clazz = Report1.class;
		} else if ("2".equals(reportType)) {
			clazz = Report2.class;
		}
		String hql = "from " + clazz.getSimpleName() + " where org=? and cun=? and year=? and type=?";
		if (!"year".equals(type)) {
			hql += " and time='" + time + "'";
		}
		List<Report> list = this.getHibernateTemplate().find(hql, new Object[] { org, cun, year, type });
		if (list == null || list.size() == 0) {
			try {
				Report r = (Report) clazz.newInstance();
				r.setOrg(org);
				r.setCun(cun);
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
				return r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return list.get(0);
	}

	public Report3 getReport3(Zhen zhen, Integer year, String type, String time) {
		String hql = "from Report3 where zhen=? and year=? and type=?";
		if (!"year".equals(type)) {
			hql += " and time='" + time + "'";
		}
		List<Report3> list = this.getHibernateTemplate().find(hql, new Object[] { zhen, year, type });
		if (list == null || list.size() == 0) {// 新的创建
			try {
				Report3 r = new Report3();
				r.setZhen(zhen);
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
				this.saveOrUpdate(r);

				hql = "from ProjectCun where cun.zhen.id=" + zhen.getId();
				List<ProjectCun> pcList = this.getHibernateTemplate().find(hql);
				for (ProjectCun pc : pcList) {
					Report3Item r3i = new Report3Item();
					r3i.setProCun(pc);
					r3i.setR(r);
					this.saveOrUpdate(r3i);
				}

				r.setItems(this.getHibernateTemplate().find("from Report3Item where r.id=" + r.getId()));

				return r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				return null;
			}
		}

		Report3 r = list.get(0);
		r.setItems(this.getHibernateTemplate().find("from Report3Item where r.id=" + r.getId()));
		
		if(r.getItems() == null || r.getItems().size()==0){
			hql = "from ProjectCun where cun.zhen.id=" + zhen.getId();
			List<ProjectCun> pcList = this.getHibernateTemplate().find(hql);
			for (ProjectCun pc : pcList) {
				Report3Item r3i = new Report3Item();
				r3i.setProCun(pc);
				r3i.setR(r);
				this.saveOrUpdate(r3i);
			}

			r.setItems(this.getHibernateTemplate().find("from Report3Item where r.id=" + r.getId()));
		}
		
		return r;
	}
	public List<Report3> getReport3(Integer year, String type, String time) {
		String hql = "from Report3 where year=? and type=?";
		if (!"year".equals(type)) {
			hql += " and time='" + time + "'";
		}
		List<Report3> list = this.getHibernateTemplate().find(hql, new Object[] { year, type });
		for(Report3 r : list){
			logger.debug("r3.zhen.name=" + r.getZhen().getName());
			r.setItems(this.getHibernateTemplate().find("from Report3Item where r.id=" + r.getId()));
		}
		return list;
	}

	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile) {
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct ");
		sql.append("a.name as '区（县）', ");
		sql.append("z.name as '镇名称', ");
		sql.append("c.name as '村名称', ");
		sql.append("(select count(f2.id)  ");
		sql.append("from fp_family f2  ");
		sql.append("LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id ");
		sql.append("where c2.id=c.id) as '贫困户数', ");
		sql.append("c.poorPersonNum  as '贫困人口数', ");
		sql.append("(select o.orgName ");
		sql.append("from fp_user o  ");
		sql.append("where o.id=c.org and o.user_type='org') as '帮扶单位', ");
		sql.append("(select o.contactName ");
		sql.append("from fp_user o  ");
		sql.append("where o.id=c.org and o.user_type='org') as '联系人', ");
		sql.append("(select o.contactTel ");
		sql.append("from fp_user o  ");
		sql.append("where o.id=c.org and o.user_type='org') as '联系电话', ");
		if ("3".equals(reportParam.getName())) {
			sql.append("r.item1 as '规划投入资金（元）', ");
			sql.append("r.item2 as '已投入帮扶资金', ");
			sql.append("r.item3 as '用于帮扶到户资金(元)', ");
			sql.append("r.item4 as '用于帮扶到村资金(元)', ");
			sql.append("r.item5 as '财政专项(元)', ");
			sql.append("r.item6 as '信贷资金(元)', ");
			sql.append("r.item7 as '单位自筹(元)', ");
			sql.append("r.item8 as '社会募捐(元)', ");
			sql.append("r.item9 as '社会引资(元)' ");
		} else {
			sql.append("r.item1 as '贫困户户数(户) ', ");
			sql.append("r.item2 as '贫困户人数(人) ', ");
			sql.append("r.item3 as '1低保对象(户) ', ");
			sql.append("r.item4 as '1低保对象(人) ', ");
			sql.append("r.item5 as '1低收入困难家庭(户) ', ");
			sql.append("r.item6 as '1低收入困难家庭(人) ', ");
			sql.append("r.item7 as '2低保对象(户) ', ");
			sql.append("r.item8 as '2低保对象(人) ', ");
			sql.append("r.item9 as '2低收入困难家庭(户) ', ");
			sql.append("r.item10 as '2低收入困难家庭(人) ', ");
			sql.append("r.item11 as '危房户(户) ', ");
			sql.append("r.item12 as '贫困户去世、失踪等情况(户) ', ");
			sql.append("r.item13 as '预计本年脱贫户数(户) ', ");
			sql.append("r.item14 as '预计本年脱贫人数(人) ', ");
			sql.append("r.item15 as '帮扶单位领导(人次) ', ");
			sql.append("r.item16 as '帮扶单位干部　职工(人次) ', ");
			sql.append("r.item17 as '种植(户) ', ");
			sql.append("r.item18 as '养殖(户) ', ");
			sql.append("r.item19 as '务工(人) ', ");
			sql.append("r.item20 as '创业(人) ', ");
			sql.append("r.item21 as '农业科技培训(人次)', ");
			sql.append("r.item22 as '就业技能培训(人次) ', ");
			sql.append("r.item23 as '完成危房改造(户) ', ");
			sql.append("r.item24 as '参加农村合作医疗(人) ', ");
			sql.append("r.item25 as '参加农村养老保险(人) ', ");
			sql.append("r.item26 as '义务教育阶段(人) ', ");
			sql.append("r.item27 as '高中、职高、技校、中专等(人) ', ");
			sql.append("r.item28 as '大专、本科以上(人) ', ");
			sql.append("r.item29 as '产业发展带动农户(户) ', ");
			sql.append("r.item30 as '上年村级集体经济收入(元) ', ");
			sql.append("r.item31 as '预计今年村级集体经济收入(元) ', ");
			sql.append("r.item32 as '组织活动(次) ', ");
			sql.append("r.item33 as '扶贫工作会议(次) ', ");
			sql.append("r.item34 as '发展新党员(人) ', ");
			sql.append("r.item35 as '文娱体育(次) ', ");
			sql.append("r.item36 as '送医送药(次) ', ");
			sql.append("r.item37 as '科技下乡(次) ', ");
			sql.append("r.item38 as '其他(次) ', ");
			sql.append("r.item39 as '工业开发项目(个) ', ");
			sql.append("r.item40 as '商贸旅游项目(个) ', ");
			sql.append("r.item41 as '农业开发项目(个) ', ");
			sql.append("r.item42 as '手工加工项目(个) ', ");
			sql.append("r.item43 as '招商引资项目(个) ', ");
			sql.append("r.item44 as '企业捐建项目(个) ', ");
			sql.append("r.item45 as '硬底化村道(公里) ', ");
			sql.append("r.item46 as '安装路灯村道(公里) ', ");
			sql.append("r.item47 as '二次改水工程(个) ', ");
			sql.append("r.item48 as '生活污水处理设施(个) ', ");
			sql.append("r.item49 as '农田水利设施(个) ', ");
			sql.append("r.item50 as '受益农田(鱼塘)面积(亩) ', ");
			sql.append("r.item51 as '标准农田(鱼塘)(亩) ', ");
			sql.append("r.item52 as '村委会(个) ', ");
			sql.append("r.item53 as '文化室(个) ', ");
			sql.append("r.item54 as '卫生站(个) ', ");
			sql.append("r.item55 as '环卫设施(个) ', ");
			sql.append("r.item56 as '体育设施(个) ', ");
			sql.append("r.item57 as '其他(个) ' ");
		}
		sql.append("from fp_diqu c ");
		sql.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sql.append("left outer join fp_diqu a on a.id=z.area_id ");
		if ("3".equals(reportParam.getName()))
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.time=" + reportParam.getMonth() + " and r.report_type=2 and r.type='month' ");
		if ("12".equals(reportParam.getName()))
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.time=" + reportParam.getMonth() + " and r.report_type=1 and r.type='month' ");
		sql.append("where c.diqu_type='cun' ");
		sql.append("and z.diqu_type='zhen' ");
		sql.append("and a.diqu_type='area' ");
		if ("206".equals(reportParam.getIs206())) {
			sql.append("and (z.name = '温泉镇' or ");
			sql.append("z.name = '吕田镇' or ");
			sql.append("z.name = '良口镇' or ");
			sql.append("z.name = '鳌头镇' or ");
			sql.append("z.name = '小楼镇' or ");
			sql.append("z.name = '正果镇' or ");
			sql.append("z.name = '派潭镇' or ");
			sql.append("z.name = '梯面镇' or ");
			sql.append("z.name = '流溪河林场' ");
			sql.append(") ");
			sql.append("and c.name != '塘田村' and c.name != '安山村' ");
		} else {
			sql.append("and ((z.name != '温泉镇' and   ");
			sql.append("z.name != '吕田镇' and   ");
			sql.append("z.name != '良口镇' and   ");
			sql.append("z.name != '鳌头镇' and   ");
			sql.append("z.name != '小楼镇' and   ");
			sql.append("z.name != '正果镇' and   ");
			sql.append("z.name != '派潭镇' and   ");
			sql.append("z.name != '梯面镇' and   ");
			sql.append("z.name != '流溪河林场' ");
			sql.append(") or c.name = '塘田村' or c.name = '安山村') ");
		}
		if ("conghua".equals(reportParam.getDiqu())) {
			sql.append("and a.name='从化市' ");
		} else {
			sql.append("and a.name='增城市' ");
		}
		sql.append("group by a.name,z.name,c.name ");

		logger.info("报表导出sql：\n" + sql);
		Session s = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			conn = s.connection();
			// 获取数据
			ps = conn.prepareStatement(sql.toString());
			int colSize = ps.getMetaData().getColumnCount();
			rs = ps.executeQuery();

			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			WritableSheet sheet1 = workbook.getSheet(0);
			int row = 1;
			if ("12".equals(reportParam.getName()))
				row = 2;
			while (rs.next()) {
				// System.out.println(rs.getObject("帮扶单位")+":"+rs.getObject(56));
				for (int i = 0; i < colSize; i++) {
					try {
						Object obj = rs.getObject(i + 1);
						if (i < 9)
							sheet1.addCell(new Label(i, row, obj == null ? "" : obj.toString()));
						else {
							sheet1.addCell(new Number(i, row, obj == null || "".equals(obj.toString()) ? 0 : Double.parseDouble(obj.toString())));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				row++;
			}

			// 关闭
			workbook.write();
			workbook.close();
			rw.close();

			logger.info("报表产生成功：" + targetFile);
			return targetFile;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (s != null)
				try {
					s.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

		return null;
	}

	public List<Report1Stat> getReport1Stat(int year) {
		List<Report1Stat> list = new ArrayList<Report1Stat>();
		List<Cun> cunList = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof AreaWorkOrg) {// 白云区
			cunList = this.getAll(Cun.class, "zhen.id", "asc");

		} else if (user instanceof ZhenWorkOrg) {// 镇
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			cunList = this.getEntitiesByColumn(Cun.class, "zhen.id", z.getZhen().getId());
		}
		
		int min = 1;
		int max = 12;
		if(year == 2011)
			min = 8;

		for (Cun c : cunList) {
			Report1Stat s = new Report1Stat();
			s.setCun(c.getName());
			if(c.getOrg() != null)
				s.setOrg(c.getOrg().getOrgName());
			s.setZhen(c.getZhen().getName());
			for (int i = min; i <= max; i++) {// 7到12月
				String hql = "select count(*) from Report1 r where r.cun.id=" + c.getId() + " and r.time=" + i + " and type='month' and r.year=" + year;
				Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
				if (count > 0)
					s.setOk(i, "Y-" + c.getId() + "-" + year + "-" + i);
			}
			list.add(s);
		}

		return list;
	}
	
	public List<Report3Stat> getReport3Stat(int year) {
		List<Report3Stat> list = new ArrayList<Report3Stat>();
		List<Zhen> zhenList = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof AreaWorkOrg) {// 白云区
			zhenList = this.getAll(Zhen.class);

		} else if (user instanceof ZhenWorkOrg) {// 镇
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			zhenList = this.getEntitiesByColumn(Zhen.class, "zhen.id", z.getZhen().getId());
		}
		
		int min = 1;
		int max = 12;
		if(year == 2011)
			min = 8;

		for (Zhen z : zhenList) {
			Report3Stat s = new Report3Stat();
			s.setZhen(z.getName());
			for (int i = min; i <= max; i++) {// 7到12月
				String hql = "select count(*) from Report3 r where r.zhen.id=" + z.getId() + " and r.time=" + i + " and type='month' and r.year=" + year;
				Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
				if (count > 0)
					s.setOk(i, "Y-" + z.getId() + "-" + year + "-" + i);
			}
			list.add(s);
		}

		return list;
	}
	
	public List<ProCunStat> getProCunStat(int year) {
		List<ProCunStat> list = new ArrayList<ProCunStat>();
		List<Cun> cunList = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof AreaWorkOrg) {// 白云区
			cunList = this.getAll(Cun.class, "zhen.id", "asc");

		} else if (user instanceof ZhenWorkOrg) {// 镇
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			cunList = this.getEntitiesByColumn(Cun.class, "zhen.id", z.getZhen().getId());
		}
		
		int min = 1;
		int max = 12;
		if(year == 2011)
			min = 8;

		for (Cun c : cunList) {
			ProCunStat s = new ProCunStat();
			s.setCun(c.getName());
			if(c.getOrg() != null)
				s.setOrg(c.getOrg().getOrgName());
			s.setZhen(c.getZhen().getName());
			for (int i = min; i <= max; i++) {// 7到12月
				String hql = "select count(*) from " + ProjectCunStat.class.getName() + " r where r.project.cun.id=" + c.getId() + " and r.month=" + i + " and r.year=" + year;
				Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
				if (count > 0)
					s.setOk(i, "Y-" + c.getId() + "-" + year + "-" + i);
			}
			list.add(s);
		}

		return list;
	}
	
	public List<ProZdStat> getProZdStat(int year) {
		List<ProZdStat> list = new ArrayList<ProZdStat>();
		List<ProjectZhongdian> zdList = this.getAll(ProjectZhongdian.class);
		
		int min = 1;
		int max = 12;
		if(year == 2011)
			min = 8;

		for (ProjectZhongdian z : zdList) {
			ProZdStat s = new ProZdStat();
			s.setOrg(z.getOrg().getOrgName());
			s.setName(z.getName());
			for (int i = min; i <= max; i++) {// 7到12月
				String hql = "select count(*) from " + ProjectZdStat.class.getName() + " r where r.project.id=" + z.getId() + " and r.month=" + i + " and r.year=" + year + " order by r.project.org.id";
				Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
				if (count > 0)
					s.setOk(i, "Y-" + z.getId() + "-" + year + "-" + i);
			}
			list.add(s);
		}

		return list;
	}

	public PageBean getProStat(Class statClass, Integer year, Integer month, Integer pageIndex) {
		PageBean bean = new PageBean();

		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		String hql = "from " + statClass.getSimpleName() + " where year=? and month=?";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(statClass.getName().equals(ProjectCunStat.class.getName()) && user instanceof ZhenWorkOrg){
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			hql += " and project.cun.zhen.id=" + z.getZhen().getId();
		} 
		
		logger.debug("hql[" + year + "," + month + "]:" + hql);

		String countHql = "select count(*) " + hql;
		Long count = (Long) this.getHibernateTemplate().find(countHql, new Object[] { year, month }).get(0);
		bean.setTotalRow(count.intValue());

		logger.debug("pro stat count : " + count);

		if(statClass.getName().equals(ProjectCunStat.class.getName())){
			hql += " order by project.cun.zhen.id,project.cun.id";
		}
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).setParameter(0, year).setParameter(1, month).list();

		bean.setResultList(list);

		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.PAGE_SIZE);

		return bean;
	}
	
	public List<Report1> sumReport1(Long zhenId,Long cunId,int year,int month){
		String hql = "from Report1 r where year=" + year + " and type='month' and time=" + month;
		if(cunId != null){
			hql += " and r.cun.id=" + cunId;
		}else if(zhenId !=  null){
			hql += " and r.cun.zhen.id=" + zhenId;
		}
		hql += " order by r.cun.zhen.id";
		logger.info("sum report1 hql = " + hql);
		
		return this.getHibernateTemplate().find(hql);
	}
	
	public Object[] sumReport1Num(Long zhenId,Long cunId,int year,int month){
		String hql = "select sum(item1),sum(item2),sum(item3),sum(item10),sum(item11),sum(item12),sum(item13),sum(item14),sum(item15),sum(item16),sum(item17),sum(item18),sum(item19),sum(item20),sum(item21),sum(item22),sum(item23),sum(item24),sum(item25),sum(item26) from Report1 r where year=" + year + " and type='month' and time=" + month;
		if(cunId != null){
			hql += " and r.cun.id=" + cunId;
		}else if(zhenId !=  null){
			hql += " and r.cun.zhen.id=" + zhenId;
		}
		hql += " order by r.cun.zhen.id";
		logger.info("sum report1 hql = " + hql);
		
		List list = this.getHibernateTemplate().find(hql);
		return list.toArray();
	}
}
