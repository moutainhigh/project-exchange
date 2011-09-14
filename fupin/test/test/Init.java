package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;



public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		baseBiz.saveOrUpdateEntity(admin);
		
		Shi shi = new Shi();
		shi.setName("广州市");
		baseBiz.saveOrUpdateEntity(shi);
		
		Area area = new Area();
		area.setName("白云区");
		area.setShi(shi);
		baseBiz.saveOrUpdateEntity(area);
		
		ShiWorkOrg shiWorkOrg = new ShiWorkOrg();
		shiWorkOrg.setLoginName("gzs_admin");
		shiWorkOrg.setPassword("123");
		shiWorkOrg.setShi(shi);
		shiWorkOrg.setRemark("市级管理员账号");
		baseBiz.saveOrUpdateEntity(shiWorkOrg);
		
		AreaWorkOrg areaWorkOrg = new AreaWorkOrg();
		areaWorkOrg.setLoginName("baiyun");
		areaWorkOrg.setPassword("123");
		areaWorkOrg.setArea(area);
		areaWorkOrg.setShiWorkOrg(shiWorkOrg);
		areaWorkOrg.setRemark("remark");
		baseBiz.saveOrUpdateEntity(areaWorkOrg);
		
	}
}
