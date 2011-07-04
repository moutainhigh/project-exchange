package test;

import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.dao.BaseDao;
import com.throne212.fupin.domain.Diqu;

public class UnionTest {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		String hql = "from Diqu";
		String sql = "select * from fp_diqu where diqu_type='Zhen' or diqu_type='Cun'";
		List<Diqu> list = s.createSQLQuery(sql).addEntity(Diqu.class).list();
		
		System.out.println(list.size());
		
		s.close();
		
	}
}
