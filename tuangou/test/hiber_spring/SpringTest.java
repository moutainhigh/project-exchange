package hiber_spring;

import java.util.Iterator;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.Teams;

public class SpringTest {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		CommonBiz commonBiz = (CommonBiz) ac.getBean("commonBiz");
		PageBean<Teams> teamPage=commonBiz.getAllTeams(1);
		Teams teamInfo;
		for (Iterator<Teams> iterator=teamPage.getResultList().iterator();iterator.hasNext();) {
	    teamInfo=iterator.next();
        System.out.println(teamInfo.getTitle());

}
		
		PageBean<Comment> commPageBean=commonBiz.getAllCommentsByTeamId(1, (long)1);
		System.out.println(commPageBean.getResultList().size());
		Comment comment;
		for (Iterator<Comment> iterator=commPageBean.getResultList().iterator();iterator.hasNext();) {
			comment=iterator.next();
	        System.out.println(comment.getDescription());

	}
		
	
	}

}
