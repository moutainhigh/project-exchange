package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.dao.CunDao;

public class SprintTest {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		CunDao cunDao = (CunDao) ac.getBean("cunDao");
		System.out.println(cunDao.getCunByFullName("增城市正果镇白面石村").getName());
	}
	
}
