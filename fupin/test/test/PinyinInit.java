package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;

/**
 * 拼音首字母的工具
 * 
 */
public class PinyinInit {

	public static void main(String[] args) throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		List<Cun> list = baseBiz.getAll(Cun.class);
		for(Cun c : list){
			c.setPinyin(PinyinToolkit.cn2Pinyin(c.getName()));
			baseBiz.saveOrUpdateEntity(c);
		}
		List<Org> list2 = baseBiz.getAll(Org.class);
		for(Org c : list2){
			c.setPinyin(PinyinToolkit.cn2Pinyin(c.getOrgName()));
			baseBiz.saveOrUpdateEntity(c);
		}
	}
}