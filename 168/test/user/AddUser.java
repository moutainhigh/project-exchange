package user;

import org.hibernate.Session;

import com.throne212.info168.web.domain.User;

public class AddUser {
	public static void main(String[] args) {
		Session s = hibernate.HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		User user = new User("yl","123");
		s.save(user);
		
		s.getTransaction().commit();
		s.close();
	}
}
