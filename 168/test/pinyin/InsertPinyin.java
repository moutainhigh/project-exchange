package pinyin;

import java.util.List;

import org.hibernate.Session;

import com.throne212.info168.web.domain.Category;

public class InsertPinyin {
	public static void main(String[] args) {
		Session s = hibernate.HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		/*List<Area> list = s.createQuery("from Area").list();
		for(Area a : list){
			a.setPinyin(CnToSpell.getFullSpell(a.getName()));
		}*/		
		
		List<Category> list = s.createQuery("from Category").list();
		for(Category cat : list){
			cat.setPinyin(CnToSpell.getFullSpell(cat.getName()).replaceAll("/", ""));
		}
		
		s.getTransaction().commit();
		s.close();
	}
}
