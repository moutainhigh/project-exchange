package com.throne212.fupin.dao.impl;

import java.io.File;
import java.math.BigDecimal;
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

import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.dao.DangReportDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;

public class DangReportDaoImpl extends BaseDaoImpl implements DangReportDao {

	@SuppressWarnings("unchecked")
	public DangReport getReport(Org org, Cun cun, Integer year, String time) {

		DangReport report = null;
		String hql = "from DangReport where org=? and cun=? and year=? and time=?";
		List<DangReport> list = this.getHibernateTemplate().find(hql, new Object[] { org, cun, year, time });
		if (list == null || list.size() == 0) {
			try {
				DangReport r = new DangReport();
				r.setOrg(org);
				r.setCun(cun);
				r.setYear(year);
				r.setTime(time);
				report = r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		} else {
			report = list.get(0);
		}
		// 填入默认项目
		return report;
	}
	
	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile) {
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct ");
		sql.append("c.id as 'cunId', ");
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
			sql.append("r.item16  as '帮扶单位干部　职工(人次) ', ");
			sql.append("r.item17  as '种植(户) ', ");
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
			sql.append("r.item48 as '生活污水处理设施(个) ' ");
		sql.append("from fp_diqu c ");
		sql.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sql.append("left outer join fp_diqu a on a.id=z.area_id ");
		sql.append("left outer join fp_dang_report r on r.cun_id=c.id ");		 
		sql.append("and STR_TO_DATE(CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
		sql.append("and STR_TO_DATE(CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");
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
		} else if ("not206".equals(reportParam.getIs206())){
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
//		if ("conghua".equals(reportParam.getDiqu())) {
//			sql.append("and a.name='从化市' ");
//		} else {
//			sql.append("and a.name='增城市' ");
//		}
		sql.append("and a.name='"+reportParam.getAreaName()+"' ");
		sql.append("group by a.name,z.name,c.name ");
		sql.append("order by r.year desc, r.time desc ");

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
			rs = ps.executeQuery();

			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			WritableSheet sheet1 = workbook.getSheet(0);
			int row = 3;
			while (rs.next()) {
				Long cunId = rs.getLong("cunId");//第一个是cun的id
				Cun cun = this.getEntityById(Cun.class, cunId);
				for (int i = 2; i <= 55; i++) {
					try {
						Object obj = rs.getObject(i);
						if(obj == null || "null".equals(obj))
							continue;
						if(i-2 < 9)
							sheet1.addCell(new Label(i-2, row, obj.toString()));
						else{
							sheet1.addCell(new Number(i-2, row, "".equals(obj.toString()) ? 0 : Double.parseDouble(obj.toString())));
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

	public List<String[]> statReport(ReportParam reportParam) {
		StringBuffer sql = new StringBuffer();
		sql.append("select a.name,");
		sql.append("sum(r.item1), ");
		sql.append("sum(r.item2), ");
		sql.append("sum(r.item3), ");
		sql.append("sum(r.item4), ");
		sql.append("sum(r.item5), ");
		sql.append("sum(r.item6), ");
		sql.append("sum(r.item7), ");
		sql.append("sum(r.item8), ");
		sql.append("sum(r.item9), ");
		sql.append("sum(r.item10), ");
		sql.append("sum(r.item11), ");
		sql.append("sum(r.item12), ");
		sql.append("sum(r.item13), ");
		sql.append("sum(r.item14), ");
		sql.append("sum(r.item15), ");
		sql.append("sum(r.item16), ");
		sql.append("sum(r.item17), ");
		sql.append("sum(r.item18), ");
		sql.append("sum(r.item19), ");
		sql.append("sum(r.item20), ");
		sql.append("sum(r.item21), ");
		sql.append("sum(r.item22), ");
		sql.append("sum(r.item23), ");
		sql.append("sum(r.item24), ");
		sql.append("sum(r.item25), ");
		sql.append("sum(r.item26), ");
		sql.append("sum(r.item27), ");
		sql.append("sum(r.item28), ");
		sql.append("sum(r.item29), ");
		sql.append("sum(r.item30), ");
		sql.append("sum(r.item31), ");
		sql.append("sum(r.item32), ");
		sql.append("sum(r.item33), ");
		sql.append("sum(r.item34), ");
		sql.append("sum(r.item35), ");
		sql.append("sum(r.item36), ");
		sql.append("sum(r.item37), ");
		sql.append("sum(r.item38), ");
		sql.append("sum(r.item39), ");
		sql.append("sum(r.item40), ");
		sql.append("sum(r.item41), ");
		sql.append("sum(r.item42), ");
		sql.append("sum(r.item43), ");
		sql.append("sum(r.item44), ");
		sql.append("sum(r.item45), ");
		sql.append("sum(r.item46) ");
		sql.append("from fp_diqu c ");
		sql.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sql.append("left outer join fp_diqu a on a.id=z.area_id ");
		sql.append("left outer join fp_dang_report r on r.cun_id=c.id ");
		sql.append("and STR_TO_DATE(CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
		sql.append("and STR_TO_DATE(CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");
		sql.append("where c.diqu_type='cun' ");
		sql.append("and z.diqu_type='zhen' ");
		sql.append("and a.diqu_type='area' ");
		sql.append("group by a.name");
		logger.info("报表统计生成sql：\n" + sql);
		List<String[]> rows = new ArrayList<String[]>();
		Session s = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			conn = s.connection();
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String[] row = new String[47];
				for(int j=0;j<1;j++)
					row[j] = rs.getString(j+1);
				for(int j=1;j<=46;j++){
					Double d = rs.getDouble(j + 1);
					if(d == null)
						continue;
					row[j] = new BigDecimal(d).toPlainString().trim();
					int index = row[j].indexOf(".");
					if(index > -1){
						String num2 = row[j].substring(index+1);   
						if(num2.length() > 2)
						row[j] = row[j].substring(0, index + 3);
					}
				}
				rows.add(row);
			}
			return rows;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (s != null)
				try {
					s.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}

		return rows;
	}
	public void autoSaveReports(int year, int month){
		String hql = "from Cun";
		List<Cun> cunList = this.getHibernateTemplate().find(hql);
		for(Cun cun : cunList){
			if(cun.getOrg() != null){
				hql = "from DangReport where year=? and time=? and cun=?";
				List<DangReport> r1List = this.getHibernateTemplate().find(hql, new Object[]{year, month + "",cun});
				if(r1List != null && r1List.size() > 0){//存在，或已经暂存过来
					DangReport r1 = r1List.get(0);
					if(r1.getLock() != 1){
						r1.setLock(1);//锁定
						this.saveOrUpdate(r1);
					}
				}else{
					DangReport report = getReport(cun.getOrg(), cun, year, month + "");
					for (int i = 1; i <= 60; i++) {
						report.setItem(i, "0");
					}
					report.setCun(cun);
					report.setOrg(cun.getOrg());
					report.setYear(year);
					report.setTime(month + "");
					report.setLock(1);// 1表示已经锁定
					saveOrUpdate(report);
				}
			}
		}
	}
	
}
