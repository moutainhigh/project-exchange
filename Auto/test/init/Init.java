package init;

import org.hibernate.Session;

import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.Setting;


public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Category c1 = new Category();c1.setName("��������");c1.setOrderNum(1);s.save(c1);
		Category c2 = new Category();c2.setName("���ó��͹����ĵ�");c2.setOrderNum(2);s.save(c2);
		Category c3 = new Category();c3.setName("�м��������ĵ�");c3.setOrderNum(3);s.save(c3);
		Category c4 = new Category();c4.setName("רҵ����");c4.setOrderNum(4);s.save(c4);
		Category c5 = new Category();c5.setName("��������");c5.setOrderNum(5);s.save(c5);
		Category c6 = new Category();c6.setName("ά�ޱ���");c6.setOrderNum(6);s.save(c6);
		Category c7 = new Category();c7.setName("�����ɱ�");c7.setOrderNum(7);s.save(c7);
		Category c8 = new Category();c8.setName("����װ��");c8.setOrderNum(8);s.save(c8);
		Category c9 = new Category();c9.setName("��������");c9.setOrderNum(9);s.save(c9);
		
		Admin admin = new Admin();
		admin.setName("����Ա");
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		
		Setting set = new Setting();
		set.setPageDescription("�żҿ�������վ���ṩȫ��λ������Ϣ��Ѷ");
		set.setPageTitle("�żҿ�������");
		set.setPageKeywords("�żҿ�,����,������Ϣ��Ѷ,��������,�³��Ƽ�");
		s.save(set);
		
		s.getTransaction().commit();
		s.close();
	}
}
