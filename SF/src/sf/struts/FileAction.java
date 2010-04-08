package sf.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import sf.common.FileUtil;
import sf.dao.DownloadDao;

public class FileAction extends DispatchAction {
	
	DownloadDao downDao = new DownloadDao();
	private static Logger log = Logger.getLogger(ContentAction.class);

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		FileForm f = (FileForm) form;
		FormFile file = f.getFile();
		log.debug("file="+file);
		if (file != null && !file.toString().equals("")) {
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path.substring(0, path.indexOf("WEB-INF"));
			path += "upload";
			log.debug("file saved path : " + path);
			String surFix = file.getFileName().substring(file.getFileName().lastIndexOf("."));
			String fileName = FileUtil.uploadFile(file, path,System.currentTimeMillis()+surFix);
			request.setAttribute("fileName", fileName);
			request.setAttribute("size", file.getFileSize());
		}
		return mapping.findForward("upload");
	}
	
}
