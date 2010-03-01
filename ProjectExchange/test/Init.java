import java.util.Date;

import hibernate.HibernateSessionFactory;

import org.hibernate.Session;

import com.throne212.proj.domain.User;


public class Init {
	
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		User user = new User();
		user.setLoginName("yl");
		user.setName("yanglei");
		user.setPassword("123");
		user.setCreatedDate(new Date());
		s.save(user);
		
		s.getTransaction().commit();
		s.close();
	}
	
}
