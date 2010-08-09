package init;

import org.hibernate.Session;

import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.Setting;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Category c1 = new Category();c1.setName("本地新闻");c1.setOrderNum(1);s.save(c1);
		Category c2 = new Category();c2.setName("经济车型购车心得");c2.setOrderNum(2);s.save(c2);
		Category c3 = new Category();c3.setName("中级车购车心得");c3.setOrderNum(3);s.save(c3);
		Category c4 = new Category();c4.setName("专业测评");c4.setOrderNum(4);s.save(c4);
		Category c5 = new Category();c5.setName("汽车保险");c5.setOrderNum(5);s.save(c5);
		Category c6 = new Category();c6.setName("维修保养");c6.setOrderNum(6);s.save(c6);
		Category c7 = new Category();c7.setName("养车成本");c7.setOrderNum(7);s.save(c7);
		Category c8 = new Category();c8.setName("汽车装饰");c8.setOrderNum(8);s.save(c8);
		Category c9 = new Category();c9.setName("北京降价");c9.setOrderNum(9);s.save(c9);
		
		Admin admin = new Admin();
		admin.setName("管理员");
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		
		Setting set = new Setting();
		set.setPageDescription("张家口汽车网站，提供全方位汽车信息资讯");
		set.setPageTitle("张家口汽车网");
		set.setPageKeywords("张家口,汽车,汽车信息资讯,汽车保养,新车推荐");
		s.save(set);
		
		s.getTransaction().commit();
		s.close();
	}
}
