package init;

import org.hibernate.Session;

import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Category;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Admin admin = new Admin();
		admin.setName("����Ա");
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		
		Category c1 = new Category();
		c1.setName("���ض�̬");
		s.save(c1);
		
		
		s.getTransaction().commit();
		s.close();
	}
}
