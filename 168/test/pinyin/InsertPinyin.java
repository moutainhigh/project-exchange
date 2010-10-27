package pinyin;

import java.util.List;

import org.hibernate.Session;

import com.throne212.info168.web.domain.Area;

public class InsertPinyin {
	public static void main(String[] args) {
		Session s = hibernate.HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		List<Area> list = s.createQuery("from Area").list();
		for(Area a : list){
			a.setPinyin(PinyinToolkit.cn2Pinyin(a.getName()));
		}		
		
		s.getTransaction().commit();
		s.close();
	}
}
