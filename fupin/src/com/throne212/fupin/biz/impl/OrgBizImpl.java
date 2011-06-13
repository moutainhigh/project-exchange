package com.throne212.fupin.biz.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ManagerDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Person;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;

public class OrgBizImpl extends BaseBizImpl implements OrgBiz {

	private ManagerDao managerDao;

	public ManagerDao getManagerDao() {
		return managerDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	public Org saveOrUpdateOrg(Org org) {

		if (org.getId() == null) {
			org.setCreateDate(new Date());
			baseDao.saveOrUpdate(org);
			logger.info("添加扶贫单位【" + org.getOrgName() + "】成功");
		} else {
			Org orgInDB = baseDao.getEntityById(Org.class, org.getId());
			org.setCreateDate(orgInDB.getCreateDate());
			baseDao.saveOrUpdate(org);
			logger.info("更新扶贫单位【" + org.getOrgName() + "】成功");
		}
		return org;

	}

	public PageBean getAllOrg(String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllManager(pageIndex);
		else
			return managerDao.getAllManager(name, pageIndex);
	}

	public PageBean getAllCun(String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllCun(pageIndex);
		else
			return managerDao.getAllCun(name, pageIndex);
	}

	public PageBean getAllCun(Zhen zhen, String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return managerDao.getAllCun(zhen, pageIndex);
	}

	public List getAllOrg() {
		return managerDao.getAll(Org.class);
	}

	public PageBean getAllFamily(String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllFamily(pageIndex);
		else
			return managerDao.getAllFamily(name, pageIndex);
	}
	
	public PageBean getAllFamily(String name,Integer pageIndex,Long areaId,Long zhenId,Long cunId){
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllFamily(pageIndex,areaId,zhenId,cunId);
		else
			return managerDao.getAllFamily(name, pageIndex, areaId,zhenId,cunId);
	}

	public PageBean getAllFamily(Org org, String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllFamily(org, pageIndex);
		else
			return managerDao.getAllFamily(org, name, pageIndex);
	}

	public PageBean getAllLeader(Org org, String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllLeader(org.getId(), pageIndex);
		else
			return managerDao.getAllLeader(org.getId(), name, pageIndex);
	}

	public String uploadCunData(String fileName) throws Exception {
		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		try {
			String cunName = sheet.getCell(1, 2).getContents();
			String peopleNum = sheet.getCell(3, 2).getContents();
			String familyNum = sheet.getCell(5, 2).getContents();
			String gengMianji = sheet.getCell(7, 2).getContents();
			String shanMianji = sheet.getCell(10, 2).getContents();
			String cunIncome = sheet.getCell(2, 3).getContents();
			String incomeFromUp = sheet.getCell(5, 3).getContents();
			String jitiTudi = sheet.getCell(8, 3).getContents();
			String project = sheet.getCell(2, 4).getContents();
			String resource = sheet.getCell(2, 5).getContents();
			String plan = sheet.getCell(2, 6).getContents();
			String situation = sheet.getCell(2, 7).getContents();

			Cun cun = null;
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user instanceof Org) {
				cun = ((Org) user).getCun();
				if (cun == null)
					throw new RuntimeException("该单位还没有指定帮扶的村，不可以进行这项操作。");
			} else {
				List<Cun> cunInDB = this.getAllLike(Cun.class, "name", cunName);
				if (cunInDB != null && cunInDB.size() > 0) {
					cun = cunInDB.get(0);
				} else {
					cun = new Cun();
				}
			}

			cun.setPersonNum(Integer.parseInt(peopleNum));
			cun.setFamilyNum(Integer.parseInt(familyNum));
			cun.setMianji(Integer.parseInt(gengMianji));
			// 山地面积缺失

			cun.setIncome(Double.parseDouble(cunIncome));
			// 上级收入缺失
			// 集体土地面积缺失

			cun.setItem(project);

			// 资源缺失
			// 计划缺失
			// 干部缺失

			this.saveOrUpdateEntity(cun);
			sb.append("导入成功，村的完整名称为：" + cun.getAbsName());

		} catch (RuntimeException e) {
			e.printStackTrace();
			sb.append("导入错误，请检查是否数据格式错误");
			throw new RuntimeException(sb.toString());
		}
		return sb.toString();
	}

