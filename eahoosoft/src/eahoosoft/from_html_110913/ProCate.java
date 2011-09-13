package eahoosoft.from_html_110913;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Category;

//获取产品分类
public class ProCate {
	public static void main(String[] args) throws Exception {
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		//添加目录
		Category c1 = new Category();
		c1.setName("DVD/Video Tools");
		c1.setFileName("");
		s.save(c1);
		
		Category c2 = new Category();
		c2.setName("iPod/iPad/iPhone Tools");
		c2.setFileName("i");
		s.save(c2);
		
		Category c3 = new Category();
		c3.setName("Mac Software");
		c3.setFileName("m");
		s.save(c3);
		
		Category c4 = new Category();
		c4.setName("Audio Tools");
		c4.setFileName("a");
		s.save(c4);
		
		Category c5 = new Category();
		c5.setName("iPhone/iPad Apps");
		c5.setFileName("g");
		s.save(c5);
		
		Category c6 = new Category();
		c6.setName("Picture Tools");
		c6.setFileName("p");
		s.save(c6);
		
		s.getTransaction().commit();
		s.close();

	}
}
