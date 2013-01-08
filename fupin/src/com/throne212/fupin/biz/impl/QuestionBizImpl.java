package com.throne212.fupin.biz.impl;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.QuestionBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.CunDao;
import com.throne212.fupin.dao.QuestionDao;
import com.throne212.fupin.dataobject.State;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;

public class QuestionBizImpl extends BaseBizImpl implements QuestionBiz {
	
	private QuestionDao qDao;
	
	private CunDao cunDao;
	
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int year = 2011;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		return qDao.listQuestion1(areaId, zhenId, cunId, pageIndex, year);
	}

	public String importQuestion1(String fileName) throws Exception{
		
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			throw new RuntimeException("缺少年份"); 
		
		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		
		String title = sheet.getCell(0, 0).getContents();
		if(title!=null && !title.contains("一")){
			throw new RuntimeException("导入失败，请检查数据及其格式是否完整和准确");
		}
		
		String cunName = sheet.getCell(1, 1).getContents();
		//检验,表一的导入可以用贫困村的名字来判断导入的是那个村
		Cun cun = cunDao.getCunByFullName(cunName);
		if(cun == null){
			throw new RuntimeException("村("+cunName+")获取失败");
		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			Org org = (Org) user;
			if(org.getCun() == null || !org.getCun().getId().equals(cun.getId())){
				logger.error("org.getCun()=" + org.getCun() + ", org.getCun().getId()="+ org.getCun().getId() + ",cun.getId()="+cun.getId() + ",org.getCun().getId() != cun.getId()"+(org.getCun().getId() != cun.getId()));
				throw new RuntimeException("单位帮扶的村与上传报表中的村不符");
			}
		}
		
		String orgName = sheet.getCell(3, 1).getContents();
		
		try {
			
			Question1 q1 = null;
			List<Question1> q1List = qDao.getEntitiesByTwoColumn(Question1.class, "cun", cun, "year", year);
			if(q1List == null || q1List.size() == 0){
				q1 = new Question1();
				q1.setCreateDate(new Date());
				q1.setYear(year);
			}else{
				q1 = q1List.get(0);
			}
			q1.setCun(cun);
			
			Org org = cunDao.getEntityByUniqueColumn(Org.class, "orgName", orgName);
			if(org == null)
				org = cun.getOrg();
			q1.setOrg(org);
			
			int index = 1;
			for(int i=4;i<=121;i++){
				String col1 = sheet.getCell(0, i).getContents();
				if(col1!=null && col1.matches("\\d{3}")){
					String str = sheet.getCell(3,i).getContents();
					if(Util.isEmpty(str)){
						throw new RuntimeException("不允许留空");
					}
					double val = 0;
					try {
						val = Double.valueOf(str);
					} catch (Exception e) {
						e.printStackTrace();
					}
					q1.setItem(index++, val);
				}
			}
			
			//校验
			//通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数
			if(q1.getItem15()>q1.getItem14() || 
					q1.getItem16()>q1.getItem14() || 
					q1.getItem17()>q1.getItem14() || 
					q1.getItem18()>q1.getItem14() || 
					q1.getItem19()>q1.getItem14() || 
					q1.getItem20()>q1.getItem14()){
				throw new RuntimeException("通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数");
			}
			//帮扶资金总量
			if(q1.getItem25()!=(q1.getItem26()+
					q1.getItem27()+
					q1.getItem28()+
					q1.getItem29()+
					q1.getItem30()+
					q1.getItem31()+
					q1.getItem32()+
					q1.getItem33())){
				throw new RuntimeException("帮扶资金总量与分量的总和不符");
			}
			//扶贫专项资金,支出资金数额≤到账资金数额,到账资金支出率=支出资金数额÷到账资金数额
			if(q1.getItem35() > q1.getItem34()){
				throw new RuntimeException("扶贫专项资金,支出资金数额≤到账资金数额");
			}
			double rate = (q1.getItem35()/q1.getItem34()) * 100;
			if(((int)rate) != q1.getItem36().intValue()){
				throw new RuntimeException("扶贫专项资金,到账资金支出率=支出资金数额÷到账资金数额");
			}
			
			//贫困户总户/人数
			if(q1.getItem40() + q1.getItem42() != q1.getItem37()){
				throw new RuntimeException("贫困户总户数=有劳动能力的贫困户户数+无劳动能力的贫困户户数");
			}
			if(q1.getItem41() + q1.getItem43() != q1.getItem38()){
				throw new RuntimeException("贫困户总户数=有劳动能力的贫困户户数+无劳动能力的贫困户户数");
			}
			
			//当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数
			rate = (q1.getItem45() / q1.getItem40()) * 100;
			if(((int)rate) != q1.getItem46().intValue()){
				throw new RuntimeException("当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数");
			}
			
			//参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
			if(q1.getItem51() > q1.getItem49() - q1.getItem50()){
				throw new RuntimeException("参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
			}
			//贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
			rate = (q1.getItem51() / (q1.getItem49() - q1.getItem50())) * 100;
			if(((int)rate) != q1.getItem52().intValue()){
				throw new RuntimeException("贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
			}
			
			//务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
			if(q1.getItem53() > q1.getItem49() - q1.getItem50()){
				throw new RuntimeException("务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
			}
			//贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
			rate = (q1.getItem53() / (q1.getItem49() - q1.getItem50())) * 100;
			if(((int)rate) != q1.getItem54().intValue()){
				throw new RuntimeException("贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
			}
			
			//贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数
			rate = (q1.getItem61() / q1.getItem38()) * 100;
			if(((int)rate) != q1.getItem62().intValue()){
				throw new RuntimeException("贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数");
			}
			
			//贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数
			rate = (q1.getItem64() / q1.getItem39()) * 100;
			if(((int)rate) != q1.getItem65().intValue()){
				throw new RuntimeException("贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数");
			}
			
			//设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他
			if(q1.getItem82()!=(q1.getItem83()+
					q1.getItem84()+
					q1.getItem85()+
					q1.getItem86()+
					q1.getItem87()+
					q1.getItem88()+
					q1.getItem89())){
				throw new RuntimeException("基础建设设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他");
			}
			
			//惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他
			if(q1.getItem91()!=(q1.getItem92()+
					q1.getItem93()+
					q1.getItem94()+
					q1.getItem95()+
					q1.getItem96())){
				throw new RuntimeException("惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他");
			}
			
			
			//填表人和日期
			Date date = null;
			String writer = null;
			String theStr = sheet.getCell(0,122).getContents();
			if(theStr.contains("填表人") && theStr.contains("日期")){
				writer = theStr.substring(theStr.indexOf("：")+1, theStr.lastIndexOf("填")).trim();
				String dateStr = theStr.substring(theStr.lastIndexOf("：")+1);
				date = Util.getDateByTxtChina(dateStr.replaceAll("\\s", "").trim());
			}
			q1.setWriter(writer);
			q1.setDate(date);
			
			this.saveOrUpdateEntity(q1);
			sb.append("资料导入成功，村名:" + cunName);
			workbook.close();
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("导入失败，请检查数据及其格式是否完整和准确");
		}

		return sb.toString();
	}

	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int year = 2011;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		return qDao.listQuestion2(areaId, zhenId, cunId,familyName, pageIndex, year);
	}

	public String importQuestion2(String fileName) throws Exception{
		
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			throw new RuntimeException("缺少年份"); 

		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet[] sheets = workbook.getSheets();
		
		try {
		
			for(int j=0;j<sheets.length;j++){
				Sheet sheet = workbook.getSheet(j);
				if(sheet.getRows()<1 || sheet.getColumns()<1 || sheet.getCell(0,0) == null || "".equals(sheet.getCell(0,0).getContents()))
					continue;
				String title = sheet.getCell(0, 0).getContents();
				if(title!=null && !title.contains("二")){
					continue;
				}
				
				String idNo = sheet.getCell(3, 57).getContents();
				if(Util.isEmpty(idNo) || (idNo.trim().length()!=15 && idNo.trim().length()!=18)){
					throw new RuntimeException("户主的身份证("+idNo+")为空或格式错误," + sheet.getName());
				}
				idNo = idNo.trim();
				//检验,表二按照身份证号码
				Family family = cunDao.getEntityByUniqueColumn(Family.class, "idNo", idNo);
				if(family == null){
					throw new RuntimeException("户主的身份证("+idNo+")不存在与系统中," + sheet.getName());
				}
				User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
				if(user instanceof Org){
					Org org = (Org) user;
					if(org.getCun() == null || !org.getCun().getId().equals(family.getCun().getId())){
						throw new RuntimeException("户(身份证号："+idNo+")不属于单位帮扶的村("+org.getCun().getName()+")");
					}
				}
				String orgName = sheet.getCell(3, 1).getContents();
				
				Question2 q2 = null;
				List<Question2> q2List = qDao.getEntitiesByTwoColumn(Question2.class, "family", family, "year", year);
				if(q2List == null || q2List.size() == 0){
					q2 = new Question2();
					q2.setCreateDate(new Date());
					q2.setYear(year);
				}else{
					q2 = q2List.get(0);
				}
				q2.setFamily(family);
				
				Org org = cunDao.getEntityByUniqueColumn(Org.class, "orgName", orgName);
				if(org == null)
					org = family.getCun().getOrg();
				q2.setOrg(org);
				
				int index = 1;
				for(int i=4;i<=55;i++){
					String col1 = sheet.getCell(0, i).getContents();
					if(col1!=null && col1.matches("\\d{3}")){
						String str = sheet.getCell(3,i).getContents();
						if(Util.isEmpty(str)){
							throw new RuntimeException("不允许留空");
						}
						double val = 0;
						try {
							val = Double.valueOf(str);
						} catch (Exception e) {
							e.printStackTrace();
						}
						q2.setItem(index++, val);
					}
				}
				
				//当年家庭人均年收入=（工资收入+家庭生产经营收入+其他稳定性收入+转移性收入-家庭生产经营支出）÷家庭成员人数
				if(Math.floor(q2.getItem4())
						!=Math.floor((q2.getItem5()+q2.getItem6()+q2.getItem10()+q2.getItem17()-q2.getItem24())/q2.getItem2())){
					throw new RuntimeException("当年家庭人均年收入=（工资收入+家庭生产经营收入+其他稳定性收入+转移性收入-家庭生产经营支出）÷家庭成员人数," + sheet.getName());
				}
				
				//家庭生产经营收入=农业生产经营收入+工业建筑业生产经营收入+其他行业生产经营收入
				if(q2.getItem6() != (q2.getItem7()+q2.getItem8()+q2.getItem9())){
					throw new RuntimeException("家庭生产经营收入=农业生产经营收入+工业建筑业生产经营收入+其他行业生产经营收入," + sheet.getName());
				}
				
				//其他稳定性收入=财产性收入+退休养老金
				if(q2.getItem10().intValue() != (q2.getItem11().intValue()+q2.getItem16().intValue())){
					throw new RuntimeException("其他稳定性收入=财产性收入+退休养老金," + sheet.getName());
				}
				
				//转移性收入=亲友赠送+慰问金+抚恤救灾救济金+低保金+农业生产补贴和临时补贴+其他转移性收入
				if(q2.getItem17() != (q2.getItem18()+q2.getItem19()+q2.getItem20()+q2.getItem21()+q2.getItem22()+q2.getItem23())){
					throw new RuntimeException("转移性收入=亲友赠送+慰问金+抚恤救灾救济金+低保金+农业生产补贴和临时补贴+其他转移性收入," + sheet.getName());
				}
				
				//家庭生产经营支出=农业生产经营支出+工业建筑业生产经营支出+其他行业生产经营支出
				if(q2.getItem24() != (q2.getItem25()+q2.getItem26()+q2.getItem27())){
					throw new RuntimeException("家庭生产经营支出=农业生产经营支出+工业建筑业生产经营支出+其他行业生产经营支出," + sheet.getName());
				}
				
				//填表人和日期
				Date date = null;
				String writer = sheet.getCell(1,56).getContents();
				String theStr = sheet.getCell(3,56).getContents();
				try {
					date = Util.getDateByTxtChina(theStr.replaceAll("\\s", "").trim());
				} catch (Exception e) {
					e.printStackTrace();
				}
				q2.setWriter(writer);
				q2.setDate(date);
				
				this.saveOrUpdateEntity(q2);
				sb.append("资料导入成功，户名:" + family.getName()+"("+idNo+")");
				sb.append("\\n");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("导入失败，请检查数据及其格式是否完整和准确,");
		} finally{
			if(workbook != null)
				workbook.close();
		}
		
		return sb.toString();
	
	}
	
	public String getQ1ExcelReportFilePath(Question1 q1) throws Exception{
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "question";
		String sourceFile = path + File.separator + "q1.xls";
		String targetFile = path + File.separator + "q1_"+System.currentTimeMillis()+".xls";

		// 打开excel文件
		Workbook rw = Workbook.getWorkbook(new File(sourceFile));
		WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
		WritableSheet sheet = workbook.getSheet(0);
		
		sheet.addCell(new Label(1, 1, q1.getCun().getZhen().getArea().getName() + q1.getCun().getZhen().getName() + q1.getCun().getName()));
		sheet.addCell(new Label(3, 1, q1.getOrg().getOrgName()));
		
		int num = 1;
		//从第5行开始
		for(int i=4;i<126;i++){
			if(!Util.isEmpty(sheet.getCell(0, i).getContents())){
				double d = q1.getItem(num++);
				if(d > 1000000){
					sheet.addCell(new Label(3, i, DecimalFormat.getNumberInstance().format(d)));
				}else{
					sheet.addCell(new Number(3, i, d));
				}
			}
		}
		
		sheet.addCell(new Label(0, 126, "填表人："+q1.getWriter()+"          填报日期：  " + Util.getDate2(q1.getDate())));
		
		
		// 关闭
		workbook.write();
		workbook.close();
		rw.close();
		return targetFile;

	}
	
	public String getQ1StatExcelReportFilePath(Long areaId, Long zhenId) throws Exception{
		
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			throw new RuntimeException("缺少年份"); 
		
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "question";
		String sourceFile = path + File.separator + "q1_stat.xls";
		String targetFile = path + File.separator + "q1_stat_"+System.currentTimeMillis()+".xls";

		// 打开excel文件
		Workbook rw = Workbook.getWorkbook(new File(sourceFile));
		WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
		WritableSheet sheet = workbook.getSheet(0);
		
		QuestionStatDO q = qDao.statQuestion1(areaId, zhenId, year);
		
		String diqu = "";
		if(areaId != null){
			Area area = qDao.getEntityById(Area.class, areaId);
			diqu += area==null?"":area.getName();
		}
		if(zhenId != null){
			Zhen zhen = qDao.getEntityById(Zhen.class, zhenId);
			diqu += zhen==null?"":zhen.getName();
		}
		
		sheet.addCell(new Label(1, 1, diqu));
		
		int i = 1;
		//从第5行开始
		for(int n=4;n<122;n++){
			if(!Util.isEmpty(sheet.getCell(0, n).getContents())){
				if(i==2 || i==3 || i==6 || i==7 || i==8 || i==9 || i==10 
						|| i==11 || i==12 || i==13 || i==24 || i==47 || i==76 || i==77 
						|| i==97 || i==98 || i==99 || i==100){
					int[] num = q.getNum(i);
					String codeStr = "";
					if(num!=null)
						codeStr = "1:" + num[0] + ",2:" + num[1];
					sheet.addCell(new Label(3, n, codeStr));
				}else{
					sheet.addCell(new Number(3, n, q.getQ().getItem(i)));
				}
				i++;
			}
		}
		
		// 关闭
		workbook.write();
		workbook.close();
		rw.close();
		return targetFile;
	}
	
	public String getQ2ExcelReportFilePath(Question2 q2) throws Exception{
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "question";
		String sourceFile = path + File.separator + "q2.xls";
		String targetFile = path + File.separator + "q2_"+System.currentTimeMillis()+".xls";

		// 打开excel文件
		Workbook rw = Workbook.getWorkbook(new File(sourceFile));
		WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
		WritableSheet sheet = workbook.getSheet(0);
		
		Cun cun = q2.getFamily().getCun();
		sheet.addCell(new Label(1, 1, cun.getZhen().getArea().getName() + cun.getZhen().getName() + cun.getName()));
		sheet.addCell(new Label(3, 1, q2.getOrg().getOrgName()));
		
		int num = 1;
		//从第5行开始
		for(int i=4;i<56;i++){
			if(!Util.isEmpty(sheet.getCell(0, i).getContents())){
				if(i>=8 && i<=31){
					sheet.addCell(new Label(3, i, DecimalFormat.getNumberInstance().format(q2.getItem(num++))));
				}else{
					sheet.addCell(new Number(3, i, q2.getItem(num++)));
				}
			}
		}
		
		
		
		sheet.addCell(new Label(1, 56, q2.getWriter()));
		sheet.addCell(new Label(3, 56, Util.getDate2(q2.getDate())));
		sheet.addCell(new Label(1, 57, q2.getFamily().getName()));
		sheet.addCell(new Label(3, 57, q2.getFamily().getIdNo()));
		
		// 关闭
		workbook.write();
		workbook.close();
		rw.close();
		return targetFile;
	}
	
	public String getQ2StatExcelReportFilePath(Long areaId, Long zhenId, Long cunId) throws Exception{
		
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			throw new RuntimeException("缺少年份"); 
		
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "question";
		String sourceFile = path + File.separator + "q2_stat.xls";
		String targetFile = path + File.separator + "q2_stat_"+System.currentTimeMillis()+".xls";

		// 打开excel文件
		Workbook rw = Workbook.getWorkbook(new File(sourceFile));
		WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
		WritableSheet sheet = workbook.getSheet(0);
		
		QuestionStatDO q = qDao.statQuestion2(areaId, zhenId,cunId, year);
		
		String diqu = "";
		if(areaId != null){
			Area area = qDao.getEntityById(Area.class, areaId);
			diqu += area==null?"":area.getName();
		}
		if(zhenId != null){
			Zhen zhen = qDao.getEntityById(Zhen.class, zhenId);
			diqu += zhen==null?"":zhen.getName();
		}
		if(cunId != null){
			Cun cun = qDao.getEntityById(Cun.class, cunId);
			diqu += cun==null?"":cun.getName();
		}
		
		sheet.addCell(new Label(1, 1, diqu));
		
		int i = 1;
		//从第5行开始
		for(int n=4;n<56;n++){
			if(!Util.isEmpty(sheet.getCell(0, n).getContents())){
				if(i==1 || i==29){
					int[] num = q.getNum(i);
					String codeStr = "";
					if(num!=null)
						codeStr = "1:" + num[0] + ",2:" + num[1] + ",3:" + num[2] + ",4:" + num[3];
					sheet.addCell(new Label(3, n, codeStr));
				}else{
					sheet.addCell(new Number(3, n, q.getQ().getItem(i)));
				}
				i++;
			}
		}
		
		// 关闭
		workbook.write();
		workbook.close();
		rw.close();
		return targetFile;
	}
	
	public QuestionStatDO statQuestion1(Long areaId, Long zhenId){
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			return null;
		return qDao.statQuestion1(areaId, zhenId, year);
	}
	
	public QuestionStatDO statQuestion2(Long areaId, Long zhenId, Long cunId){
		int year = -1;
		String[] yearArr = (String[]) ActionContext.getContext().getParameters().get("year");
		if(yearArr != null && yearArr.length > 0){
			year = Integer.parseInt(yearArr[0]);
		}
		if(year < 0)
			return null;
		return qDao.statQuestion2(areaId, zhenId, cunId, year);
	}


	public PageBean<Family> getFamilyList(String familyName, Integer pageIndex, int year){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return qDao.getFamilyList(familyName, pageIndex, year);
	}
	
	public QuestionDao getqDao() {
		return qDao;
	}

	public void setqDao(QuestionDao qDao) {
		this.qDao = qDao;
	}

	public CunDao getCunDao() {
		return cunDao;
	}

	public void setCunDao(CunDao cunDao) {
		this.cunDao = cunDao;
	}
	
	public List<State> state(int type, int year){
		if(type == 1)
			return qDao.state1(year);
		else if(type == 2)
			return qDao.state2(year);
		return null;
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println("123".matches("\\d{3}"));
		String theStr = "填表人：梁仲俊  填报日期：2012年 3月  5日";
		System.out.println(theStr.substring(theStr.indexOf("：")+1, theStr.indexOf("填报日期")));
		System.out.println(theStr.substring(theStr.lastIndexOf("：")+1));
		System.out.println(Util.getDateByTxtChina("2012年 3月  5日"));
	}

}
