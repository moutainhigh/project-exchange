package init;

import org.hibernate.Session;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		
		s.getTransaction().commit();
		s.close();
	}
}
