package sf.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Pic {

	private Long id;
	private String title;
	private Date time;
	private String filePath;

	static SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

	public String getTimeText() {
		if (time == null)
			return "";
		return f.format(this.getTime());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
