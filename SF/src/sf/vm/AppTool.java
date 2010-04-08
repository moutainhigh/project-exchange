package sf.vm;

import java.util.List;

import sf.dao.ActivityDao;
import sf.dao.ContentDao;
import sf.dao.DivideDao;
import sf.dao.DownloadDao;
import sf.dao.FamilyDao;
import sf.dao.PicDao;
import sf.pojo.Activity;
import sf.pojo.Content;
import sf.pojo.Divide;
import sf.pojo.Download;
import sf.pojo.Family;
import sf.pojo.Pic;

public class AppTool {
	
	private static ContentDao contentDao = new ContentDao();
	private static FamilyDao familyDao = new FamilyDao();
	private static DivideDao divDao = new DivideDao();
	private static DownloadDao downDao = new DownloadDao();
	private static ActivityDao aDao = new ActivityDao();
	private static PicDao picDao = new PicDao();

	public String getAppTitle(){
		return "我爱传奇部落 - 传奇私服发布平台 【海量数据 实时更新 保证数据准确】";
	}
	
	public String getCharContent(){
		Content content = contentDao.getContentById(1L);
		return content.getContent();
	}
	
	public String getAdContent(){
		Content content = contentDao.getContentById(2L);
		return content.getContent();
	}
	
	public List<Family> getFamilies(){
		return familyDao.getAllFamliy();
	}
	
	public List<Divide> getDivides(){
		return divDao.getAllDivide();
	}
	
	public List<Download> getDownloads(){
		return downDao.getAllDownload();
	}
	
	public List<Activity> getActivities(){
		return aDao.getAllActivity();
	}
	
	public List<Pic> getPics(){
		return picDao.getAllPic();
	}
	
}
