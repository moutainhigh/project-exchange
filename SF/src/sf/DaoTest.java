package sf;

import java.util.Date;

import sf.dao.InfoDao;

public class DaoTest {

	public static void main(String[] args) {
		InfoDao infoDao = new InfoDao();
		
		infoDao.getRecentInfo(new Date());		
		infoDao.getTodayBeforeInfo(new Date());
		infoDao.getTodayAfterInfo(new Date());
		
		infoDao.getTodayAllDayInfo(new Date());
		infoDao.getTommorowTongXiaoInfo(new Date());
		
		/*Date d = new Date(1269957600000L);
		System.out.println(d);*/
	}

}
