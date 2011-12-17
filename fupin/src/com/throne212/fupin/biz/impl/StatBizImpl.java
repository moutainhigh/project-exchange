package com.throne212.fupin.biz.impl;

import java.io.File;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.StatBiz;
import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.StatDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.User;

public class StatBizImpl extends BaseBizImpl implements StatBiz {

	private StatDao statDao;

	public StatDao getStatDao() {
		return statDao;
	}

	public void setStatDao(StatDao statDao) {
		this.statDao = statDao;
	}

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Long cunId, Long zhenId, Long areaId, Integer pageIndex) {
		return statDao.getFamilyTypeByUser(user, cunId, zhenId, areaId, pageIndex);
	}

	public String exportFamilyTypeByUser(User user, Long cunId, Long zhenId, Long areaId, Integer pageIndex) throws Exception{
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "stat" + File.separator;
		String sourceFile = path + "family_type_list.xls";
		String targetFile = path + "family_type_list" + System.currentTimeMillis() + ".xls";

		// 获取数据
		PageBean<FamilyTypeStatDO> pageBean = statDao.getFamilyTypeByUser(user, cunId, zhenId, areaId);
		List<FamilyTypeStatDO> list = pageBean.getResultList();
		int[] sumArr = (int[]) pageBean.getTotal();

		if (list != null && list.size() > 0) {
			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			
			WritableSheet sheet = workbook.getSheet(0);
			int row = 2;
			int type1Sum = 0;
			int type3Sum = 0;
			int sum = 0;
			for(FamilyTypeStatDO f : list){
				int col = 0;
				sheet.addCell(new Number(col++, row, row-1));
				sheet.addCell(new Label(col++, row, f.getCunName()));
				sheet.addCell(new Number(col++, row, f.getType1()));
				type1Sum += f.getType1();
				sheet.addCell(new Number(col++, row, f.getType2()));
				sheet.addCell(new Number(col++, row, f.getType3()));
				type3Sum += f.getType3();
				sheet.addCell(new Number(col++, row, f.getType4()));
				sheet.addCell(new Number(col++, row, f.getSum()));
				sum += f.getSum();
				sheet.addCell(new Number(col++, row, f.getType1() + f.getType2()));
				sheet.addCell(new Number(col++, row, f.getType3() + f.getType4()));
				sheet.addCell(new Number(col++, row, f.getType1() + f.getType3()));
				sheet.addCell(new Number(col++, row, f.getType2() + f.getType4()));
				sheet.addCell(new Label(col++, row, f.getRate()));
				row++;
			}
			
			//sum
			int col = 0;
			sheet.addCell(new Label(col++, row, "合计"));
			sheet.addCell(new Label(col++, row, ""));
			for(int i=0;i<9;i++){
				sheet.addCell(new Number(col++, row, sumArr[i]));
			}
			double rate = (type1Sum + type3Sum) / (1.0 * sum);
			rate = ((int) (rate * 10000)) / 100.0;
			sheet.addCell(new Label(11, row, rate + "%"));
			
			// 关闭
			workbook.write();
			workbook.close();
			rw.close();
			
		}

		return targetFile;
	}

}
