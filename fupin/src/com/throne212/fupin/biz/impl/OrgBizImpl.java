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

import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.dao.ManagerDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
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

	public PageBean getAllLeader(Org org, String name, Integer pageIndex) {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if (Util.isEmpty(name))
			return managerDao.getAllLeader(org.getId(), pageIndex);
		else
			return managerDao.getAllLeader(org.getId(), name, pageIndex);
	}

	public String uploadFamilyData(String fileName) throws Exception{
		StringBuffer sb = new StringBuffer();
		int sum = 0;
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		for (int i = 1; !Util.isEmpty(sheet.getCell(0, i).getContents()); i++) {
			String area = sheet.getCell(0, i).getContents();
			String cun = sheet.getCell(1, i).getContents();
			String name = sheet.getCell(2, i).getContents();
			String idNo = sheet.getCell(3, i).getContents();
			String income = sheet.getCell(4, i).getContents();
			String type = sheet.getCell(5, i).getContents();

			Family f = new Family();

			Area a = (Area) this.getEntityByUnique(Area.class, "name", area);
			if (a == null) {
				sb.append("第" + (i + 1) + "行，数据错误,没有找到区县名:" + area);
				throw new RuntimeException(sb.toString());
			}

			Cun c = managerDao.getCunByAreaAndName(a, cun);
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
			sum++;

		}
		workbook.close();
		if (sb.toString().isEmpty()) {
			return "成功：共计" + sum + "条";
		}
		return sb.toString();
	}
	
	public String getFamilyExcelDownloadFile(String name) throws Exception{
		List<Family> list = null;
		if(Util.isEmpty(name))
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

}
