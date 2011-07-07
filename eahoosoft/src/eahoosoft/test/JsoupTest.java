package eahoosoft.test;

import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupTest {
	public static void main(String[] args) throws Exception{
		System.out.println("Eahoosoft DVD Ripper - one of the best dvd ripper software, can rip DVD to MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc. with fast DVD ripping speed and excellent image and sound quality. ".length());
		URL url = new URL("http://www.eahoosoft.com/guide/youtube-to-zune-converter.html");
		Document doc = Jsoup.parse(url, 10000);
		
		Element head = doc.head();
		Elements list = doc.select("meta");
		
		for(Element e : list){
			System.out.println(e.toString());
		}
		
	}
}