	public String uploadFamilyData(String fileName) throws Exception {
		StringBuffer sb = new StringBuffer();
		int sum = 0;
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		int row = sheet.getRows();
		int cols = sheet.getColumns();
		for (int i = 1; i < row && !Util.isEmpty(sheet.getCell(0, i).getContents()); i++) {
			String area = sheet.getCell(0, i).getContents();
			String cun = sheet.getCell(1, i).getContents();
			String name = sheet.getCell(2, i).getContents();
			String idNo = sheet.getCell(3, i).getContents();
			String income = sheet.getCell(4, i).getContents();
			String type = sheet.getCell(5, i).getContents();
			String zhen = null;
			if (cols > 6)
				zhen = sheet.getCell(6, i).getContents();

			Family f = this.getEntityByUnique(Family.class, "idNo", idNo);
			// 覆盖
			if (f == null)
				f = new Family();
			else
				continue;

			// 类型
			if (f.getType() == null) {
				f.setType(3);// 默认贫困类型为3
			}

			Area a = (Area) this.getEntityByUnique(Area.class, "name", area);
			if (a == null) {
				sb.append("第" + (i + 1) + "行，数据错误,没有找到区县名:" + area);
				throw new RuntimeException(sb.toString());
			}

			Cun c = null;

			// 如果有镇的名字，就加入镇的判断
			if (!Util.isEmpty(zhen)) {
				Zhen z = (Zhen) this.getEntityByUnique(Zhen.class, "name", zhen);
				c = managerDao.getCunByAreaZhenAndName(a, z, cun);
			}else{
				c = managerDao.getCunByAreaAndName(a, cun);
			}
			if (c == null) {
				sb.append("第" + (i + 1) + "行，数据错误,没有找到村名:" + cun);
				throw new RuntimeException(sb.toString());
			}
			f.setCun(c);

			f.setName(name);
			f.setIdNo(idNo);
			try {
				f.setIncome(Double.parseDouble(income));
				f.setType(Integer.parseInt(type));
			} catch (RuntimeException e) {
				e.printStackTrace();
				sb.append("第" + (i + 1) + "行，数据错误,请检查家庭收入和类型的格式");
				throw new RuntimeException(sb.toString());
			}

			this.saveOrUpdateEntity(f);
			logger.debug("import family from Excel succ, rowindex=" + i);
			baseDao.fluch();
			baseDao.clear();
			sum++;

		}
		workbook.close();
		if (sb.toString().isEmpty()) {
			return "成功：共计" + sum + "条";
		}
		return sb.toString();
	}

