package com.throne212.info168.web.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class RandAction extends BaseAction {

	public static ImageCaptchaService capService = new DefaultManageableImageCaptchaService();

	private InputStream imageStream;

	public String execute() {

		HttpServletResponse httpServletResponse = ServletActionContext.getResponse();
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();

		byte[] captchaChallengeAsJpeg = null;
		// the output stream to render the captcha image as jpeg into
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
		try {
			// get the session id that will identify the generated captcha.
			// the same id must be used to validate the response, the session id
			// is a good candidate!
			String captchaId = httpServletRequest.getSession().getId();
			// call the ImageCaptchaService getChallenge method
			BufferedImage challenge = capService.getImageChallengeForID(captchaId, httpServletRequest.getLocale());
			// a jpeg encoder
			JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(jpegOutputStream);
			jpegEncoder.encode(challenge);
			// read
			captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
			imageStream = new ByteArrayInputStream(captchaChallengeAsJpeg);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		// flush it in the response
		httpServletResponse.setHeader("Cache-Control", "no-store");
		httpServletResponse.setHeader("Pragma", "no-cache");
		httpServletResponse.setDateHeader("Expires", 0);
		httpServletResponse.setContentType("image/jpeg");
		return "success";

	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

}
