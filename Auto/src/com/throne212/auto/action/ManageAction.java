package com.throne212.auto.action;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.Util;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.Link;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Setting;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.User;
import com.throne212.auto.domain.Zhuangshi;

public class ManageAction extends BaseAction {

	private UserBiz userBiz;
	private NewsBiz newsBiz;

	public String execute() {
		return "main";
	}

	public String index() {
		return "main";
	}
	
	private Setting setting;
	public String setting() {
		if(setting == null || setting.getId() == null){
			setting = userBiz.getAll(Setting.class).get(0);
		}else{
			userBiz.saveOrUpdateEntity(setting);
			this.setReqMsg("�������óɹ�");
		}
		return "setting";
	}

	// news
	private User user;
	private String oldPwd;
	private String newPwd2;
	private String newPwd;

	public String chgPwd() {
		if (Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)) {
			this.setReqMsg("�������벻����������������");
		} else if (!newPwd.equals(newPwd2)) {
			this.setReqMsg("�����������벻һ��");
		} else if (!userBiz.changePwd(user.getId(), oldPwd, newPwd)) {
			this.setReqMsg("�����޸�ʧ�ܣ�����ԭ�����Ƿ�������ȷ");
		} else {
			this.setReqMsg("�����޸ĳɹ�");
		}
		return "pwd";
	}

	private PageBean<News> newsPageBean;
	private int page;
	private List<Category> cateList;

	public String newsList() {
		newsPageBean = newsBiz.getNews(page);
		return "news_list";
	}

	private News news;

	public String saveNews() {
		if (news == null)
			return "news_edit";
		news.setNo(System.currentTimeMillis()+"");
		if (news.getId() == null)
			news = newsBiz.addNews(news);
		else {
			news.setPublishDate(new Date());
			newsBiz.saveOrUpdateEntity(news);
			news = newsBiz.getEntityById(News.class, news.getId());
		}
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			news.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
			newsBiz.saveOrUpdateEntity(news);
		}
		if (news.getId() != null){
			this.setReqMsg("���±���ɹ�");
			saveNewsHtml(news.getNo(),news.getId(),"news");
			logger.info("���ž�̬ҳ�����ɳɹ�");
		}
		else
			this.setReqMsg("���±���ʧ�ܣ�����ϵ����Ա");
		cateList = newsBiz.getAll(Category.class);
		return "news_edit";
	}
	private void saveNewsHtml(String name,long id,String newsName){
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "news/"+name+".html";
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(path);
			
			HttpServletRequest request = ServletActionContext.getRequest();
			String newsPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+newsName+".htm?"+newsName+".id="+id;
			
			URL url = new URL(newsPath);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			conn.connect();
			InputStream in = conn.getInputStream();
			int len = -1;
			byte[] buff = new byte[1024];
			while ((len = in.read(buff)) != -1) {
				fos.write(buff, 0, len);
			}
			in.close();
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(fos != null)
				try {fos.close();} catch (IOException e) {e.printStackTrace();}
		}
	}

	public String news() {
		if (news!= null && news.getId() != null)
			news = newsBiz.getEntityById(News.class, news.getId());
		cateList = newsBiz.getAll(Category.class);
		return "news_edit";
	}
	public String recommendNews() {
		if (news.getId() != null) {
			news = newsBiz.getEntityById(News.class, news.getId());
			news.setRecommend(true);
			newsBiz.saveOrUpdateEntity(news);
			this.setReqMsg("�����Ƽ��ɹ�");
		}
		return this.newsList();
	}
	public String deleteNews() {
		if (news.getId() != null) {
			newsBiz.deleteEntity(News.class, news.getId());
			this.setReqMsg("����ɾ���ɹ�");
		}
		return this.newsList();
	}
	
	//category
	private Category cate;
	public String cateList() {
		cateList = newsBiz.getAll(Category.class);
		return "cate_list";
	}
	public String saveCate() {
		if (cate == null)
			return "cate_edit";
		newsBiz.saveOrUpdateEntity(cate);
		if (cate.getId() != null)
			this.setReqMsg("��Ŀ����ɹ�");
		else
			this.setReqMsg("��Ŀ����ʧ�ܣ�����ϵ����Ա");
		return "cate_edit";
	}

	public String cate() {
		if (cate.getId() != null)
			cate = newsBiz.getEntityById(Category.class, cate.getId());
		return "cate_edit";
	}

	public String deleteCate() {
		if (cate.getId() != null) {
			newsBiz.deleteEntity(Category.class, cate.getId());
			this.setReqMsg("��Ŀɾ���ɹ�");
		}
		return this.cateList();
	}

	// 4s sale
	private PageBean<Sale> salePageBean;

	public String saleList() {
		salePageBean = userBiz.getSales(page);
		return "sale_list";
	}

	private Sale sale;

	public String saveSale() {
		if (sale == null)
			return "sale_edit";
		if(!Util.isEmpty(sale.getLoginName())){
			User user = userBiz.getEntityByUnique(Sale.class, "loginName", sale.getLoginName());
			if(user != null && !user.getId().equals(sale.getId())){
				this.setReqMsg("��¼���Ѿ����ڣ������¶���");
				return "sale_edit";
			}
		}
		if (sale.getId() != null) {
			String pwd = userBiz.getEntityById(Sale.class, sale.getId()).getPassword();
			sale.setPassword(pwd);
		}
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			sale.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
		}
		userBiz.saveOrUpdateEntity(sale);
		if (sale.getId() != null)
			this.setReqMsg("4S�����ϱ���ɹ�");
		else
			this.setReqMsg("4S�����ϱ���ʧ�ܣ�����ϵ����Ա");
		return "sale_edit";
	}

	public String sale() {
		if (sale.getId() != null)
			sale = userBiz.getEntityById(Sale.class, sale.getId());
		return "sale_edit";
	}

	public String deleteSale() {
		if (sale.getId() != null) {
			userBiz.deleteEntity(Sale.class, sale.getId());
			this.setReqMsg("4S��ɾ���ɹ�");
		}
		return this.saleList();
	}

	// 4s sale car
	private PageBean<Car> carPageBean;

	public String carList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Sale) {
			carPageBean = userBiz.getCarsBySale(user.getId(), page);
		} else
			carPageBean = userBiz.getCars(page);
		return "car_list";
	}

	private Car car;

	public String saveCar() {
		if (car == null)
			return "car_edit";
		if (car.getId() != null) {
			Car oldCar = userBiz.getEntityById(Car.class, car.getId());
			if (oldCar.getPriceDate() == null || oldCar.getPrice() != car.getPrice()) {
				car.setPriceDate(new Date());
			}
		} else {
			car.setPriceDate(new Date());
		}
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			car.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
		}
		userBiz.saveOrUpdateEntity(car);
		if (car.getId() != null)
			this.setReqMsg("���ͱ���ɹ�");
		else
			this.setReqMsg("�������ϱ���ʧ�ܣ�����ϵ����Ա");
		return "car_edit";
	}

	public String car() {
		if (car.getId() != null)
			car = userBiz.getEntityById(Car.class, car.getId());
		return "car_edit";
	}

	public String deleteCar() {
		if (car.getId() != null) {
			userBiz.deleteEntity(Car.class, car.getId());
			this.setReqMsg("����ɾ���ɹ�");
		}
		return this.carList();
	}

	// 4s sale special
	private PageBean<Special> specialPageBean;

	public String specialList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Sale) {
			specialPageBean = userBiz.getSpecialsBySale(user.getId(), page);
		} else
			specialPageBean = userBiz.getSpecials(page);
		return "special_list";
	}

	private Special special;

	public String saveSpecial() {
		if (special == null)
			return "special_edit";
		special.setPublishDate(new Date());
		special.setNo(System.currentTimeMillis()+"");
		userBiz.saveOrUpdateEntity(special);
		if (special.getId() != null){
			this.setReqMsg("�Ż���Ϣ����ɹ�");
			saveNewsHtml(special.getNo(),special.getId(),"special");
			logger.info("���ž�̬ҳ�����ɳɹ�");
		}
		else
			this.setReqMsg("�Ż���Ϣ����ʧ�ܣ�����ϵ����Ա");
		return "special_edit";
	}

	public String special() {
		if (special.getId() != null)
			special = userBiz.getEntityById(Special.class, special.getId());
		return "special_edit";
	}

	public String deleteSpecial() {
		if (special.getId() != null) {
			userBiz.deleteEntity(Special.class, special.getId());
			this.setReqMsg("�Ż���Ϣɾ���ɹ�");
		}
		return this.specialList();
	}

	//link
	private Link link;
	private List<Link> linkList;
	public String linkList() {
		linkList = newsBiz.getAll(Link.class,"orderNum","asc");
		return "link_list";
	}
	public String saveLink() {
		if (link == null)
			return "link_edit";
		newsBiz.saveOrUpdateEntity(link);
		if (link.getId() != null)
			this.setReqMsg("�������ӱ���ɹ�");
		else
			this.setReqMsg("�������ӱ���ʧ�ܣ�����ϵ����Ա");
		return "link_edit";
	}
	public String link() {
		if (link.getId() != null)
			link = newsBiz.getEntityById(Link.class, link.getId());
		return "link_edit";
	}
	public String deleteLink() {
		if (link.getId() != null) {
			newsBiz.deleteEntity(Link.class, link.getId());
			this.setReqMsg("��������ɾ���ɹ�");
		}
		return this.linkList();
	}
	
	
	//zhuangshi
	private Zhuangshi zhuangshi;
	private List<Zhuangshi> zhuangshiList;
	public String zhuangshiList() {
		zhuangshiList = newsBiz.getAll(Zhuangshi.class);
		return "zhuangshi_list";
	}
	public String saveZhuangshi() {
		if (zhuangshi == null)
			return "zhuangshi_edit";
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			zhuangshi.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
		}
		newsBiz.saveOrUpdateEntity(zhuangshi);
		if (zhuangshi.getId() != null)
			this.setReqMsg("װ���̼ұ���ɹ�");
		else
			this.setReqMsg("װ���̼ұ���ʧ�ܣ�����ϵ����Ա");
		return "zhuangshi_edit";
	}

	public String zhuangshi() {
		if (zhuangshi.getId() != null)
			zhuangshi = newsBiz.getEntityById(Zhuangshi.class, zhuangshi.getId());
		return "zhuangshi_edit";
	}

	public String deleteZhuangshi() {
		if (zhuangshi.getId() != null) {
			newsBiz.deleteEntity(Zhuangshi.class, zhuangshi.getId());
			this.setReqMsg("װ���̼�ɾ���ɹ�");
		}
		return this.zhuangshiList();
	}
	
	//�����Ƽ�
	private Insurance baoxian;
	private List<Insurance> baoxianList;
	public String baoxianList() {
		baoxianList = newsBiz.getAll(Insurance.class);
		return "baoxian_list";
	}
	public String saveBaoxian() {
		if (baoxian == null)
			return "baoxian_edit";
		String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (image != null) {
			baoxian.setImage(image);
			ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
		}
		newsBiz.saveOrUpdateEntity(baoxian);
		if (baoxian.getId() != null)
			this.setReqMsg("�����Ƽ�����ɹ�");
		else
			this.setReqMsg("�����Ƽ�����ʧ�ܣ�����ϵ����Ա");
		return "baoxian_edit";
	}

	public String baoxian() {
		if (baoxian.getId() != null)
			baoxian = newsBiz.getEntityById(Insurance.class, baoxian.getId());
		return "baoxian_edit";
	}

	public String deleteBaoxian() {
		if (baoxian.getId() != null) {
			newsBiz.deleteEntity(Insurance.class, baoxian.getId());
			this.setReqMsg("�����Ƽ�ɾ���ɹ�");
		}
		return this.baoxianList();
	}
	
	//Ʒ��
	private Brand brand;
	private List<Brand> brandList;
	public String brandList() {
		brandList = newsBiz.getBrandList();
		return "brand_list";
	}
	public String saveBrand() {
		if (brand == null)
			return "brand_edit";
		if(brand.getParentBrand() != null){
			if(brand.getParentBrand().getId() == null)
				brand.setParentBrand(null);
		}
		newsBiz.saveOrUpdateEntity(brand);
		if (brand.getId() != null)
			this.setReqMsg("Ʒ�Ʊ���ɹ�");
		else
			this.setReqMsg("Ʒ�Ʊ���ʧ�ܣ�����ϵ����Ա");
		return "brand_edit";
	}

	public String brand() {
		if (brand.getId() != null)
			brand = newsBiz.getEntityById(Brand.class, brand.getId());
		return "brand_edit";
	}

	public String deleteBrand() {
		if (brand.getId() != null) {
			newsBiz.deleteEntity(Brand.class, brand.getId());
			this.setReqMsg("Ʒ��ɾ���ɹ�");
		}
		return this.brandList();
	}
	
	//setter and getter
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public NewsBiz getNewsBiz() {
		return newsBiz;
	}

	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}

	public PageBean<News> getNewsPageBean() {
		return newsPageBean;
	}

	public void setNewsPageBean(PageBean<News> newsPageBean) {
		this.newsPageBean = newsPageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean<Sale> getSalePageBean() {
		return salePageBean;
	}

	public void setSalePageBean(PageBean<Sale> salePageBean) {
		this.salePageBean = salePageBean;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public PageBean<Car> getCarPageBean() {
		return carPageBean;
	}

	public void setCarPageBean(PageBean<Car> carPageBean) {
		this.carPageBean = carPageBean;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public PageBean<Special> getSpecialPageBean() {
		return specialPageBean;
	}

	public void setSpecialPageBean(PageBean<Special> specialPageBean) {
		this.specialPageBean = specialPageBean;
	}

	public Special getSpecial() {
		return special;
	}

	public void setSpecial(Special special) {
		this.special = special;
	}

	public Setting getSetting() {
		return setting;
	}

	public void setSetting(Setting setting) {
		this.setting = setting;
	}

	public List<Category> getCateList() {
		return cateList;
	}

	public void setCateList(List<Category> cateList) {
		this.cateList = cateList;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public Link getLink() {
		return link;
	}

	public void setLink(Link link) {
		this.link = link;
	}

	public List<Link> getLinkList() {
		return linkList;
	}

	public void setLinkList(List<Link> linkList) {
		this.linkList = linkList;
	}

	public Zhuangshi getZhuangshi() {
		return zhuangshi;
	}

	public void setZhuangshi(Zhuangshi zhuangshi) {
		this.zhuangshi = zhuangshi;
	}

	public List<Zhuangshi> getZhuangshiList() {
		return zhuangshiList;
	}

	public void setZhuangshiList(List<Zhuangshi> zhuangshiList) {
		this.zhuangshiList = zhuangshiList;
	}

	public Insurance getBaoxian() {
		return baoxian;
	}

	public void setBaoxian(Insurance baoxian) {
		this.baoxian = baoxian;
	}

	public List<Insurance> getBaoxianList() {
		return baoxianList;
	}

	public void setBaoxianList(List<Insurance> baoxianList) {
		this.baoxianList = baoxianList;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public List<Brand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}

}
