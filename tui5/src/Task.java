// default package

import java.sql.Timestamp;

/**
 * Task entity. @author MyEclipse Persistence Tools
 */

public class Task implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private String shenhe;
	private String attachment1;
	private String attachment2;
	private String attachment3;
	private String attachment4;
	private String attachment5;
	private String qq;
	private String tel;
	private Long money;
	private Integer gaojianMount;
	private Long gaojianPrice;
	private Integer days;
	private Integer status;
	private Short nospider;
	private Timestamp publishDate;
	private Timestamp startDate;
	private Timestamp endDate;

	// Constructors

	/** default constructor */
	public Task() {
	}

	/** full constructor */
	public Task(String title, String content, String shenhe, String attachment1, String attachment2, String attachment3, String attachment4, String attachment5, String qq, String tel, Long money,
			Integer gaojianMount, Long gaojianPrice, Integer days, Integer status, Short nospider, Timestamp publishDate, Timestamp startDate, Timestamp endDate) {
		this.title = title;
		this.content = content;
		this.shenhe = shenhe;
		this.attachment1 = attachment1;
		this.attachment2 = attachment2;
		this.attachment3 = attachment3;
		this.attachment4 = attachment4;
		this.attachment5 = attachment5;
		this.qq = qq;
		this.tel = tel;
		this.money = money;
		this.gaojianMount = gaojianMount;
		this.gaojianPrice = gaojianPrice;
		this.days = days;
		this.status = status;
		this.nospider = nospider;
		this.publishDate = publishDate;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShenhe() {
		return this.shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	public String getAttachment1() {
		return this.attachment1;
	}

	public void setAttachment1(String attachment1) {
		this.attachment1 = attachment1;
	}

	public String getAttachment2() {
		return this.attachment2;
	}

	public void setAttachment2(String attachment2) {
		this.attachment2 = attachment2;
	}

	public String getAttachment3() {
		return this.attachment3;
	}

	public void setAttachment3(String attachment3) {
		this.attachment3 = attachment3;
	}

	public String getAttachment4() {
		return this.attachment4;
	}

	public void setAttachment4(String attachment4) {
		this.attachment4 = attachment4;
	}

	public String getAttachment5() {
		return this.attachment5;
	}

	public void setAttachment5(String attachment5) {
		this.attachment5 = attachment5;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Long getMoney() {
		return this.money;
	}

	public void setMoney(Long money) {
		this.money = money;
	}

	public Integer getGaojianMount() {
		return this.gaojianMount;
	}

	public void setGaojianMount(Integer gaojianMount) {
		this.gaojianMount = gaojianMount;
	}

	public Long getGaojianPrice() {
		return this.gaojianPrice;
	}

	public void setGaojianPrice(Long gaojianPrice) {
		this.gaojianPrice = gaojianPrice;
	}

	public Integer getDays() {
		return this.days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Short getNospider() {
		return this.nospider;
	}

	public void setNospider(Short nospider) {
		this.nospider = nospider;
	}

	public Timestamp getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}

	public Timestamp getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

}