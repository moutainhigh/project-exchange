package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.AreaLog;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.FactoryLog;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmLog;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderAccount;
import com.throne212.siliao.domain.ProviderLog;
import com.throne212.siliao.domain.UserLog;

public class Init {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		
		Admin admin = new Admin();
		admin.setLoginName("sa");
		admin.setPassword("123");
		admin.setName("超级管理员");
		admin.setRemark("系统最高管理员，拥有一切权限");
		baseBiz.saveOrUpdateEntity(admin);
		
		UserLog log = new UserLog();
		log.setByWho(admin);
		log.setCreateDate(new Date());
		log.setCreateName(admin.getName());
		log.setEnable(true);
		log.setLogTime(new Date());
		log.setMsg(WebConstants.OP_CREATE);
		log.setUser(admin);
		baseBiz.saveOrUpdateEntity(log);
		
		Farm farm = new Farm();
		farm.setName("海北农场");
		farm.setCreateDate(new Date());
		farm.setCreateName(admin.getName());
		farm.setEnable(true);
		baseBiz.saveOrUpdateEntity(farm);
		
		FarmLog farmLog = new FarmLog();
		farmLog.setByWho(admin);
		farmLog.setCreateDate(new Date());
		farmLog.setCreateName(admin.getName());
		farmLog.setEnable(true);
		farmLog.setLogTime(new Date());
		farmLog.setMsg(WebConstants.OP_CREATE);
		farmLog.setFarm(farm);
		baseBiz.saveOrUpdateEntity(farmLog);
		
		ManagerAccount man = new ManagerAccount();
		man.setLoginName("man001");
		man.setPassword("123");
		man.setName("饲料经理001");
		man.setRemark("协调饲料厂和管区负责人关系的中间人");
		man.setFarm(farm);
		baseBiz.saveOrUpdateEntity(man);
		
		UserLog log2 = new UserLog();
		log2.setByWho(admin);
		log2.setCreateDate(new Date());
		log2.setCreateName(admin.getName());
		log2.setEnable(true);
		log2.setLogTime(new Date());
		log2.setMsg(WebConstants.OP_CREATE);
		log2.setUser(man);		
		baseBiz.saveOrUpdateEntity(log2);
		
		
		Area area = new Area();
		area.setName("海北一区");
		area.setCreateDate(new Date());
		area.setCreateName(admin.getName());
		area.setEnable(true);
		baseBiz.saveOrUpdateEntity(area);
		
		AreaLog areaLog = new AreaLog();
		areaLog.setByWho(admin);
		areaLog.setCreateDate(new Date());
		areaLog.setCreateName(admin.getName());
		areaLog.setEnable(true);
		areaLog.setLogTime(new Date());
		areaLog.setMsg(WebConstants.OP_CREATE);
		areaLog.setArea(area);
		baseBiz.saveOrUpdateEntity(areaLog);
		
		AreaAccount aa = new AreaAccount();
		aa.setLoginName("aa001");
		aa.setPassword("123");
		aa.setName("管区经理001");
		aa.setRemark("管区经理");
		aa.setArea(area);
		baseBiz.saveOrUpdateEntity(aa);
		
		UserLog log3 = new UserLog();
		log3.setByWho(admin);
		log3.setCreateDate(new Date());
		log3.setCreateName(admin.getName());
		log3.setEnable(true);
		log3.setLogTime(new Date());
		log3.setMsg(WebConstants.OP_CREATE);
		log3.setUser(aa);		
		baseBiz.saveOrUpdateEntity(log3);
		
		
		Factory factory = new Factory();
		factory.setName("正大");
		factory.setCreateDate(new Date());
		factory.setCreateName(admin.getName());
		factory.setEnable(true);
		baseBiz.saveOrUpdateEntity(factory);
		
		FactoryLog factoryLog = new FactoryLog();
		factoryLog.setByWho(admin);
		factoryLog.setCreateDate(new Date());
		factoryLog.setCreateName(admin.getName());
		factoryLog.setEnable(true);
		factoryLog.setLogTime(new Date());
		factoryLog.setMsg(WebConstants.OP_CREATE);
		factoryLog.setFactory(factory);
		baseBiz.saveOrUpdateEntity(factoryLog);
		
		Provider provider = new Provider();
		provider.setName("海北正大");
		provider.setCreateDate(new Date());
		provider.setCreateName(admin.getName());
		provider.setEnable(true);
		provider.setFactory(factory);
		baseBiz.saveOrUpdateEntity(provider);
		
		ProviderLog providerLog = new ProviderLog();
		providerLog.setByWho(admin);
		providerLog.setCreateDate(new Date());
		providerLog.setCreateName(admin.getName());
		providerLog.setEnable(true);
		providerLog.setLogTime(new Date());
		providerLog.setMsg(WebConstants.OP_CREATE);
		providerLog.setProvider(provider);
		baseBiz.saveOrUpdateEntity(providerLog);
		
		ProviderAccount pa = new ProviderAccount();
		pa.setLoginName("pa001");
		pa.setPassword("123");
		pa.setName("供应饲料厂负责人001");
		pa.setRemark("供应饲料厂负责人");
		pa.setProvider(provider);
		baseBiz.saveOrUpdateEntity(pa);
		
		UserLog log4 = new UserLog();
		log4.setByWho(admin);
		log4.setCreateDate(new Date());
		log4.setCreateName(admin.getName());
		log4.setEnable(true);
		log4.setLogTime(new Date());
		log4.setMsg(WebConstants.OP_CREATE);
		log4.setUser(pa);		
		baseBiz.saveOrUpdateEntity(log4);
		
	}
}
