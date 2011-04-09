package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Person;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;



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
		org.setOrgName("四会市农业局");
		org.setChargePersonName("李四");
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
		
		ZhenWorkOrg zhenWorkOrg = new ZhenWorkOrg();
		zhenWorkOrg.setLoginName("zhenWorkOrg");
		zhenWorkOrg.setPassword("123");
		zhenWorkOrg.setZhen(zhen);
		zhenWorkOrg.setAreaWorkOrg(areaWorkOrg);
		zhenWorkOrg.setRemark("remark");
		baseBiz.saveOrUpdateEntity(zhenWorkOrg);
		
		//镇帮扶指定
		zhen.setAreaWorkOrg(areaWorkOrg);
		baseBiz.saveOrUpdateEntity(zhen);
		
		//贫困户
		Family family = new Family();
		family.setName("张三");
		family.setGender("男");
		family.setType(1);
		family.setCun(cun);
		
		
		Person p = new Person();
		p.setName("张三");
		p.setRelate("户主");
		p.setGender("男");
		p.setWenhua("初中");
		p.setBirthday(new Date());
		p.setJob("无");
		family.setPerson1(p);
		baseBiz.saveOrUpdateEntity(family);
		
		Leader leader = new Leader();
		leader.setLeaderName("王五");
		leader.setPosition("副局长");
		leader.setOrg(org);
		baseBiz.saveOrUpdateEntity(leader);
		
	}
}
