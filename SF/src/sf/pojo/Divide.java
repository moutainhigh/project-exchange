package sf.pojo;

public class Divide {

	private Long id;
	private String name;
	private String idText;
	private String version;
	private String groupNum;
	private int type;//1代表RMD散人
	private int orderNum;

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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

	public String getIdText() {
		return idText;
	}

	public void setIdText(String idText) {
		this.idText = idText;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
