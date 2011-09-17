package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ShenHeBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Record;

public class ShenHeAction extends BaseAction {
	private Integer pageIndex;
	private PageBean pageBean;
	private ShenHeBiz shenHeBiz;
	private CuoshiZhen cuoshiZhen;
	private ChengxiaoZhen chengxiaoZhen;
	private PicZhen picZhen;
	private CuoshiCun cuoshiCun;
	private ChengxiaoCun chengxiaoCun;
	private PicCun picCun;
	private CuoshiFamily cuoshiFamily;
	private ChengxiaoFamily chengxiaoFamily;
	private PicFamily picFamily;
	private Reason reason;
	private Record record;
	//镇 未审核措施列表
	public String showAllCuoshiZhenInPro(){
		pageBean=shenHeBiz.getAllCuoshiZhenByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "cuoshizhen_inpro";
	}
	//通过审核
	public String passCuoshiZhen(){
		if (cuoshiZhen!=null&&cuoshiZhen.getId()!=null) {
			cuoshiZhen=shenHeBiz.getEntityById(CuoshiZhen.class, cuoshiZhen.getId());
			cuoshiZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiZhen);
			this.setMsg("通过审核---操作成功！");
			return showAllCuoshiZhenInPro();
		}
		return "cuoshizhen_inpro";
	}
	//不通过审核
	public String notpassCuoshiZhen(){
		if (cuoshiZhen!=null&&cuoshiZhen.getId()!=null) {
			cuoshiZhen=shenHeBiz.getEntityById(CuoshiZhen.class, cuoshiZhen.getId());
			cuoshiZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiZhen);
			this.setMsg("不通过审核---操作成功！");
			return showAllCuoshiZhenInPro();
		}
		return "cuoshizhen_inpro";
		
		
	}
	//批量审核 通过
	public String passAllCuoshiZhen() {
		String[] cuoshiZhenIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiZhen_ids");
		if (cuoshiZhenIds != null && cuoshiZhenIds.length > 0) {
			for (String idStr : cuoshiZhenIds) {
				Long id = Long.parseLong(idStr);
				CuoshiZhen cuoshiZhen=shenHeBiz.getEntityById(CuoshiZhen.class, id);
				cuoshiZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiZhen);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllCuoshiZhenInPro();
	}
	//批量审核 不通过
	public String notpassAllCuoshiZhen() {
		String[] cuoshiZhenIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiZhen_ids");
		if (cuoshiZhenIds != null && cuoshiZhenIds.length > 0) {
			for (String idStr : cuoshiZhenIds) {
				Long id = Long.parseLong(idStr);
				CuoshiZhen cuoshiZhen=shenHeBiz.getEntityById(CuoshiZhen.class, id);
				cuoshiZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiZhen);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllCuoshiZhenInPro();
	}
	
	
	
	
	
	//镇 未审核成效列表
	public String  showAllChengxiaoZhenInPro() {
		pageBean=shenHeBiz.getAllChengxiaoZhenByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "chengxiaozhen_inpro";
	}
	//通过审核
	public String passChengxiaoZhen(){
		if (chengxiaoZhen!=null&&chengxiaoZhen.getId()!=null) {
			chengxiaoZhen=shenHeBiz.getEntityById(ChengxiaoZhen.class, chengxiaoZhen.getId());
			chengxiaoZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoZhen);
			this.setMsg("通过审核---操作成功！");
			return showAllChengxiaoZhenInPro();
		}
		return "chengxiaozhen_inpro";
	}
	//不通过审核
	public String notpassChengxiaoZhen() {
		if (chengxiaoZhen!=null&&chengxiaoZhen.getId()!=null) {
			chengxiaoZhen=shenHeBiz.getEntityById(ChengxiaoZhen.class, chengxiaoZhen.getId());
			chengxiaoZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoZhen);
			this.setMsg("不通过审核---操作成功！");
			return showAllChengxiaoZhenInPro();
		}
		return "chengxiaozhen_inpro";
	}

	//批量审核 通过
	public String passAllChengxiaoZhen() {
		String[] chengxiaoZhenIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoZhen_ids");
		if (chengxiaoZhenIds != null && chengxiaoZhenIds.length > 0) {
			for (String idStr : chengxiaoZhenIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoZhen chengxiaoZhen=shenHeBiz.getEntityById(ChengxiaoZhen.class, id);
				chengxiaoZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoZhen);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllChengxiaoZhenInPro();
	}
	//批量审核 不通过
	public String notpassAllChengxiaoZhen() {
		String[] chengxiaoZhenIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoZhen_ids");
		if (chengxiaoZhenIds != null && chengxiaoZhenIds.length > 0) {
			for (String idStr : chengxiaoZhenIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoZhen chengxiaoZhen=shenHeBiz.getEntityById(ChengxiaoZhen.class, id);
				chengxiaoZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoZhen);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllChengxiaoZhenInPro();
	}
	
	
	
	//镇 未审核图片列表
	public String  showAllPicZhenInPro() {
		pageBean=shenHeBiz.getAllPicZhenByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "piczhen_inpro";
	}
	//图片审核通过
	public String  passPicZhen() {
		if (picZhen!=null&&picZhen.getId()!=null) {
			picZhen=shenHeBiz.getEntityById(PicZhen.class, picZhen.getId());
			picZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(picZhen);
			this.setMsg("通过审核---操作成功！");
			return showAllPicZhenInPro();
		}
		return "piczhen_inpro";
	}
	//图片审核不通过
	public String  notpassPicZhen() {
		if (picZhen!=null&&picZhen.getId()!=null) {
			picZhen=shenHeBiz.getEntityById(PicZhen.class, picZhen.getId());
			picZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(picZhen);
			this.setMsg("不通过审核---操作成功！");
			return showAllPicZhenInPro();
		}
		return "piczhen_inpro";
		
	}
	//批量审核 通过
	public String passAllPicZhen() {
		String[] picZhenIds = (String[]) ActionContext.getContext().getParameters().get("picZhen_ids");
		if (picZhenIds != null && picZhenIds.length > 0) {
			for (String idStr : picZhenIds) {
				Long id = Long.parseLong(idStr);
				PicZhen picZhen=shenHeBiz.getEntityById(PicZhen.class, id);
				picZhen.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(picZhen);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllPicZhenInPro();
	}
	//批量审核 不通过
	public String notpassAllPicZhen() {
		String[] picZhenIds = (String[]) ActionContext.getContext().getParameters().get("picZhen_ids");
		if (picZhenIds != null && picZhenIds.length > 0) {
			for (String idStr : picZhenIds) {
				Long id = Long.parseLong(idStr);
				PicZhen picZhen=shenHeBiz.getEntityById(PicZhen.class, id);
				picZhen.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(picZhen);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllPicZhenInPro();
	}
	
	//村 未审核措施列表
	public String showAllCuoshiCunInPro() {
		pageBean=shenHeBiz.getAllCuoshiCunByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "cuoshicun_inpro";
	}
	//通过审核
	public String passCuoshiCun(){
		if (cuoshiCun!=null&&cuoshiCun.getId()!=null) {
			cuoshiCun=shenHeBiz.getEntityById(CuoshiCun.class, cuoshiCun.getId());
			cuoshiCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiCun);
			this.setMsg("通过审核---操作成功！");
			return showAllCuoshiCunInPro();
		}
		return "cuoshicun_inpro";
	}
	//不通过审核
	public String notpassCuoshiCun(){
		if (cuoshiCun!=null&&cuoshiCun.getId()!=null) {
			cuoshiCun=shenHeBiz.getEntityById(CuoshiCun.class, cuoshiCun.getId());
			cuoshiCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiCun);
			this.setMsg("不通过审核---操作成功！");
			return showAllCuoshiCunInPro();
		}
		return "cuoshicun_inpro";

	}
	//批量审核 通过
	public String passAllCuoshiCun() {
		String[] cuoshiCunIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiCun_ids");
		if (cuoshiCunIds != null && cuoshiCunIds.length > 0) {
			for (String idStr : cuoshiCunIds) {
				Long id = Long.parseLong(idStr);
				CuoshiCun cuoshiCun=shenHeBiz.getEntityById(CuoshiCun.class, id);
				cuoshiCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiCun);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllCuoshiCunInPro();
	}
	//批量审核 不通过
	public String notpassAllCuoshiCun() {
		String[] cuoshiCunIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiCun_ids");
		if (cuoshiCunIds != null && cuoshiCunIds.length > 0) {
			for (String idStr : cuoshiCunIds) {
				Long id = Long.parseLong(idStr);
				CuoshiCun cuoshiCun=shenHeBiz.getEntityById(CuoshiCun.class, id);
				cuoshiCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiCun);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllCuoshiCunInPro();
	}
	
	//村 未审核成效列表
	public String showAllChengxiaoCunInPro() {
		pageBean=shenHeBiz.getAllChengxiaoCunByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "chengxiaocun_inpro";
	}
	//通过审核
	public String passChengxiaoCun(){
		if (chengxiaoCun!=null&&chengxiaoCun.getId()!=null) {
			chengxiaoCun=shenHeBiz.getEntityById(ChengxiaoCun.class, chengxiaoCun.getId());
			chengxiaoCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoCun);
			this.setMsg("通过审核---操作成功！");
			return showAllChengxiaoCunInPro();
		}
		return "chengxiaocun_inpro";
	}
	//不通过审核
	public String notpassChengxiaoCun() {
		if (chengxiaoCun!=null&&chengxiaoCun.getId()!=null) {
			chengxiaoCun=shenHeBiz.getEntityById(ChengxiaoCun.class, chengxiaoCun.getId());
			chengxiaoCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoCun);
			this.setMsg("不通过审核---操作成功！");
			return showAllChengxiaoCunInPro();
		}
		return "chengxiaocun_inpro";
	}
	//批量审核 通过
	public String passAllChengxiaoCun() {
		String[] chengxiaoCunIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoCun_ids");
		if (chengxiaoCunIds != null && chengxiaoCunIds.length > 0) {
			for (String idStr : chengxiaoCunIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoCun chengxiaoCun=shenHeBiz.getEntityById(ChengxiaoCun.class, id);
				chengxiaoCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoCun);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllChengxiaoCunInPro();
	}
	//批量审核 不通过
	public String notpassAllChengxiaoCun() {
		String[] chengxiaoCunIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoCun_ids");
		if (chengxiaoCunIds != null && chengxiaoCunIds.length > 0) {
			for (String idStr : chengxiaoCunIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoCun chengxiaoCun=shenHeBiz.getEntityById(ChengxiaoCun.class, id);
				chengxiaoCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoCun);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllChengxiaoCunInPro();
	}
	
	
	
	
	//村 未审核图片列表
	public String  showAllPicCunInPro() {
		pageBean=shenHeBiz.getAllPicCunByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "piccun_inpro";
	}
	//图片审核通过
	public String  passPicCun() {
		if (picCun!=null&&picCun.getId()!=null) {
			picCun=shenHeBiz.getEntityById(PicCun.class, picCun.getId());
			picCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(picCun);
			this.setMsg("通过审核---操作成功！");
			return showAllPicCunInPro();
		}
		return "piccun_inpro";
	}
	//图片审核不通过
	public String  notpassPicCun() {
		if (picCun!=null&&picCun.getId()!=null) {
			picCun=shenHeBiz.getEntityById(PicCun.class, picCun.getId());
			picCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(picCun);
			this.setMsg("不通过审核---操作成功！");
			return showAllPicCunInPro();
		}
		return "piccun_inpro";
		
	}
	
	//批量审核 通过
	public String passAllPicCun() {
		String[] picCunIds = (String[]) ActionContext.getContext().getParameters().get("picCun_ids");
		if (picCunIds != null && picCunIds.length > 0) {
			for (String idStr : picCunIds) {
				Long id = Long.parseLong(idStr);
				PicCun picCun=shenHeBiz.getEntityById(PicCun.class, id);
				picCun.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(picCun);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllPicCunInPro();
	}
	//批量审核 不通过
	public String notpassAllPicCun() {
		String[] picCunIds = (String[]) ActionContext.getContext().getParameters().get("picCun_ids");
		if (picCunIds != null && picCunIds.length > 0) {
			for (String idStr : picCunIds) {
				Long id = Long.parseLong(idStr);
				PicCun picCun=shenHeBiz.getEntityById(PicCun.class, id);
				picCun.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(picCun);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllPicCunInPro();
	}
	
	//huhu
	//户 未审核措施列表
	public String showAllCuoshiFamilyInPro() {
		pageBean=shenHeBiz.getAllCuoshiFamilyByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "cuoshifamily_inpro";
	}
	//通过审核
	public String passCuoshiFamily(){
		if (cuoshiFamily!=null&&cuoshiFamily.getId()!=null) {
			cuoshiFamily=shenHeBiz.getEntityById(CuoshiFamily.class, cuoshiFamily.getId());
			cuoshiFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiFamily);
			this.setMsg("通过审核---操作成功！");
			return showAllCuoshiFamilyInPro();
		}
		return "cuoshifamily_inpro";
	}
	//不通过审核
	public String notpassCuoshiFamily(){
		if (cuoshiFamily!=null&&cuoshiFamily.getId()!=null) {
			cuoshiFamily=shenHeBiz.getEntityById(CuoshiFamily.class, cuoshiFamily.getId());
			cuoshiFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(cuoshiFamily);
			this.setMsg("不通过审核---操作成功！");
			return showAllCuoshiFamilyInPro();
		}
		return "cuoshifamily_inpro";

	}
	//批量审核 通过
	public String passAllCuoshiFamily() {
		String[] cuoshiFamilyIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiFamily_ids");
		if (cuoshiFamilyIds != null && cuoshiFamilyIds.length > 0) {
			for (String idStr : cuoshiFamilyIds) {
				Long id = Long.parseLong(idStr);
				CuoshiFamily cuoshiFamily=shenHeBiz.getEntityById(CuoshiFamily.class, id);
				cuoshiFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiFamily);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllCuoshiFamilyInPro();
	}
	//批量审核 不通过
	public String notpassAllCuoshiFamily() {
		String[] cuoshiFamilyIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiFamily_ids");
		if (cuoshiFamilyIds != null && cuoshiFamilyIds.length > 0) {
			for (String idStr : cuoshiFamilyIds) {
				Long id = Long.parseLong(idStr);
				CuoshiFamily cuoshiFamily=shenHeBiz.getEntityById(CuoshiFamily.class, id);
				cuoshiFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(cuoshiFamily);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllCuoshiFamilyInPro();
	}
	
	//户 未审核成效列表
	public String showAllChengxiaoFamilyInPro() {
		pageBean=shenHeBiz.getAllChengxiaoFamilyByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "chengxiaofamily_inpro";
	}
	//通过审核
	public String passChengxiaoFamily(){
		if (chengxiaoFamily!=null&&chengxiaoFamily.getId()!=null) {
			chengxiaoFamily=shenHeBiz.getEntityById(ChengxiaoFamily.class, chengxiaoFamily.getId());
			chengxiaoFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoFamily);
			this.setMsg("通过审核---操作成功！");
			return showAllChengxiaoFamilyInPro();
		}
		return "chengxiaofamily_inpro";
	}
	//不通过审核
	public String notpassChengxiaoFamily() {
		if (chengxiaoFamily!=null&&chengxiaoFamily.getId()!=null) {
			chengxiaoFamily=shenHeBiz.getEntityById(ChengxiaoFamily.class, chengxiaoFamily.getId());
			chengxiaoFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(chengxiaoFamily);
			this.setMsg("不通过审核---操作成功！");
			return showAllChengxiaoFamilyInPro();
		}
		return "chengxiaofamily_inpro";
	}
	//批量审核 通过
	public String passAllChengxiaoFamily() {
		String[] chengxiaoFamilyIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoFamily_ids");
		if (chengxiaoFamilyIds != null && chengxiaoFamilyIds.length > 0) {
			for (String idStr : chengxiaoFamilyIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoFamily chengxiaoFamily=shenHeBiz.getEntityById(ChengxiaoFamily.class, id);
				chengxiaoFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoFamily);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllChengxiaoFamilyInPro();
	}
	//批量审核 不通过
	public String notpassAllChengxiaoFamily() {
		String[] chengxiaoFamilyIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoFamily_ids");
		if (chengxiaoFamilyIds != null && chengxiaoFamilyIds.length > 0) {
			for (String idStr : chengxiaoFamilyIds) {
				Long id = Long.parseLong(idStr);
				ChengxiaoFamily chengxiaoFamily=shenHeBiz.getEntityById(ChengxiaoFamily.class, id);
				chengxiaoFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(chengxiaoFamily);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllChengxiaoFamilyInPro();
	}
	//户 未审核图片列表
	public String  showAllPicFamilyInPro() {
		pageBean=shenHeBiz.getAllPicFamilyByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "picfamily_inpro";
	}
	//图片审核通过
	public String  passPicFamily() {
		if (picFamily!=null&&picFamily.getId()!=null) {
			picFamily=shenHeBiz.getEntityById(PicFamily.class, picFamily.getId());
			picFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(picFamily);
			this.setMsg("通过审核---操作成功！");
			return showAllPicFamilyInPro();
		}
		return "picfamily_inpro";
	}
	//图片审核不通过
	public String  notpassPicFamily() {
		if (picFamily!=null&&picFamily.getId()!=null) {
			picFamily=shenHeBiz.getEntityById(PicFamily.class, picFamily.getId());
			picFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(picFamily);
			this.setMsg("不通过审核---操作成功！");
			return showAllPicFamilyInPro();
		}
		return "picfamily_inpro";
		
	}
	//批量审核 通过
	public String passAllPicFamily() {
		String[] picFamilyIds = (String[]) ActionContext.getContext().getParameters().get("picFamily_ids");
		if (picFamilyIds != null && picFamilyIds.length > 0) {
			for (String idStr : picFamilyIds) {
				Long id = Long.parseLong(idStr);
				PicFamily picFamily=shenHeBiz.getEntityById(PicFamily.class, id);
				picFamily.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(picFamily);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllPicFamilyInPro();
	}
	//批量审核 不通过
	public String notpassAllPicFamily() {
		String[] picFamilyIds = (String[]) ActionContext.getContext().getParameters().get("picFamily_ids");
		if (picFamilyIds != null && picFamilyIds.length > 0) {
			for (String idStr : picFamilyIds) {
				Long id = Long.parseLong(idStr);
				PicFamily picFamily=shenHeBiz.getEntityById(PicFamily.class, id);
				picFamily.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(picFamily);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllPicFamilyInPro();
	}
	//reason
	//户 未审核贫困原因列表
	public String  showAllReasonInPro() {
		pageBean=shenHeBiz.getAllReasonByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "reason_inpro";
	}
	//贫困原因审核通过
	public String  passReason() {
		if (reason!=null&&reason.getId()!=null) {
			reason=shenHeBiz.getEntityById(Reason.class, reason.getId());
			reason.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(reason);
			this.setMsg("通过审核---操作成功！");
			return showAllReasonInPro();
		}
		return "reason_inpro";
	}
	//贫困原因审核不通过
	public String  notpassReason() {
		if (reason!=null&&reason.getId()!=null) {
			reason=shenHeBiz.getEntityById(Reason.class, reason.getId());
			reason.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(reason);
			this.setMsg("不通过审核---操作成功！");
			return showAllReasonInPro();
		}
		return "reason_inpro";
		
	}
	//批量审核 通过
	public String passAllReason() {
		String[] reasonIds = (String[]) ActionContext.getContext().getParameters().get("reason_ids");
		if (reasonIds != null && reasonIds.length > 0) {
			for (String idStr : reasonIds) {
				Long id = Long.parseLong(idStr);
				Reason reason=shenHeBiz.getEntityById(Reason.class, id);
				reason.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(reason);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllReasonInPro();
	}
	//批量审核 不通过
	public String notpassAllReason() {
		String[] reasonIds = (String[]) ActionContext.getContext().getParameters().get("reason_ids");
		if (reasonIds != null && reasonIds.length > 0) {
			for (String idStr : reasonIds) {
				Long id = Long.parseLong(idStr);
				Reason reason=shenHeBiz.getEntityById(Reason.class, id);
				reason.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(reason);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllReasonInPro();
	}
	
	//record
	//户 未审核帮扶记录列表
	public String  showAllRecordInPro() {
		pageBean=shenHeBiz.getAllRecordByStatus(WebConstants.SHENHE_STATUS_PROCECING,pageIndex);
		return "record_inpro";
	}
	//帮扶记录审核通过
	public String  passRecord() {
		if (record!=null&&record.getId()!=null) {
			record=shenHeBiz.getEntityById(Record.class, record.getId());
			record.setStatus(WebConstants.SHENHE_STATUS_PASS);
			shenHeBiz.saveOrUpdateEntity(record);
			this.setMsg("通过审核---操作成功！");
			return showAllRecordInPro();
		}
		return "record_inpro";
	}
	//帮扶记录审核不通过
	public String  notpassRecord() {
		if (record!=null&&record.getId()!=null) {
			record=shenHeBiz.getEntityById(Record.class, record.getId());
			record.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
			shenHeBiz.saveOrUpdateEntity(record);
			this.setMsg("不通过审核---操作成功！");
			return showAllRecordInPro();
		}
		return "record_inpro";
		
	}
	//批量审核 通过
	public String passAllRecord() {
		String[] recordIds = (String[]) ActionContext.getContext().getParameters().get("record_ids");
		if (recordIds != null && recordIds.length > 0) {
			for (String idStr : recordIds) {
				Long id = Long.parseLong(idStr);
				Record record=shenHeBiz.getEntityById(Record.class, id);
				record.setStatus(WebConstants.SHENHE_STATUS_PASS);
				shenHeBiz.saveOrUpdateEntity(record);
			}
			this.setMsg("通过审核———操作成功！");
		}
		return showAllRecordInPro();
	}
	//批量审核 不通过
	public String notpassAllRecord() {
		String[] recordIds = (String[]) ActionContext.getContext().getParameters().get("record_ids");
		if (recordIds != null && recordIds.length > 0) {
			for (String idStr : recordIds) {
				Long id = Long.parseLong(idStr);
				Record record=shenHeBiz.getEntityById(Record.class, id);
				record.setStatus(WebConstants.SHENHE_STATUS_UNPASS);
				shenHeBiz.saveOrUpdateEntity(record);
			}
			this.setMsg("不通过审核———操作成功！");
		}
		return showAllRecordInPro();
	}
	
	
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public ShenHeBiz getShenHeBiz() {
		return shenHeBiz;
	}
	public void setShenHeBiz(ShenHeBiz shenHeBiz) {
		this.shenHeBiz = shenHeBiz;
	}
	public CuoshiZhen getCuoshiZhen() {
		return cuoshiZhen;
	}
	public void setCuoshiZhen(CuoshiZhen cuoshiZhen) {
		this.cuoshiZhen = cuoshiZhen;
	}
	public ChengxiaoZhen getChengxiaoZhen() {
		return chengxiaoZhen;
	}
	public void setChengxiaoZhen(ChengxiaoZhen chengxiaoZhen) {
		this.chengxiaoZhen = chengxiaoZhen;
	}
	public PicZhen getPicZhen() {
		return picZhen;
	}
	public void setPicZhen(PicZhen picZhen) {
		this.picZhen = picZhen;
	}
	public CuoshiCun getCuoshiCun() {
		return cuoshiCun;
	}
	public void setCuoshiCun(CuoshiCun cuoshiCun) {
		this.cuoshiCun = cuoshiCun;
	}
	public ChengxiaoCun getChengxiaoCun() {
		return chengxiaoCun;
	}
	public void setChengxiaoCun(ChengxiaoCun chengxiaoCun) {
		this.chengxiaoCun = chengxiaoCun;
	}
	public PicCun getPicCun() {
		return picCun;
	}
	public void setPicCun(PicCun picCun) {
		this.picCun = picCun;
	}
	public CuoshiFamily getCuoshiFamily() {
		return cuoshiFamily;
	}
	public void setCuoshiFamily(CuoshiFamily cuoshiFamily) {
		this.cuoshiFamily = cuoshiFamily;
	}
	public ChengxiaoFamily getChengxiaoFamily() {
		return chengxiaoFamily;
	}
	public void setChengxiaoFamily(ChengxiaoFamily chengxiaoFamily) {
		this.chengxiaoFamily = chengxiaoFamily;
	}
	public PicFamily getPicFamily() {
		return picFamily;
	}
	public void setPicFamily(PicFamily picFamily) {
		this.picFamily = picFamily;
	}
	public Reason getReason() {
		return reason;
	}
	public void setReason(Reason reason) {
		this.reason = reason;
	}
	public Record getRecord() {
		return record;
	}
	public void setRecord(Record record) {
		this.record = record;
	}
	
	
	
	
	

}
