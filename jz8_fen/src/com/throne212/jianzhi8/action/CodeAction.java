package com.throne212.jianzhi8.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.User;

@ParentPackage("basePackage")
public class CodeAction extends ActionSupport {
	
	@Resource
	private ContentDAO contentDAO;
	
	@Resource
	private UserDAO userDAO;
	
	//参数
	private Integer no;
	private String type;
	private String j;

	private Color getRandColor() {// 给定范围获得随机颜色
		int r = getInt(3,200,250);
		int g = getInt(3,200,250);;
		int b = getInt(3,200,250);;
		return new Color(r, g, b);
	}

	private int getInt(int len, int minVal, int maxVal) {
		Random random = new Random();
		double ran = random.nextDouble();
		for (int i = 0; i < len; i++) {
			ran *= 10;
		}
		int val = (int) ran;
		if (val > maxVal || val < minVal)
			return getInt(len, minVal, maxVal);
		else
			return val;
	}
	
	public String c(){
		Content content = contentDAO.findById(no);
		if(content == null)
			return null;
		if("Y".equals(j)){
			User user = null;
			List<User> userList = userDAO.findByUserId(content.getCtUserId());
			if (userList != null && userList.size() > 0)
				user = userList.get(0);
			if(user == null)
				return null;
			if("email".equals(type)){
				return operate(user.getUserEmail());
			}else if("qq".equals(type)){
				return operate(user.getUserQq());
			}else if("mobile".equals(type)){
				return operate(user.getUserMobile());
			}else if("phone".equals(type)){
				return operate(user.getUserPhone());
			}
		}else{
			if("email".equals(type)){
				return operate(content.getCtEmail());
			}else if("qq".equals(type)){
				return operate(content.getCtQq());
			}else if("mobile".equals(type)){
				return operate(content.getCtMobile());
			}else if("phone".equals(type)){
				return operate(content.getCtPhone());
			}
		}
		return null;
	}
	
	public String u(){
		User user = userDAO.findById(no);
		if(user == null)
			return null;
		if("email".equals(type)){
			return operate(user.getUserEmail());
		}else if("qq".equals(type)){
			return operate(user.getUserQq());
		}else if("mobile".equals(type)){
			return operate(user.getUserMobile());
		}else if("phone".equals(type)){
			return operate(user.getUserPhone());
		}else{
			return null;
		}
	}

	private String operate(String data) {
		if(no == null || Util.isEmpty(data))
			return null;
		try {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = response.getOutputStream();

			// 设置页面不缓存
			response.reset();
			response.setContentType("image/jpeg");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			if(data == null || "".equals(data) || data.trim().equals("")){
				os.flush();
				os.close();
				os = null;
				response.flushBuffer();
				return null;
			}

			// 在内存中创建图象
			int width = 200, height = 25;
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			// 获取图形上下文
			Graphics g = image.getGraphics();

			// 设定背景色
			g.setColor(new Color(255, 255, 255));
			g.fillRect(0, 0, width, height);

			// 设定字体
			g.setFont(new Font("黑体", Font.BOLD, 18));
			
			//干扰
			for (int i = 0; i < 2; i++) {
				g.setColor(new Color(0, 0, 0));
				g.drawString(".", getInt(1, 1, 9), getInt(2, 10, 20));
			}
			for (int i = 0; i < 5; i++) {
				g.setColor(new Color(0, 0, 0));
				g.drawString(".", getInt(2, 10, 99), getInt(2, 10, 20));
			}
			for (int i = 0; i < 2; i++) {
				g.setColor(new Color(0, 0, 0));
				g.drawString(".", getInt(3, 100, 250), getInt(2, 10, 20));
			}
			
			char[] seeds = data.toCharArray();
			// System.out.println("@@@@@@@@@@@@");
			String rand = "";
			for (int i = 0; i < seeds.length; i++) {
				rand = "" + seeds[i];
				g.setColor(new Color(0, 0, 0));// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
				g.drawString(rand, 10 * i, 20);
			}

			// 图象生效
			g.dispose();

			// 输出图象到页面
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
			encoder.encode(image);
			// ImageIO.write(image, "JPEG", response.getOutputStream());
			os.flush();
			os.close();
			os = null;
			response.flushBuffer();
		} catch (ImageFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getJ() {
		return j;
	}

	public void setJ(String j) {
		this.j = j;
	}
}
