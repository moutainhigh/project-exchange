package init;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Category;
import com.throne212.auto.domain.News;

public class DataMigrate {

	static ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
    public static void main(String[] args) {
        try {
            //First,load driver program
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            //Second,create connection 
            String url="jdbc:odbc:auto";
            String user="";
            String password="";
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            con=DriverManager.getConnection(url, user, password);
            st=con.createStatement();
            
            rs=st.executeQuery("select * from News");
            int i = 0;
            while(rs.next())
            {
                //System.out.println(rs.getString(2));
                String title = rs.getString(2);
                System.out.println(title);
                String content = rs.getString(3);
                String className = rs.getString(5);
                String image = rs.getString(7);
                Date publishDate = rs.getDate(9);
                int click = rs.getInt(10);
                boolean ok = rs.getBoolean(11);
                addNews(title,content,className,image,publishDate,click,ok);
                if(i++ % 10 == 0)
                	System.out.println(i);
                Thread.currentThread().sleep(10);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static void addNews(String title,
    					String content,
    					String className,
    					String image,
    					Date infoTime,
    					int click,
    					boolean ok){
    	News news = new News();
    	news.setTitle(title);
    	news.setContent(content);
    	news.setClick(click);
    	news.setImage(image);
    	news.setNo(System.currentTimeMillis()+"");
    	news.setPublishDate(infoTime);
    	news.setRecommend(ok);
    	news.setSimpleContent(title);
    	NewsBiz newsBiz = (NewsBiz) ac.getBean("newsBiz");
    	if("购车参谋".equals(className) || "购车实例".equals(className) || "贷款购车".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_JINGJI_XINDE);
    		news.setCategory(cate);
    	} else if("车辆保险".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_BAOXIAN);
    		news.setCategory(cate);
    	} else if("驾驶技巧".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_ZHONGJI_XINDE);
    		news.setCategory(cate);
    	} else if("爱车装饰".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_ZHUANGSHI);
    		news.setCategory(cate);
    	} else if("汽车保养".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_BAOYANG);
    		news.setCategory(cate);
    	} else if("降价信息".equals(className)){
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_BEIJING);
    		news.setCategory(cate);
    	} else{
    		Category cate = newsBiz.getEntityByUnique(Category.class, "orderNum", WebConstants.NEWS_NEWS);
    		news.setCategory(cate);
    	}
    	newsBiz.saveOrUpdateEntity(news);
    }

}
