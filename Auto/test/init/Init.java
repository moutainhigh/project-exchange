package init;

import org.hibernate.Session;

import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.Setting;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Admin admin = new Admin();
		admin.setName("管理员");
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		
		Category c1 = new Category();
		c1.setName("本地动态");
		s.save(c1);
		
		Setting set = new Setting();
		set.setPageDescription("张家口汽车网站，提供全方位汽车信息资讯");
		set.setPageTitle("张家口汽车网");
		set.setPageKeywords("张家口,汽车,汽车信息资讯,汽车保养,新车推荐");
		s.save(set);
		
		s.getTransaction().commit();
		s.close();
	}
}
