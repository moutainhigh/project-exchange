package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ReportDao;
import com.throne212.fupin.domain.ProjectZdStat;

public class ProjectStatTest {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		ReportDao reportDao = (ReportDao) ac.getBean("reportDao");
//		List list = reportDao.getAll(ProjectZdStat.class);
//		System.out.println(list.size());
		
		ReportBiz reportBiz = (ReportBiz) ac.getBean("reportBiz");
		PageBean bean = reportBiz.getProStat(ProjectZdStat.class, 2011, 9, 1);
		System.out.println(bean.getResultList().size());
		
	}
	
}
