package sf.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import sf.common.Constant;

public class Info {
	
	private Long id;
	private String serverName="";
	private String serverIP="";
	private Date time;
	private String areaLine="";
	private String versionDesc="";
	private String serviceQQ="";
	private String website="";
	private String type="";
	private String timeText;
	
	private static SimpleDateFormat format = new SimpleDateFormat("M月/d日/H点mm分 开放");
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String getServerIP() {
		return serverIP;
	}
	public void setServerIP(String serverIP) {
		this.serverIP = serverIP;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getAreaLine() {
		return areaLine;
	}
	public void setAreaLine(String areaLine) {
		this.areaLine = areaLine;
	}
	public String getVersionDesc() {
		return versionDesc;
	}
	public void setVersionDesc(String versionDesc) {
		this.versionDesc = versionDesc;
	}
	public String getServiceQQ() {
		return serviceQQ;
	}
	public void setServiceQQ(String serviceQQ) {
		this.serviceQQ = serviceQQ;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTimeText() {
		if(Constant.INFO_TYPE_ALL_DAY.equals(type)){
			this.setTimeText("<font style=\"color:#0000FF;font-weight:600;\">==精品全天推荐==</font>");
		}else if(Constant.INFO_TYPE_TONG_XIAO.equals(type)){
			this.setTimeText("<font style=\"color:red;font-weight:600;\">==今日通宵固顶==</font>");
		}else if(Constant.INFO_TYPE_TIME.equals(type)){
			this.setTimeText(format.format(this.getTime()));
		}
		return timeText;
	}
	public void setTimeText(String timeText) {
		this.timeText = timeText;
	}
	public static void main(String[] args) {
		System.out.println(format.format(new Date()));
	}
}
