package hiber_spring;

import org.hibernate.Session;

import com.throne212.tg.web.domain.Teams;


public class HibernateTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	
	
					
					Session s = HibernateSessionFactory.getSession();
					
					String hql ="from Teams t where t.id =:id";
					Teams t = (Teams) s.createQuery(hql).setLong("id", 1).list().get(0);
					
					System.out.println(s.isConnected());

					System.out.println(t.getTitle());
				
			

	}

}
