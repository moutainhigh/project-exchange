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

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ReportDao;
import com.throne212.fupin.dataobject.State;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report2;
import com.throne212.fupin.domain.User;

public class ReportDaoImpl extends BaseDaoImpl implements ReportDao {

	public Report getReport(String reportType, Org org, Cun cun, Integer year, String type, String time) {
		
		Report report = null;
		
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
				
				report = r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}else{
			report = list.get(0);
		}
		
		//填入默认项目
		if ("2".equals(reportType) && report != null && Util.isEmpty(report.getItem1()) && (report.getLock() == null || report.getLock() == 0)) {
			hql = "from Report2 r where org=? and cun=? and type=? order by year desc,cast(time as int) desc";
			Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			Report2 oldReport2 = (Report2) s.createQuery(hql).setMaxResults(1).setParameter(0, org).setParameter(1, cun).setParameter(2, type).uniqueResult();
			if(oldReport2 != null){
				report.setItem1(oldReport2.getItem1());
			}
		}
		
		return report;
	}

	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile) {
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct ");
		sql.append("c.id as 'cun_id', ");
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
			sql.append("sum(r.item2) as '已投入帮扶资金(元)', ");
			sql.append("sum(r.item3) as '用于帮扶到户资金(元)', ");
			sql.append("sum(r.item4) as '用于帮扶到村资金(元)', ");
			sql.append("sum(r.item5) as '财政专项(元)', ");
			sql.append("sum(r.item6) as '信贷资金(元)', ");
			sql.append("sum(r.item7) as '单位自筹(元)', ");
			sql.append("sum(r.item8) as '社会募捐(元)', ");
			sql.append("sum(r.item9) as '社会引资(元)' ");
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
			sql.append("sum(r.item12) as '贫困户去世、失踪等情况(户) ', ");
			sql.append("r.item13 as '预计本年脱贫户数(户) ', ");
			sql.append("r.item14 as '预计本年脱贫人数(人) ', ");
			sql.append("sum(r.item15)  as '帮扶单位领导(人次) ', ");
			sql.append("sum(r.item16)  as '帮扶单位干部　职工(人次) ', ");
			sql.append("sum(r.item17)  as '种植(户) ', ");
			sql.append("sum(r.item18)  as '养殖(户) ', ");
			sql.append("sum(r.item19)  as '务工(人) ', ");
			sql.append("sum(r.item20)  as '创业(人) ', ");
			sql.append("sum(r.item21)  as '农业科技培训(人次)', ");
			sql.append("sum(r.item22)  as '就业技能培训(人次) ', ");
			sql.append("sum(r.item23)  as '完成危房改造(户) ', ");
			sql.append("sum(r.item24)  as '参加农村合作医疗(人) ', ");
			sql.append("sum(r.item25)  as '参加农村养老保险(人) ', ");
			sql.append("sum(r.item26)  as '义务教育阶段(人) ', ");
			sql.append("sum(r.item27)  as '高中、职高、技校、中专等(人) ', ");
			sql.append("sum(r.item28)  as '大专、本科以上(人) ', ");
			sql.append("sum(r.item29)  as '产业发展带动农户(户) ', ");
			sql.append("r.item30 as '上年村级集体经济收入(元) ', ");
			sql.append("r.item31 as '预计今年村级集体经济收入(元) ', ");
			sql.append("sum(r.item32) as '组织活动(次) ', ");
			sql.append("sum(r.item33) as '扶贫工作会议(次) ', ");
			sql.append("sum(r.item34) as '发展新党员(人) ', ");
			sql.append("sum(r.item35) as '文娱体育(次) ', ");
			sql.append("sum(r.item36) as '送医送药(次) ', ");
			sql.append("sum(r.item37) as '科技下乡(次) ', ");
			sql.append("sum(r.item38) as '其他(次) ', ");
			sql.append("sum(r.item39) as '工业开发项目(个) ', ");
			sql.append("sum(r.item40) as '商贸旅游项目(个) ', ");
			sql.append("sum(r.item41) as '农业开发项目(个) ', ");
			sql.append("sum(r.item42) as '手工加工项目(个) ', ");
			sql.append("sum(r.item43) as '招商引资项目(个) ', ");
			sql.append("sum(r.item44) as '企业捐建项目(个) ', ");
			sql.append("sum(r.item45) as '硬底化村道(公里) ', ");
			sql.append("sum(r.item46) as '安装路灯村道(公里) ', ");
			sql.append("sum(r.item47) as '二次改水工程(个) ', ");
			sql.append("sum(r.item48) as '生活污水处理设施(个) ', ");
			sql.append("sum(r.item49) as '农田水利设施(个) ', ");
			sql.append("sum(r.item50) as '受益农田(鱼塘)面积(亩) ', ");
			sql.append("sum(r.item51) as '标准农田(鱼塘)(亩) ', ");
			sql.append("sum(r.item52) as '村委会(个) ', ");
			sql.append("sum(r.item53) as '文化室(个) ', ");
			sql.append("sum(r.item54) as '卫生站(个) ', ");
			sql.append("sum(r.item55) as '环卫设施(个) ', ");
			sql.append("sum(r.item56) as '体育设施(个) ', ");
			sql.append("sum(r.item57) as '其他(个) ' ");
		}
		sql.append("from fp_diqu c ");
		sql.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sql.append("left outer join fp_diqu a on a.id=z.area_id ");
		if ("3".equals(reportParam.getName())) 
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.report_type=2 and r.type='month' ");
		if ("12".equals(reportParam.getName())) 
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.report_type=1 and r.type='month' ");
		 
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
			int colSize = ps.getMetaData().getColumnCount();
			rs = ps.executeQuery();

			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			WritableSheet sheet1 = workbook.getSheet(0);
			int row = 1;
			if ("12".equals(reportParam.getName())){
				row = 2;
				//填充公共数据
				User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
				if (user instanceof Org) {
					Org org = (Org) user;
					Cun cun = org.getCun();
					cun = this.getEntityById(Cun.class, cun.getId());
					//r.setItem1(cun.getPoorFamilyNum() == null ? "" : cun.getPoorFamilyNum() + "");
					//r.setItem2(cun.getPoorPersonNum() == null ? "" : cun.getPoorPersonNum() + "");
					//r.setItem3(cun.getPoorFamilyNum1() == null ? "" : cun.getPoorFamilyNum1() + "");
					//r.setItem4(cun.getPoorPersonNum1() == null ? "" : cun.getPoorPersonNum1() + "");
					//r.setItem5(cun.getPoorFamilyNum3() == null ? "" : cun.getPoorFamilyNum3() + "");
					//r.setItem6(cun.getPoorPersonNum3() == null ? "" : cun.getPoorPersonNum3() + "");
					//r.setItem7(cun.getPoorFamilyNum2() == null ? "" : cun.getPoorFamilyNum2() + "");
					//r.setItem8(cun.getPoorPersonNum2() == null ? "" : cun.getPoorPersonNum2() + "");
					//r.setItem9(cun.getPoorFamilyNum4() == null ? "" : cun.getPoorFamilyNum4() + "");
					//r.setItem10(cun.getPoorPersonNum4() == null ? "" : cun.getPoorPersonNum4() + "");
					//r.setItem11(cun.getWeiHouse() == null ? "" : cun.getWeiHouse() + "");
					//r.setItem30(cun.getIncome() == null ? "" : cun.getIncome() + "");
				}
			
				while (rs.next()) {
					//System.out.println(rs.getObject("帮扶单位")+":"+rs.getObject(56));
					Long cunId = rs.getLong(1);//第一个是cun的id
					Cun cun = this.getEntityById(Cun.class, cunId);
					for (int i = 0; i < 65; i++) {
						try {
							Object obj = rs.getObject(i + 2);
							if(i+1 == 9){
								obj = cun.getPoorFamilyNum() == null ? "" : cun.getPoorFamilyNum() + "";
							}else if(i+1 == 10){
								obj = cun.getPoorPersonNum() == null ? "" : cun.getPoorPersonNum() + "";
							}else if(i+1 == 11){
								obj = cun.getPoorFamilyNum1() == null ? "" : cun.getPoorFamilyNum1() + "";
							}else if(i+1 == 12){
								obj = cun.getPoorPersonNum1() == null ? "" : cun.getPoorPersonNum1() + "";
							}else if(i+1 == 13){
								obj = cun.getPoorFamilyNum3() == null ? "" : cun.getPoorFamilyNum3() + "";
							}else if(i+1 == 14){
								obj = cun.getPoorPersonNum3() == null ? "" : cun.getPoorPersonNum3() + "";
							}else if(i+1 == 15){
								obj = cun.getPoorFamilyNum2() == null ? "" : cun.getPoorFamilyNum2() + "";
							}else if(i+1 == 16){
								obj = cun.getPoorPersonNum2() == null ? "" : cun.getPoorPersonNum2() + "";
							}else if(i+1 == 17){
								obj = cun.getPoorFamilyNum4() == null ? "" : cun.getPoorFamilyNum4() + "";
							}else if(i+1 == 18){
								obj = cun.getPoorPersonNum4() == null ? "" : cun.getPoorPersonNum4() + "";
							}else if(i+1 == 19){
								obj = cun.getWeiHouse() == null ? "" : cun.getWeiHouse() + "";
							}else if(i+1 == 38){
								obj = cun.getIncome() == null ? "" : cun.getIncome() + "";
							}
							
							if(obj == null || "null".equals(obj))
								obj = "";
							if(i < 9)
								sheet1.addCell(new Label(i, row, obj.toString()));
							else{
								sheet1.addCell(new Number(i, row, "".equals(obj.toString()) ? 0 : Double.parseDouble(obj.toString())));
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					row++;
				}
			
			}else if ("3".equals(reportParam.getName())){
				while (rs.next()) {
					Long cunId = rs.getLong(1);//第一个是cun的id
					Cun cun = this.getEntityById(Cun.class, cunId);
					for (int i = 0; i < 17; i++) {
						try {
							Object obj = rs.getObject(i + 2);
							
							if(obj == null || "null".equals(obj))
								obj = "";
							if(i < 9){
								sheet1.addCell(new Label(i, row, obj.toString()));
							} else{
								sheet1.addCell(new Number(i, row, "".equals(obj.toString()) ? 0 : Double.parseDouble(obj.toString())));
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					row++;
				}
			
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
	
	public List<String[]> statReport(ReportParam reportParam){
		//表一二
		ReportParam p1 = getCommonParam(reportParam);
		p1.setName("12");
		p1.setIs206("206");
		List<String[]> list = statSubReport(p1, null, 0);
		//表三
		ReportParam p3 = getCommonParam(reportParam);
		p3.setName("3");
		p3.setIs206("206");
		statSubReport(p3, list, 0);		
		list.add(this.hejiSubReport("206", "小计", list));
		//表一二
		ReportParam p2 = getCommonParam(reportParam);
		p2.setName("12");
		p2.setIs206("not206");
		List<String[]> tempList = statSubReport(p2, null, 0);
		list.addAll(tempList);
		//表三
		ReportParam p4 = getCommonParam(reportParam);
		p4.setName("3");
		p4.setIs206("not206");
		statSubReport(p4, list, 2);
		list.add(this.hejiSubReport("not206", "小计", tempList));
		//总合计
		list.add(this.hejiSubReport(null, "总计", list));
		return list;
	}
	
	private ReportParam getCommonParam(ReportParam reportParam){
		ReportParam p = new ReportParam();
		p.setYear(reportParam.getYear());
		p.setMonth(reportParam.getMonth());
		p.setYear2(reportParam.getYear2());
		p.setMonth2(reportParam.getMonth2());
		return p;
	}
	
	private List<String[]> statSubReport(ReportParam reportParam, List<String[]> list, int startIndex){
		
		String month = reportParam.getMonth();
		String month2 = reportParam.getMonth2();
		//int monthCount = Math.abs(Integer.parseInt(month2) - Integer.parseInt(month)) + 1;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select ");
		if ("206".equals(reportParam.getIs206()))
			sql.append("'北部山区', ");
		else
			sql.append("'非北部山区', ");
		sql.append("a.name as '区（县）', ");
//		sql.append("sum((select count(f2.id)  ");
//		sql.append("from fp_family f2  ");
//		sql.append("LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id ");
//		sql.append("where c2.id=c.id)) as '贫困户数', ");		
		sql.append("(select count(f2.id) ");
		sql.append("from fp_family f2 left outer join fp_diqu c2 on f2.cun_id=c2.id ");
		sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
		sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
		sql.append("where a2.id=a.id ");
		if ("206".equals(reportParam.getIs206())) {
			sql.append("and (z2.name = '温泉镇' or ");
			sql.append("z2.name = '吕田镇' or ");
			sql.append("z2.name = '良口镇' or ");
			sql.append("z2.name = '鳌头镇' or ");
			sql.append("z2.name = '小楼镇' or ");
			sql.append("z2.name = '正果镇' or ");
			sql.append("z2.name = '派潭镇' or ");
			sql.append("z2.name = '梯面镇' or ");
			sql.append("z2.name = '流溪河林场' ");
			sql.append(") ");
			sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
		}else if ("not206".equals(reportParam.getIs206())){
			sql.append("and ((z2.name != '温泉镇' and   ");
			sql.append("z2.name != '吕田镇' and   ");
			sql.append("z2.name != '良口镇' and   ");
			sql.append("z2.name != '鳌头镇' and   ");
			sql.append("z2.name != '小楼镇' and   ");
			sql.append("z2.name != '正果镇' and   ");
			sql.append("z2.name != '派潭镇' and   ");
			sql.append("z2.name != '梯面镇' and   ");
			sql.append("z2.name != '流溪河林场' ");
			sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
		}
		sql.append(") as '贫困户数', ");
		//sql.append("sum(c.poorPersonNum)  as '贫困人口数', ");		
		sql.append("(select sum(c2.poorPersonNum) ");
		sql.append("from fp_diqu c2 ");
		sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
		sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
		sql.append("where a2.id=a.id and c2.diqu_type='cun' ");
		if ("206".equals(reportParam.getIs206())) {
			sql.append("and (z2.name = '温泉镇' or ");
			sql.append("z2.name = '吕田镇' or ");
			sql.append("z2.name = '良口镇' or ");
			sql.append("z2.name = '鳌头镇' or ");
			sql.append("z2.name = '小楼镇' or ");
			sql.append("z2.name = '正果镇' or ");
			sql.append("z2.name = '派潭镇' or ");
			sql.append("z2.name = '梯面镇' or ");
			sql.append("z2.name = '流溪河林场' ");
			sql.append(") ");
			sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
		}else if ("not206".equals(reportParam.getIs206())){
			sql.append("and ((z2.name != '温泉镇' and   ");
			sql.append("z2.name != '吕田镇' and   ");
			sql.append("z2.name != '良口镇' and   ");
			sql.append("z2.name != '鳌头镇' and   ");
			sql.append("z2.name != '小楼镇' and   ");
			sql.append("z2.name != '正果镇' and   ");
			sql.append("z2.name != '派潭镇' and   ");
			sql.append("z2.name != '梯面镇' and   ");
			sql.append("z2.name != '流溪河林场' ");
			sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
		}
		sql.append(") as '贫困人数', ");
		if ("3".equals(reportParam.getName())) {
			//sql.append("sum(r.item1) as '规划投入资金（元）', ");
			sql.append("(select sum(t2.i1) from ( ");
			sql.append("select r2.item1 as 'i1', a2.id as aid from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on z2.id=c2.zhen_id ");
			sql.append("left outer join fp_diqu a2 on a2.id=z2.area_id ");
			sql.append("left outer join fp_report r2 on r2.cun_id=c2.id ");
			sql.append("and r2.report_type=2 and r2.type='month' ");			
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");			
			sql.append("where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append("group by a2.name,z2.name,c2.name ");
			sql.append("order by r2.year desc, r2.time desc) t2 where aid=a.id) as '预计本年脱贫户数(户) ', ");			
			
			sql.append("sum(r.item2) as '已投入帮扶资金(元)', ");
			sql.append("sum(r.item3) as '用于帮扶到户资金(元)', ");
			sql.append("sum(r.item4) as '用于帮扶到村资金(元)', ");
			sql.append("sum(r.item5) as '财政专项(元)', ");
			sql.append("sum(r.item6) as '信贷资金(元)', ");
			sql.append("sum(r.item7) as '单位自筹(元)', ");
			sql.append("sum(r.item8) as '社会募捐(元)', ");
			sql.append("sum(r.item9) as '社会引资(元)' ");
		} else {
			//sql.append("sum(c.poorFamilyNum1)/"+monthCount+" as '1低保对象(户) ', ");
			sql.append("(select sum(c2.poorFamilyNum1) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '1低保对象(户) ', ");
			
			
			//sql.append("sum(c.poorPersonNum1)/"+monthCount+" as '1低保对象(人) ', ");
			sql.append("(select sum(c2.poorPersonNum1) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '1低保对象(人) ', ");
			
			//sql.append("sum(c.poorFamilyNum3)/"+monthCount+" as '1低收入困难家庭(户) ', ");
			sql.append("(select sum(c2.poorFamilyNum3) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '1低收入困难家庭(户) ', ");
			
			//sql.append("sum(c.poorPersonNum3)/"+monthCount+" as '1低收入困难家庭(人) ', ");
			sql.append("(select sum(c2.poorPersonNum3) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '1低收入困难家庭(人) ', ");
			
			//sql.append("sum(c.poorFamilyNum2)/"+monthCount+" as '2低保对象(户) ', ");
			sql.append("(select sum(c2.poorFamilyNum2) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '2低保对象(户) ', ");
			
			//sql.append("sum(c.poorPersonNum2)/"+monthCount+" as '2低保对象(人) ', ");
			sql.append("(select sum(c2.poorPersonNum2) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '2低保对象(人) ', ");
			
			//sql.append("sum(c.poorFamilyNum4)/"+monthCount+" as '2低收入困难家庭(户) ', ");
			sql.append("(select sum(c2.poorFamilyNum4) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '2低收入困难家庭(户) ', ");
			
			//sql.append("sum(c.poorPersonNum4)/"+monthCount+" as '2低收入困难家庭(人) ', ");
			sql.append("(select sum(c2.poorPersonNum4) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '2低收入困难家庭(人) ', ");
			
			//sql.append("sum(c.weiHouse)/"+monthCount+" as '危房户(户) ',");
			sql.append("(select sum(c2.weiHouse) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '危房户(户) ', ");
			
			sql.append("sum(r.item12) as '贫困户去世、失踪等情况(户) ', ");
	
			//sql.append("r.item13 as '预计本年脱贫户数(户) ', ");			
			sql.append("(select sum(t2.i13) from ( ");
			sql.append("select r2.item13 as 'i13', a2.id as aid from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on z2.id=c2.zhen_id ");
			sql.append("left outer join fp_diqu a2 on a2.id=z2.area_id ");
			sql.append("left outer join fp_report r2 on r2.cun_id=c2.id ");
			sql.append("and r2.report_type=1 and r2.type='month' ");			
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");			
			sql.append("where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append("group by a2.name,z2.name,c2.name ");
			sql.append("order by r2.year desc, r2.time desc) t2 where aid=a.id) as '预计本年脱贫户数(户) ', ");
			
			//sql.append("r.item14 as '预计本年脱贫人数(人) ', ");			
			sql.append("(select sum(t2.i14) from ( ");
			sql.append("select r2.item14 as 'i14', a2.id as aid from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on z2.id=c2.zhen_id ");
			sql.append("left outer join fp_diqu a2 on a2.id=z2.area_id ");
			sql.append("left outer join fp_report r2 on r2.cun_id=c2.id ");
			sql.append("and r2.report_type=1 and r2.type='month' ");			
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");			
			sql.append("where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append("group by a2.name,z2.name,c2.name ");
			sql.append("order by r2.year desc, r2.time desc) t2 where aid=a.id) as '预计本年脱贫人数(人) ', ");		
			
			sql.append("sum(r.item15) as '帮扶单位领导(人次) ', ");
			sql.append("sum(r.item16) as '帮扶单位干部　职工(人次) ', ");
			sql.append("sum(r.item17) as '种植(户) ', ");
			sql.append("sum(r.item18) as '养殖(户) ', ");
			sql.append("sum(r.item19) as '务工(人) ', ");
			sql.append("sum(r.item20) as '创业(人) ', ");
			sql.append("sum(r.item21) as '农业科技培训(人次)', ");
			sql.append("sum(r.item22) as '就业技能培训(人次) ', ");
			sql.append("sum(r.item23) as '完成危房改造(户) ', ");
			sql.append("sum(r.item24) as '参加农村合作医疗(人) ', ");
			sql.append("sum(r.item25) as '参加农村养老保险(人) ', ");
			sql.append("sum(r.item26) as '义务教育阶段(人) ', ");
			sql.append("sum(r.item27) as '高中、职高、技校、中专等(人) ', ");
			sql.append("sum(r.item28) as '大专、本科以上(人) ', ");
			sql.append("sum(r.item29) as '产业发展带动农户(户) ', ");
			//sql.append("sum(c.income)/"+monthCount+" as '上年村级集体经济收入(元) ', ");
			sql.append("(select sum(c2.income) ");
			sql.append("from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on c2.zhen_id=z2.id ");
			sql.append("left outer join fp_diqu a2 on z2.area_id=a2.id ");
			sql.append("where a2.id=a.id ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append(") as '上年村级集体经济收入(元) ', ");
			
			//sql.append("sum(r.item31)/"+monthCount+" as '预计今年村级集体经济收入(元) ', ");
			sql.append("(select sum(t2.i31) from ( ");
			sql.append("select r2.item31 as 'i31', a2.id as aid from fp_diqu c2 ");
			sql.append("left outer join fp_diqu z2 on z2.id=c2.zhen_id ");
			sql.append("left outer join fp_diqu a2 on a2.id=z2.area_id ");
			sql.append("left outer join fp_report r2 on r2.cun_id=c2.id ");
			sql.append("and r2.report_type=1 and r2.type='month' ");			
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('" + reportParam.getYear() + "-" + reportParam.getMonth() + "-01','%Y-%m-%d') ");
			sql.append("and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('" + reportParam.getYear2() + "-" + reportParam.getMonth2() + "-01','%Y-%m-%d') ");			
			sql.append("where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' ");
			if ("206".equals(reportParam.getIs206())) {
				sql.append("and (z2.name = '温泉镇' or ");
				sql.append("z2.name = '吕田镇' or ");
				sql.append("z2.name = '良口镇' or ");
				sql.append("z2.name = '鳌头镇' or ");
				sql.append("z2.name = '小楼镇' or ");
				sql.append("z2.name = '正果镇' or ");
				sql.append("z2.name = '派潭镇' or ");
				sql.append("z2.name = '梯面镇' or ");
				sql.append("z2.name = '流溪河林场' ");
				sql.append(") ");
				sql.append("and c2.name != '塘田村' and c2.name != '安山村' ");
			}else if ("not206".equals(reportParam.getIs206())){
				sql.append("and ((z2.name != '温泉镇' and   ");
				sql.append("z2.name != '吕田镇' and   ");
				sql.append("z2.name != '良口镇' and   ");
				sql.append("z2.name != '鳌头镇' and   ");
				sql.append("z2.name != '小楼镇' and   ");
				sql.append("z2.name != '正果镇' and   ");
				sql.append("z2.name != '派潭镇' and   ");
				sql.append("z2.name != '梯面镇' and   ");
				sql.append("z2.name != '流溪河林场' ");
				sql.append(") or c2.name = '塘田村' or c2.name = '安山村') ");
			}
			sql.append("group by a2.name,z2.name,c2.name ");
			sql.append("order by r2.year desc, r2.time desc) t2 where aid=a.id) as '预计今年村级集体经济收入(元) ', ");
			
			sql.append("sum(r.item32) as '组织活动(次) ', ");
			sql.append("sum(r.item33) as '扶贫工作会议(次) ', ");
			sql.append("sum(r.item34) as '发展新党员(人) ', ");
			sql.append("sum(r.item35) as '文娱体育(次) ', ");
			sql.append("sum(r.item36) as '送医送药(次) ', ");
			sql.append("sum(r.item37) as '科技下乡(次) ', ");
			sql.append("sum(r.item38) as '其他(次) ', ");
			sql.append("sum(r.item39) as '工业开发项目(个) ', ");
			sql.append("sum(r.item40) as '商贸旅游项目(个) ', ");
			sql.append("sum(r.item41) as '农业开发项目(个) ', ");
			sql.append("sum(r.item42) as '手工加工项目(个) ', ");
			sql.append("sum(r.item43) as '招商引资项目(个) ', ");
			sql.append("sum(r.item44) as '企业捐建项目(个) ', ");
			sql.append("sum(r.item45) as '硬底化村道(公里) ', ");
			sql.append("sum(r.item46) as '安装路灯村道(公里) ', ");
			sql.append("sum(r.item47) as '二次改水工程(个) ', ");
			sql.append("sum(r.item48) as '生活污水处理设施(个) ', ");
			sql.append("sum(r.item49) as '农田水利设施(个) ', ");
			sql.append("sum(r.item50) as '受益农田(鱼塘)面积(亩) ', ");
			sql.append("sum(r.item51) as '标准农田(鱼塘)(亩) ', ");
			sql.append("sum(r.item52) as '村委会(个) ', ");
			sql.append("sum(r.item53) as '文化室(个) ', ");
			sql.append("sum(r.item54) as '卫生站(个) ', ");
			sql.append("sum(r.item55) as '环卫设施(个) ', ");
			sql.append("sum(r.item56) as '体育设施(个) ', ");
			sql.append("sum(r.item57) as '其他(个) ' ");
		}
		sql.append("from fp_diqu c ");
		sql.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sql.append("left outer join fp_diqu a on a.id=z.area_id ");
		if ("3".equals(reportParam.getName())) 
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.report_type=2 and r.type='month' ");
		if ("12".equals(reportParam.getName())) 
			sql.append("left outer join fp_report r on r.cun_id=c.id and r.report_type=1 and r.type='month' ");
		 
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
		sql.append("group by a.name");

		logger.info("报表统计生成sql：\n" + sql);
		Session s = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			//统计表一二
			List<String[]> rows = new ArrayList<String[]>();
			if ("3".equals(reportParam.getName())){
				rows = list;
			}
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			conn = s.connection();
			// 获取数据
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				if ("12".equals(reportParam.getName())){
					String[] row = new String[120];
					for(int j=0;j<2;j++)
						row[j] = rs.getString(j+1);
					for(int j=2;j<=58;j++){
						Double d = rs.getDouble(j + 1);
						row[j] = new BigDecimal(d).toPlainString();
						int index = row[j].indexOf(".");
						if(index > -1){
							String num2 = row[j].substring(index+1);   
							if(num2.length() > 2)
							row[j] = row[j].substring(0, index + 3);
						}
					}
					rows.add(row);
				}else if ("3".equals(reportParam.getName())){
					String[] row = rows.get(startIndex++);
					int i = 5;
					for(int j=100;j<109;j++){
						Double d = rs.getDouble(i++);
						row[j] = new BigDecimal(d).toPlainString();
						int index = row[j].indexOf(".");
						if(index > -1){
							String num2 = row[j].substring(index+1);   
							if(num2.length() > 2)
							row[j] = row[j].substring(0, index + 3);
						}
					}
				}
			}
			return rows;
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
	
	private boolean isIntNumber(String number){
		if(number.indexOf("E") > -1 || number.indexOf("e") > -1)
			return false;
		int index = number.indexOf(".");
		if(index < 0){
				return true;
		}else{
			String num1 = number.substring(0,index);
			String num2 = number.substring(index+1);   
			long i = Long.valueOf(num2);
			if(i == 0)
				return true;
		}
		return false;
	}
	
	private double round(double d){
		int i = (int)(d * 100);
		return new BigDecimal(i).divide(new BigDecimal(100.0)).doubleValue();
	}
	
	private String[] hejiSubReport(String is206, String heji, List<String[]> list){
		String[] arr = new String[120];
		if ("206".equals(is206))
			arr[0] = "北部山区";
		else if ("not206".equals(is206))
			arr[0] = "非北部山区";
		else
			arr[0] = null;
		arr[1] = heji;
		for(String[] data : list){
			if("总计".equals(heji) && "小计".equals(data[1])){
				continue;
			}
			for (int i = 2; i < data.length; i++) {
				if(arr[i] == null)
					arr[i] = "0";
				try {
					Double d = Double.valueOf(data[i]);
					Double old = Double.valueOf(arr[i]);
					arr[i] = new BigDecimal(d).add(new BigDecimal(old)).toPlainString();
					int index = arr[i].indexOf(".");
					if(index > -1){
						String num2 = arr[i].substring(index+1);   
						if(num2.length() > 2)
						arr[i] = arr[i].substring(0, index + 3);
					}
				} catch (Exception e) {
					//ignore
				}
			}
		}
		return arr;
	}
	
	public void autoSaveReports(int year, int month){
		String hql = "from Cun";
		List<Cun> cunList = this.getHibernateTemplate().find(hql);
		for(Cun cun : cunList){
			if(cun.getOrg() != null){
				//表一表二
				hql = "from Report1 where type='month' and year=? and time=? and cun=?";
				List<Report1> r1List = this.getHibernateTemplate().find(hql, new Object[]{year, month + "",cun});
				if(r1List != null && r1List.size() > 0){//存在，或已经暂存过来
					Report1 r1 = r1List.get(0);
					if(r1.getLock() != 1){
						r1.setLock(1);//锁定
						this.saveOrUpdate(r1);
					}
				}else{
					Report report = getReport("1", cun.getOrg(), cun, year, "month", month + "");
					for (int i = 1; i <= 60; i++) {
						report.setItem(i, "0");
					}
					report.setCun(cun);
					report.setOrg(cun.getOrg());
					report.setYear(year);
					report.setType("month");
					report.setTime(month + "");
					report.setLock(1);// 1表示已经锁定
					saveOrUpdate(report);
				}
				//表三
				hql = "from Report2 where type='month' and year=? and time=? and cun=?";
				List<Report2> r2List = this.getHibernateTemplate().find(hql, new Object[]{year, month + "", cun});
				if(r2List != null && r2List.size() > 0){//存在，或已经暂存过来
					Report2 r2 = r2List.get(0);
					if(r2.getLock() != 1){
						r2.setLock(1);//锁定
						this.saveOrUpdate(r2);
					}
				}else{
					Report report = getReport("2", cun.getOrg(), cun, year, "month", month + "");
					for (int i = 1; i <= 60; i++) {
						report.setItem(i, "0");
					}
					report.setCun(cun);
					report.setOrg(cun.getOrg());
					report.setYear(year);
					report.setType("month");
					report.setTime(month + "");
					report.setLock(1);// 1表示已经锁定
					saveOrUpdate(report);
				}
			}
		}
	}
	
	public List<State> state(int rType,int year){
		List<State> list = new ArrayList<State>();
		
		StringBuffer sb = new StringBuffer();
		sb.append("select a.name as aName, z.name as zName, c.name as cName, ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='1' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='2' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='3' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='4' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='5' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='6' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='7' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='8' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='9' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='10' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='11' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id), ");
		sb.append("(select count(*) from fp_report r where r.report_type="+rType+" and r.type='month' and r.time='12' and r.year="+year+" and r.lock_status=1 and r.cun_id=c.id) ");
		sb.append("from fp_diqu c ");
		sb.append("left outer join fp_diqu z on z.id=c.zhen_id ");
		sb.append("left outer join fp_diqu a on a.id=z.area_id ");
		sb.append("where c.diqu_type='cun' ");
		
		try {
			Session s = this.getHibernateTemplate().getSessionFactory().openSession();
			Connection conn = s.connection();
			PreparedStatement ps = conn.prepareStatement(sb.toString());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				State st = new State();
				st.setArea(rs.getString(1));
				st.setZhen(rs.getString(2));
				st.setCun(rs.getString(3));
				for(int i=4;i<=15;i++){
					int count = rs.getInt(i);
					st.setOk(i-3, count>0?"Y":"");
				}
				list.add(st);
			}
			s.close();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
