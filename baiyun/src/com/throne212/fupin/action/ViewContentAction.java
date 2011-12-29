package com.throne212.fupin.action;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Chengxiao;
import com.throne212.fupin.domain.Cuoshi;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Record;

public class ViewContentAction extends BaseAction {

	private Long id;// id
	private String type;// type
	private String content;//内容

	private BaseBiz baseBiz;

	public String execute() {
		if("cuoshi".equals(type)){
			Cuoshi c = baseBiz.getEntityById(Cuoshi.class, id);
			content = c.getContent();
		}else if("reason".equals(type)){
			Reason r = baseBiz.getEntityById(Reason.class, id);
			content = r.getContent();
		}else if("record".equals(type)){
			Record r = baseBiz.getEntityById(Record.class, id);
			content = r.getContent();
		}else if("chengxiao".equals(type)){
			Chengxiao c = baseBiz.getEntityById(Chengxiao.class, id);
			content = c.getContent();
		}
		return "success";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
