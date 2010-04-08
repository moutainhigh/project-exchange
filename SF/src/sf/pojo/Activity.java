package sf.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Activity {

	private Long id;
	private String title;
	private String content;
	private Date time;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}
	
	static SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
	public String getTimeText() {
		return f.format(this.getTime());
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
