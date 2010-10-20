package init;

import org.hibernate.Session;

import com.throne212.info168.web.domain.Admin;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.User;

public class Init {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session s = hibernate.HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		String[] topCate = {"招聘信息","培训教育","交友征婚","二手市场","车辆信息","宠物","生活服务","房产","服务信息"};
		String[][] cate = {
				{"兼职/暑期工","司机","管理经营","销售/业务","人事/行政","客服/文秘","财务/金融","计算机/通信","导购/店长/收银","物流/仓管/采购","教师/教练/培训","新闻/编辑/翻译","设计/艺术/创意","律师/法务/咨询","演艺/影视/音乐","保姆/钟点工","技工/普工/保安","餐饮/服务","其他招聘"},
				{"外语培训","计算机培训","企业管理/MBA","学历教育","职业技能培训","中小学教育","才艺培训","家教信息","其他培训"},
				{"同城交友","征婚","聚会活动"},
				{"二手家电","电脑/配件","数码产品","办公用品","手机/通讯相关","电玩/网游/玩具","家具/家居/装饰","服装/鞋帽/箱包","母婴/儿童用品","化妆品/保健品","图书/音像/软件","文体用品/乐器","艺术品/收藏品","火车票/汽车票","门票/消费券","工程机械/行业设备","其他物品交易","二手回收"},
				{"租车/代驾/陪驾","汽修/汽配/保养"},
				{"宠物狗","宠物猫","花鸟鱼虫","宠物服务","宠物寄养"},
				{"搬家","家政","保洁","疏通","快递","物流","维修","电脑维修","装修","旅游","摄影服务","婚庆/庆典","餐饮/外卖","送水/订花","酒店预定/住宿","休闲/保健/养身","其他生活服务"},
				{"二手房","房屋出租","短租房","个人求租","求购二手房","写字楼租售","店铺/商铺转让","厂房/仓库/土地"},
				{"律师服务","翻译服务","咨询/调查","公司注册/会计","金融/贷款/保险"},
		};
		int i = 0;
		for(String top : topCate){
			Category cat = new Category(top);
			s.save(cat);
			for(int j=0;j<cate[i].length;j++){
				Category c = new Category(cate[i][j],cat);
				s.save(c);
			}
			i++;
		}
		
		//user
		Admin admin = new Admin();
		admin.setLoginName("admin");
		admin.setPassword("123");
		s.save(admin);
		User user = new User("yl","123");
		s.save(user);
		
		s.getTransaction().commit();
		s.close();
	}

}
