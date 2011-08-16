package eahoosoft.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class ModifyRight {
	public static void main(String[] args) throws Exception {

		File fromDir = new File("E:\\Program Files\\EasyPHP-5.3.6.1\\www");
		File toDir = new File("D:\\tmp\\new_eahoosoft");
		replace(fromDir.getAbsolutePath(), toDir.getAbsolutePath());
	}

	private static void replace(String htmlDir, String toHtmlDir) throws Exception {
		if (new File(htmlDir).isDirectory()) {
			File[] files = new File(htmlDir).listFiles();
			for (File f : files) {
				if (f.isFile() && f.getName().endsWith("html")) {
					BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
					File newFile = new File(toHtmlDir + File.separator + f.getName());
					if (!new File(toHtmlDir).exists())
						new File(toHtmlDir).mkdir();
					if (!newFile.exists())
						newFile.createNewFile();
					PrintWriter out = new PrintWriter(newFile);
					String str = null;
					while ((str = br.readLine()) != null) {
						String wStr = str;
						if (str.contains("<li><a href=\"/products-a-tools.html\" class=\"nav-more\">&gt;&gt; Learn More</a></li>")) {
							wStr = "<li><a href=\"/free-cd-ripper/free-cd-ripper.html\" class=\"free\">Free CD Ripper</a></li><li><a href=\"/products-a-tools.html\" class=\"nav-more\">&gt;&gt; Learn More</a></li><li class=\"listTitle\"><h3>iPhone/iPad Apps</h3></li><li><a href=\"/ipad-games/funny-bumper-ball.html\" class=\"\">Funny Bumper Ball for iPad</a></li><li><a href=\"/ipad-games/funny-bumper-ball.html\" class=\"nav-more\">&gt;&gt; Learn More</a></li>";
							System.out.println("正在修改：" + f.getName());
						}
						out.println(wStr);
					}
					out.close();
					br.close();
				} else if (f.isDirectory()) {
					replace(f.getAbsolutePath(), toHtmlDir + File.separator + f.getName());
				}
			}
		}
	}
}
