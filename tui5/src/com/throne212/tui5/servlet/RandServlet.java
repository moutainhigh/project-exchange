package com.throne212.tui5.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.throne212.tui5.common.Const;

public class RandServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("image/jpeg");
		response.setHeader("Cache-Control","no-cache, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Last-Modified",new java.util.Date().toString());
		response.setDateHeader("Expires",   0);  
		
		int width = 60, height = 20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, width, height);

		g.setColor(Color.black);
		g.drawRect(0, 0, width - 1, height - 1);

		String rand = request.getParameter("rand");
		if (rand == null) {
			Random r = new Random();
			int rst = 0;
			while ((rst = r.nextInt(10000)) < 1000) {

			}
			rand = rst + "";
		}
		switch (rand.length()) {
		case 1:
			rand = "000" + rand;
			break;
		case 2:
			rand = "00" + rand;
			break;
		case 3:
			rand = "0" + rand;
			break;
		default:
			rand = rand.substring(0, 4);
			break;
		}

		request.getSession().setAttribute(Const.SESS_RAND, rand);
		log.debug("gen rand=[" + rand + "]");

		g.setColor(Color.black);
		Integer tempNumber = new Integer(rand);
		String numberStr = tempNumber.toString();

		g.setFont(new Font("Atlantic Inline", Font.PLAIN, 18));
		String Str = numberStr.substring(0, 1);
		g.drawString(Str, 8, 17);

		Str = numberStr.substring(1, 2);
		g.drawString(Str, 20, 15);
		Str = numberStr.substring(2, 3);
		g.drawString(Str, 35, 18);

		Str = numberStr.substring(3, 4);
		g.drawString(Str, 45, 15);

		Random random = new Random();
		for (int i = 0; i < 20; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			g.drawOval(x, y, 0, 0);
		}
		g.dispose();

		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

}