	// 调查表导入
	public String uploadFamilyData2(String fileName) throws Exception {
		// User user = (User)
		// ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		// if (!(user instanceof Org)) {
		// throw new RuntimeException("只有单位管理员可以导入贫困户资料");
		// } else if (((Org) user).getCun() == null) {
		// throw new RuntimeException("该单位还没有映射村的帮扶，不能进行这项操作");
		// }

		// Org org = ((Org) user);

		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		String name = sheet.getCell(1, 3).getContents();
		String gender = sheet.getCell(3, 3).getContents();
		String zu = sheet.getCell(5, 3).getContents();
		String reason = sheet.getCell(11, 3).getContents();
		String willing = sheet.getCell(15, 3).getContents();
		String birthday = sheet.getCell(1, 4).getContents();
		String wenhua = sheet.getCell(3, 4).getContents();
		String idNo = sheet.getCell(1, 5).getContents();
		String income = sheet.getCell(1, 6).getContents();
		String type = sheet.getCell(1, 7).getContents();
		String shuitian = sheet.getCell(4, 7).getContents();
		String handi = sheet.getCell(5, 7).getContents();
		String linguodi = sheet.getCell(6, 7).getContents();
		String other = sheet.getCell(7, 7).getContents();
		String structure = sheet.getCell(8, 7).getContents();
		String weifang = sheet.getCell(9, 7).getContents();
		String mianji = sheet.getCell(10, 7).getContents();

		// Family f = new Family();
		if (Util.isEmpty(idNo)) {
			workbook.close();
			throw new Exception("贫困户资料导入失败，缺失身份证号");
		}
		Family f = this.getEntityByUnique(Family.class, "idNo", idNo);
		if (f == null) {
			workbook.close();
			throw new Exception("该贫困户没有找到，身份证号为：" + idNo);
		}
		try {
			// f.setCun(org.getCun());
			f.setName(name);
			f.setGender(gender);
			f.setZu(zu);
			// 原因，脱贫意愿缺失

			f.setBirthday(Util.getDate(birthday));
			f.setWenhua(wenhua);
			f.setIdNo(idNo);
			try {
				if (!Util.isEmpty(income)){
					if(income.length()==1 && (int)income.charAt(0) == 65533)//非法空格字符
						income = "";
					else
						f.setIncome(Double.parseDouble(income.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("家庭收入有非法字符如中文，正确填写方法是：123.00");
			}
			// f.setType(Integer.parseInt(type));
			// 始终是3
			f.setType(3);
			try {
				if (!Util.isEmpty(shuitian)){
					if(shuitian.length()==1 && (int)shuitian.charAt(0) == 65533)//非法空格字符
						shuitian = "";
					else
						f.setShuitian(Double.parseDouble(shuitian.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("水田项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(handi)){
					if(handi.length()==1 && (int)handi.charAt(0) == 65533)//非法空格字符
						handi = "";
					else
						f.setHandi(Double.parseDouble(handi.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("旱地面积项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(linguodi)){
					if(linguodi.length()==1 && (int)linguodi.charAt(0) == 65533)//非法空格字符
						linguodi = "";
					else
						f.setLinguodi(Double.parseDouble(linguodi.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("林果地项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(other)){
					if(other.length()==1 && (int)other.charAt(0) == 65533)//非法空格字符
						other = "";
					else
						f.setOther(Double.parseDouble(other.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("其他收入项有非法字符，例如：123.00");
			}
			f.setJiegou(structure);
			// 危房字段缺失
			f.setWeifang(weifang);
			f.setReason(reason);
			f.setWilling(willing);
			try {
				if (!Util.isEmpty(mianji)){
					if(mianji.length()==1 && (int)mianji.charAt(0) == 65533)//非法空格字符
						mianji = "";
					else
						f.setMianji(Double.parseDouble(mianji.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("面积有非法字符，例如：123.00");
			}

			int sum = 0;
			for (int i = 10; i < 100; i++) {
				String c1 = sheet.getCell(1, i).getContents();
				String c2 = sheet.getCell(2, i).getContents();
				if (Util.isEmpty(c1))
					break;
				String c3 = sheet.getCell(3, i).getContents();
				String c4 = sheet.getCell(4, i).getContents();
				String c5 = sheet.getCell(5, i).getContents();
				String c6 = sheet.getCell(6, i).getContents();
				String c7 = sheet.getCell(9, i).getContents();
				String c8 = sheet.getCell(11, i).getContents();
				String c9 = sheet.getCell(12, i).getContents();
				String c10 = sheet.getCell(13, i).getContents();
				String c11 = sheet.getCell(14, i).getContents();
				String c12 = sheet.getCell(15, i).getContents();
				String c13 = sheet.getCell(16, i).getContents();
				String c14 = sheet.getCell(17, i).getContents();

				Person p = new Person();
				p.setName(c1);
				p.setGender(c2);
				p.setBirthday(Util.getDate(c3));
				p.setRelate(c4);
				p.setWenhua(c5);
				p.setJob(c6);

				// 缺失字段
				p.setGongziIncome(c7);
				p.setNongyeIncome(c8);
				p.setDibaoIncome(c9);
				p.setOtherIncome(c10);
				p.setHezuoYiliao(c11);
				p.setYanglao(c12);
				p.setStuCost(c13);
				p.setRemark(c14);

				f.setPerson(p, ++sum);
			}

			this.saveOrUpdateEntity(f);
			sb.append("贫困户资料导入成功，户主姓名为:" + name);
			workbook.close();
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new RuntimeException("导入失败，请检查数据是否完整和准确");
		}

		return sb.toString();

	}

	public String uploadFamilyData3(String fileName) throws Exception {
		StringBuffer sb = new StringBuffer();
		int sum = 0;
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		int row = sheet.getRows();
		int cols = sheet.getColumns();
		for (int i = 2; i < row && !Util.isEmpty(sheet.getCell(0, i).getContents()); i++) {
			String zhen = sheet.getCell(1, i).getContents();
			String cun = sheet.getCell(2, i).getContents();
			String name = sheet.getCell(3, i).getContents();
			String gender = sheet.getCell(4, i).getContents();
			String birthday = sheet.getCell(5, i).getContents();
			String wenhua = sheet.getCell(6, i).getContents();
			String idNo = sheet.getCell(7, i).getContents();
			String income = sheet.getCell(8, i).getContents();
			String type = sheet.getCell(9, i).getContents();
			String tel = sheet.getCell(10, i).getContents();
			String zu = sheet.getCell(11, i).getContents();
			String reason = sheet.getCell(12, i).getContents();
			String willing = sheet.getCell(13, i).getContents();
			String shuitian = sheet.getCell(14, i).getContents();
			String handi = sheet.getCell(15, i).getContents();
			String linguodi = sheet.getCell(16, i).getContents();
			String other = sheet.getCell(17, i).getContents();
			String jiegou = sheet.getCell(18, i).getContents();
			String weifang = sheet.getCell(19, i).getContents();
			String mianji = sheet.getCell(20, i).getContents();

			Family f = this.getEntityByUnique(Family.class, "idNo", idNo);
			if (f == null)
				f = new Family();

			// 类型
//			if (Util.isEmpty(type)) {
//				f.setType(3);// 默认贫困类型为3
//			}

			Zhen z = (Zhen) this.getEntityByUnique(Zhen.class, "name", zhen);
			if (z == null) {
				sb.append("第" + (i + 1) + "行，数据错误,没有找到镇名:" + zhen);
				throw new RuntimeException(sb.toString());
			}

			Cun c = managerDao.getCunByAreaZhenAndName(z.getArea(), z, cun);
			if (c == null) {
				sb.append("第" + (i + 1) + "行，数据错误,没有找到村名:" + cun);
				throw new RuntimeException(sb.toString());
			}
			f.setCun(c);

			f.setName(name);
			f.setGender(gender);
			f.setWenhua(wenhua);
			f.setIdNo(idNo);
			f.setTel(tel);
			f.setZu(zu);
			f.setReason(reason);
			f.setWilling(willing);
			f.setJiegou(jiegou);
			f.setWeifang(weifang);
			f.setBirthday(Util.getDateByTxtInExcel(birthday));
			
			try {
				if (!Util.isEmpty(income)){
					if(income.length()==1 && (int)income.charAt(0) == 65533)//非法空格字符
						income = "";
					else
						f.setIncome(Double.parseDouble(income.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，家庭收入有非法字符如中文，正确填写方法是：123.00");
			}
			try {
				if (!Util.isEmpty(shuitian)){
					if(shuitian.length()==1 && (int)shuitian.charAt(0) == 65533)//非法空格字符
						shuitian = "";
					else
						f.setShuitian(Double.parseDouble(shuitian.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，水田项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(handi)){
					if(handi.length()==1 && (int)handi.charAt(0) == 65533)//非法空格字符
						handi = "";
					else
						f.setHandi(Double.parseDouble(handi.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，旱地面积项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(linguodi)){
					if(linguodi.length()==1 && (int)linguodi.charAt(0) == 65533)//非法空格字符
						linguodi = "";
					else
						f.setLinguodi(Double.parseDouble(linguodi.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，林果地项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(other)){
					if(other.length()==1 && (int)other.charAt(0) == 65533)//非法空格字符
						other = "";
					else
						f.setOther(Double.parseDouble(other.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，其他收入项有非法字符，例如：123.00");
			}
			try {
				if (!Util.isEmpty(mianji)){
					if(mianji.length()==1 && (int)mianji.charAt(0) == 65533)//非法空格字符
						mianji = "";
					else
						f.setMianji(Double.parseDouble(mianji.trim()));
				}
			} catch (RuntimeException e) {
				logger.warn("Excel导入数据字符有误", e);
				workbook.close();
				throw new Exception("第" + (i + 1) + "行，面积有非法字符，例如：123.00");
			}

			try {
				if (!Util.isEmpty(type))
					f.setType(Integer.parseInt(type));
			} catch (Exception e) {
				e.printStackTrace();
				sb.append("第" + (i + 1) + "行，贫困类型错误，只能为：1,2,3,4");
				throw new RuntimeException(sb.toString());
			}

			// 添加家庭成员
			for (int j = 0; j < 10; j++) {
				int col = j * 16 + 21;
				String namePer = sheet.getCell(col++, i).getContents();
				if (Util.isEmpty(namePer))
					continue;
				String genderPer = sheet.getCell(col++, i).getContents();
				String idNoPer = sheet.getCell(col++, i).getContents();
				String birthdayPer = sheet.getCell(col++, i).getContents();
				String agePer = sheet.getCell(col++, i).getContents();
				String wenhuaPer = sheet.getCell(col++, i).getContents();
				String relation = sheet.getCell(col++, i).getContents();
				String job = sheet.getCell(col++, i).getContents();
				String gongziIncome = sheet.getCell(col++, i).getContents();
				String nongyeIncome = sheet.getCell(col++, i).getContents();
				String dibao = sheet.getCell(col++, i).getContents();
				String butie = sheet.getCell(col++, i).getContents();
				String hezuo = sheet.getCell(col++, i).getContents();
				String yanglao = sheet.getCell(col++, i).getContents();
				String xuefei = sheet.getCell(col++, i).getContents();
				String remark = sheet.getCell(col++, i).getContents();
				Person p = new Person();
				try {
					// p.setBirthday(Util.getDateByTxt(birthdayPer));
					p.setName(namePer);
					p.setGender(genderPer);
					p.setWenhua(wenhuaPer);
					p.setRelate(relation);
					p.setJob(job);
					p.setGongziIncome(gongziIncome);
					p.setNongyeIncome(nongyeIncome);
					p.setDibaoIncome(dibao);
					p.setOtherIncome(butie);
					p.setHezuoYiliao(hezuo);
					p.setYanglao(yanglao);
					p.setStuCost(xuefei);
					p.setRemark(remark);
					f.setPerson(p, j + 1);
				} catch (Exception e) {
					e.printStackTrace();
					sb.append("第" + (i + 1) + "行，家庭成员数据错误,请检查生日、年龄等数据格式");
					throw new RuntimeException(sb.toString());
				}

			}

			baseDao.saveOrUpdate(f);
			logger.debug("import family from Excel succ, rowindex=" + i);
			baseDao.fluch();
			baseDao.clear();
			sum++;

		}
		workbook.close();
		if (sb.toString().isEmpty()) {
			return "成功：共计" + sum + "条";
		}
		return sb.toString();
	}

	public String getFamilyExcelDownloadFile(String name) throws Exception {
		List<Family> list = null;
		if (Util.isEmpty(name))
			list = baseDao.getAll(Family.class);
		else
			list = baseDao.getAllLike(Family.class, "name", name);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);

		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("贫困户列表", 0);

			sheet.setColumnView(0, 15);
			sheet.setColumnView(1, 15);
			sheet.setColumnView(2, 15);
			sheet.setColumnView(3, 30);
			sheet.setColumnView(4, 40);
			sheet.setColumnView(5, 15);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "区（县级市）", format));
			sheet.addCell(new Label(1, 0, "村别", format));
			sheet.addCell(new Label(2, 0, "户主姓名", format));
			sheet.addCell(new Label(3, 0, "户主身份证号码", format));
			sheet.addCell(new Label(4, 0, "2010年家庭年人均纯收入（元）", format));
			sheet.addCell(new Label(5, 0, "贫困户类型", format));

			// 加内容
			int i = 1;
			for (Family f : list) {
				sheet.addCell(new Label(0, i, f.getCun().getZhen().getArea().getName()));
				sheet.addCell(new Label(1, i, f.getCun().getName()));
				sheet.addCell(new Label(2, i, f.getName()));
				sheet.addCell(new Label(3, i, f.getIdNo()));
				sheet.addCell(new Number(4, i, f.getIncome()));
				sheet.addCell(new Number(5, i, f.getType()));
				i++;
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	public void deleteNonLeaderData() {
		managerDao.deleteNonLeaderData();
	}

	public void deleteFamily(Long familyId) {
		managerDao.deleteFamily(familyId);
	}
}
