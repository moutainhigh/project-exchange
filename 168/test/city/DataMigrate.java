package city;

import hibernate.HibernateSessionFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.hibernate.Session;

import com.throne212.info168.web.domain.Area;

public class DataMigrate {
	
	static Session s = HibernateSessionFactory.getSession();
	static{
		s.beginTransaction();
	}

    public static void main(String[] args) {
        try {
            //First,load driver program
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            //Second,create connection 
            String url="jdbc:odbc:city";
            String user="";
            String password="";
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            con=DriverManager.getConnection(url, user, password);
            st=con.createStatement();
            
            rs=st.executeQuery("select * from firste_city");
            int i = 0;
            while(rs.next())
            {
                Long id = rs.getLong("fid");
                Long parentId = rs.getLong("f_up");
                String name = rs.getString("f_title");
                Integer grade = rs.getInt("f_grade");
                Area a = new Area();
                a.setId(id);
                a.setGrade(grade);
                a.setName(name);
                if(parentId != null && parentId!=0){
                	Area parent = (Area) s.get(Area.class, parentId);
                	a.setParent(parent);
                }
                s.saveOrUpdate(a);
                if(i++ % 10 == 0){
                	System.out.println(i);
                	s.flush();
                	s.clear();
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        s.getTransaction().commit();
    	s.close();
    }

}
