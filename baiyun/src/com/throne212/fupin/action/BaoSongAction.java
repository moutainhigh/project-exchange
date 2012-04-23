package com.throne212.fupin.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.BaoSongBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

public class BaoSongAction extends BaseAction {

	private BaoSongBiz baoSongBiz;

	private PageBean pageBean;
	private Integer pageIndex;
	private Long orgId;
	
	private String status;
	private List<Org> orgList;

	private BaoSong baoSong;

	public BaoSongBiz getBaoSongBiz() {
		return baoSongBiz;
	}

	public void setBaoSongBiz(BaoSongBiz baoSongBiz) {
		this.baoSongBiz = baoSongBiz;
	}

	// actions
	public String baoSongList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		//pageBean = baoSongBiz.getBaoSongList(pageIndex == null ? 1 : pageIndex, user, status);
		pageBean = baoSongBiz.getBaoSongList(pageIndex == null ? 1 : pageIndex, user, status, orgId);
		
		orgList = baoSongBiz.getAll(Org.class);
		
		return "baosong_list";
	}

	// 查看
	public String viewBaoSong() {
		if (baoSong.getId() != null) {
			baoSong = baoSongBiz.getEntityById(BaoSong.class, baoSong.getId());
		}
		return "baosong_edit";
	}

	// 暂存
	public String saveBaoSong() {
		if (baoSong.getId() == null) {// 新增
			fillAttatch(baoSong);
			baoSong.setUser((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
			baoSong.setStatus(1);
			baoSongBiz.saveOrUpdateEntity(baoSong);
			this.setMsg("暂存报送信息成功");
			this.setSucc("Y");
		} else if (baoSong.getId() != null) {// 编辑
			BaoSong baoSongInDB = baoSongBiz.getEntityById(BaoSong.class, baoSong.getId());
			baoSongInDB.setTitle(baoSong.getTitle());
			baoSongInDB.setContent(baoSong.getContent());
			fillAttatch(baoSongInDB);
			baoSongBiz.saveOrUpdateEntity(baoSongInDB);
			this.setMsg("暂存报送信息成功");
			this.setSucc("Y");
		}
		return "baosong_edit";
	}

	private void fillAttatch(BaoSong b) {
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_ATTACH);
		if (fileName != null) {
			b.setAttatch1(fileName);
		}
	}

	// 发送
	public String sendBaoSong() {
		// 先保存
		this.saveBaoSong();

		// 再发送
		baoSong = baoSongBiz.getEntityById(BaoSong.class, baoSong.getId());
		int s = baoSong.getStatus();
		baoSong.setStatus(s == 4 ? 1 : s + 1);
		baoSong.setDate(new Date());
		baoSongBiz.saveOrUpdateEntity(baoSong);
		this.setMsg("发送报送信息成功");
		this.setSucc("Y");
		return "baosong_edit";
	}

	// 退回
	public String backBaoSong() {
		if (baoSong.getId() != null) {
			baoSong = baoSongBiz.getEntityById(BaoSong.class, baoSong.getId());
			baoSong.setStatus(4);
			baoSongBiz.saveOrUpdateEntity(baoSong);
			this.setMsg("退回报送信息成功");
			this.setSucc("Y");
		}
		return "baosong_edit";
	}

	// 删除
	public String deleteBaoSong() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			int sum = 0;
			for (String id : ids) {
				sum += baoSongBiz.deleteEntity(BaoSong.class, Long.parseLong(id));
			}
			if (sum > 0)
				this.setMsg("删除信息成功：" + ids.length);
		}
		return baoSongList();
	}
	
	//删除附件
	private String fileName;
	public String deleteAttatch(){
		if(!Util.isEmpty(fileName)){
			BaoSong b = baoSongBiz.getEntityByUnique(BaoSong.class, "attatch1", fileName);
			if(b != null){
				b.setAttatch1(null);
				baoSongBiz.saveOrUpdateEntity(b);
			}
		}
		return "upload";
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public BaoSong getBaoSong() {
		return baoSong;
	}

	public void setBaoSong(BaoSong baoSong) {
		this.baoSong = baoSong;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public List<Org> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<Org> orgList) {
		this.orgList = orgList;
	}

}
