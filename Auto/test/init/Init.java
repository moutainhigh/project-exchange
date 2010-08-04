package init;

import org.hibernate.Session;

import com.throne212.auto.domain.Admin;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Admin admin = new Admin();
		admin.setName("π‹¿Ì‘±");
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		
		
		s.getTransaction().commit();
		s.close();
	}
}
