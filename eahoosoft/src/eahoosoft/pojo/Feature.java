package eahoosoft.pojo;

public class Feature implements Comparable<Feature> {

	private Long id;
	private String title;
	private String content;
	private Product product;
	private Integer orderNum;

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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public int compareTo(Feature o) {
		if (o == null)
			return -1;
		if (o.getOrderNum() == null)
			return -1;
		if (this.getOrderNum() == null)
			return 1;
		return this.getOrderNum() - o.getOrderNum();
	}

}
