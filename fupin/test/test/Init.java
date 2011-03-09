package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;



public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		baseBiz.saveOrUpdateEntity(admin);
		
		
		
		
		Shi shi = new Shi();
		shi.setName("四会市");
		baseBiz.saveOrUpdateEntity(shi);
		
		Area area = new Area();
		area.setName("金水区");
		area.setShi(shi);
		baseBiz.saveOrUpdateEntity(area);
		
		Zhen zhen = new Zhen();
		zhen.setName("华阳镇");
		zhen.setArea(area);
		baseBiz.saveOrUpdateEntity(zhen);
		
		Cun cun = new Cun();
		cun.setZhen(zhen);
		cun.setName("红光村");
		baseBiz.saveOrUpdateEntity(cun);
		
		
		Org org =new Org();
		org.setLoginName("org");
		org.setPassword("123");
		org.setCun(cun);
		baseBiz.saveOrUpdateEntity(org);
		
		cun.setOrg(org);
		baseBiz.saveOrUpdateEntity(cun);
		
		
		ShiWorkOrg shiWorkOrg = new ShiWorkOrg();
		shiWorkOrg.setLoginName("shiworkorg");
		shiWorkOrg.setPassword("123");
		shiWorkOrg.setShi(shi);
		shiWorkOrg.setRemark("市级管理员账号");
		baseBiz.saveOrUpdateEntity(shiWorkOrg);
		
		AreaWorkOrg areaWorkOrg = new AreaWorkOrg();
		areaWorkOrg.setLoginName("areaWorkOrg");
		areaWorkOrg.setPassword("123");
		areaWorkOrg.setArea(area);
		areaWorkOrg.setShiWorkOrg(shiWorkOrg);
		areaWorkOrg.setRemark("remark");
		baseBiz.saveOrUpdateEntity(areaWorkOrg);
		
	}
}
