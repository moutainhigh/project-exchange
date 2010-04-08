package sf.struts;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class FileForm extends ActionForm {

	private FormFile file;

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}

}
