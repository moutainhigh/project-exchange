package sf.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Download {

	private Long id;
	private String name;
	private Date time;
	private long size;
	private long up;
	private int comment;
	private String filePath;
	private String desc;
	
	static SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
	
	public String getTimeText(){
		if(time == null)
			return "";
		return f.format(this.getTime());
	}
	
	public String getSizeText(){
		if(size<1024){
			return size+"B";
		}else if(size<1024*1024){
			return size/1024 + "Kb";
		}else{
			return size/1024/1024+"Mb";
		}
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public long getUp() {
		return up;
	}

	public void setUp(long up) {
		this.up = up;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
