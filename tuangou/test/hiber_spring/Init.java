package hiber_spring;

import java.util.Date;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.TeamCategory;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;



public class Init {
	
	
	
	public static void main(String[] args) {
		
		
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		CommonBiz commonBiz = (CommonBiz) ac.getBean("commonBiz");
		Teams team=commonBiz.getEntityById(Teams.class, (long)1);
//		
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		
//		
//		User user=new User();
//		User admin=new User();
//		user.setUserType("user");
//		user.setLoginName("test001");
//		user.setPassword("123456");
//		user.setQq("12245465");
//		user.setRegDate(new Date());
//		user.setTel("13025656877");
//		
//		admin.setUserType("admin");
//		admin.setLoginName("admin");
//		admin.setRegDate(new Date());
//		admin.setQq("4545646521");
//		admin.setPassword("123456");
//		admin.setTel("12302325623");
//		s.save(user);
//		s.save(admin);
		
//		TeamCategory cate=new TeamCategory();
//		cate.setCode(22);
//		cate.setCreatedDate(new Date());
//		cate.setDescription("");
//		cate.setName("美食天地");
//		s.save(cate);
//		City city= new City();
//		city.setName("天津");
//		city.setOrderNum(1);
//		City city2=new City();
//		city2.setName("全国");
//		city2.setOrderNum(0);
//		s.save(city);
//		s.save(city2);
//		
//		Teams teams;
//		for(int i =0;i<20;i++){
//			
//			teams=new Teams();
//			teams.setBuyTimes(i);
//			teams.setCate(cate);
//			teams.setCityName("天津");
//			teams.setClickTimes(i+i);
//			teams.setCreateTime(new Date());
//			teams.setLeftDay(2+i);
//			teams.setLeftHour(3+i);
//			teams.setMarketPrice(55f);
//			teams.setNowNumber(25+i);
//			teams.setSiteName("siteName");
//			teams.setSummary("了考试的法律课时间的法律是的了房间了时看见老师的交流课时间的付了款");
//			teams.setSuportTimes(55);
//			teams.setTeamPrice(22f+i);
//			teams.setTitle("瞧一瞧，看一看");
//			teams.setUrl("http://www.baidu.com");
//			
//			s.save(teams);
//			
//			
//		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Comment comment;
		for(int i=0;i<5;i++){
			comment=new Comment();
			team.setClickTimes(55);
			team.setCommentTimes(22);
			comment.setTeam(team);
			comment.setUserName("userName"+i);
			comment.setLastModifyDate(new Date());
			comment.setCreatedDate(new Date());
			comment.setContent("content 您好，八百邻在成都，绵阳均通用。");
			s.save(comment);
			
		}

		
		
		
		s.getTransaction().commit();
		s.close();

}
}