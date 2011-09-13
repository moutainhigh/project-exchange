package eahoosoft.from_html_110913;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.freemarker.Common;
import eahoosoft.pojo.Category;
import eahoosoft.pojo.Feature;
import eahoosoft.pojo.Product;

public class Main {

	public static void main(String[] args) throws Exception {
		ProCate.main(null);
		Products.main(null);
		Guides.main(null);
		
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		//free
		Product p36 = new Product();
		p36.setBuyUrl(null);
		p36.setCate(null);
		p36.setDescription("<p>Eahoosoft video converter is <strong>freeware</strong> for users.<br>                  All-in-one powerful video converter  software to convert all videos Between <strong>AVI,  MPEG, WMV, H.264/AVC, DivX, MP4, MKV, RM, MOV, XviD, 3GP, FLV</strong> and other video  formats; Download it now and you will be surprised by this amazing Video  Converter.<br>                 Extract audio from videos and convert them to  audio (MP3, WMA) High-speed encoder ensures smooth conversion of video data. NO  Experience or Computer Skills Necessary! As easy as 1-2-3!  It works fast and steady,fast conversion speeds and high quality. Batch conversion  enables you to convert multiple videos to videos/music at the same time.  Support video preview when conversion. Clip your videos and personalize the  Output Video Clip function to convert any part of the video files and adjust  output setting in terms of your preferences. Adjust a variety of output  parameters: bit rate, Frame rate, sample rate, channel, codec, Aspect ratio,  and many others</p>");
		p36.setDownUrl("EahoosoftFreeVideoConverter.exe");
		p36.setFileName("free-video-converter");
		p36.setImage("free-video-converter-box.jpg");
		p36.setName("Free Eahoosoft Video Converter");
		p36.setPrice(null);
		p36.setScreenShot("free.jpg");
		p36.setShortDesc("Eahoosoft video converter is freeware for users.All-in-one powerful video converter software to convert all videos Between AVI, MPEG, WMV, H.264/AVC, DivX, MP4, MKV, RM, MOV, XviD, 3GP, FLV and other video formats; Download it now and you will be surprised by this amazing Video Converter.");
		p36.setSize("5.20Mb");
		p36.setShortName("Free Eahoosoft Video Converter");
		p36.setOrderNum(null);
		p36.setIndexOrderNum(null);
		p36.setFeatures(getFeature36(p36));
		s.save(p36);
		
		//image converter
		Product p38 = new Product();
		p38.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-15&q=1&v=0&d=0");
		p38.setCate((Category) s.load(Category.class, 6L));
		p38.setDescription("<p>With   this easy yet multifunctional  Image Converter download, you can convert   your photos handily without any technical knowledge required.</p>	        <p>Eahoosoft Image Converter is a very useful tool for image conversion, capable of <strong>batch converting the file format of images</strong>, supporting more than 14   formats including bmp, wbmp, jpeg, png, tiff, gif, pcx, tga, ico, psd, jp2, j2k,   dcx, pdf, etc. Changes image attributes, such as color, quality, brightness,   contrast, and more.            </p>");
		p38.setDownUrl("EahoosoftImageConverter.exe");
		p38.setFileName("eahoosoft-image-converter");
		p38.setImage("image-converter-box.png");
		p38.setName("Eahoosoft Image Converter");
		p38.setPrice(24.95);
		p38.setScreenShot("EahoosoftImageConverter.jpg");
		p38.setShortDesc("Eahoosoft Image Converter is a very useful tool for image conversion, capable of batch converting the file format of images.");
		p38.setSize("1.85Mb");
		p38.setShortName("Image Converter");
		p38.setOrderNum(23);
		p38.setIcon("new");
		p38.setVersion("2.0.0");
		p38.setFeatures(getFeature38(p38));
		s.save(p38);
		
		//funny game
		Product p39 = new Product();
		p39.setBuyUrl("http://itunes.apple.com/us/app/funny-bumper-ball/id451465399?ls=1&mt=8");
		p39.setCate((Category) s.load(Category.class, 5L));
		p39.setDescription("Here is a simple puzzle games. It is specifically designed for Apple iPad users.No matter straight horizontal or oblique ,if you make the five same colour ball into line, you can eliminate the ball to score. When the different colors of the ball turn into more and more, do you become hurry-scurry and disorderly? With the highly intelligent, can you vanquish these naughty wacky ball? Free download games and have a try!");
		p39.setDownUrl(null);
		p39.setFileName("funny-bumper-ball");
		p39.setDirName("ipad-games");
		p39.setImage("funny-bumper-ball-01.png");
		p39.setName("Eahoosoft Funny Bumper Ball");
		p39.setPrice(1.99);
		p39.setScreenShot("funny-bumper-ball-02.png");
		p39.setShortDesc("Here is a simple puzzle games. It is specifically designed for Apple iPad users.");
		p39.setSize("4.3Mb");
		p39.setShortName("Funny Bumper Ball");
		p39.setOrderNum(1);
		p39.setIcon("new");
		p39.setVersion("1.0.0");
		p39.setFeatures(getFeature39(p39));
		s.save(p39);
		
		//free ripper
		Product p40 = new Product();
		p40.setBuyUrl(null);
		p40.setCate((Category) s.load(Category.class, 4L));
		p40.setDescription("Eahoosoft CD Ripper - High-quality CD ripping software, DVDVideoMedia Free CD Ripper rips CD to nearly all audio formats MP3, WMA, WAV, AAC, FLAC, OGG, APE and many others, making CDs available on different music players. Rip CDs in a wink with DVDVideoMedia Free CD Ripper. Download this amazing Free CD ripperl now! ");
		p40.setDownUrl("free-cd-ripper.exe");
		p40.setFileName("free-cd-ripper");
		p40.setImage("free-cd-ripper.jpg");
		p40.setName("Eahoosoft Free CD Ripper");
		p40.setPrice(0.0);
		p40.setScreenShot("free-cd-ripper.jpg");
		p40.setShortDesc("Eahoosoft CD Ripper - High-quality CD ripping software, DVDVideoMedia Free CD Ripper rips CD to nearly all audio formats.");
		p40.setSize("1.6Mb");
		p40.setShortName("Free CD Ripper");
		p40.setOrderNum(4);
		p40.setIcon("free");
		p40.setVersion("2.0.0");
		p40.setFeatures(getFeature40(p40));
		s.save(p40);
		
		//WMA MP3 Converter for Mac
		Product p41 = new Product();
		p41.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-37");
		p41.setCate((Category) s.load(Category.class, 3L));
		p41.setDescription("<p align=\"left\">Here comes the amazing WMA MP3 converter for your MP3 player now! Eahoosoft WMA MP3 Converter for Mac converts almost all popular audio formats (WMA, WAV, AAC, FLAC, OGG, APE, etc.) to WMA MP3 audio files, as well as extracts WMA MP3 music from just about any video formats including high-definition (HD) video formats (AVI, MPEG, MP4, WMV, H.264/MPEG-4 AVC, AVCHD, etc.).<br/> The support for batch conversion, multithreading and multi-core CPU processing assure you of high WMA MP3 conversion speed. This WMA MP3 converter also gives you the options of customizing the output WMA MP3 audio files, converting a single file into multiple format files simultaneously, adding and editing audio effects and tweaking different output parameters for personalization. Have a free trial of Eahoosoft WMA MP3 Converter now to get your loved songs and music videos played on any MP3 player! </p>");
		p41.setDownUrl("wma-mp3-converter-mac.dmg");
		p41.setFileName("wma-mp3-converter-mac");
		p41.setImage("wma-mp3-box.jpg");
		p41.setName("Eahoosoft WMA MP3 Converter for Mac");
		p41.setPrice(19.95);
		p41.setScreenShot("wma-mp3-converter-mac.jpg");
		p41.setShortDesc("Here comes the amazing WMA MP3 converter for your MP3 player now! Eahoosoft WMA MP3 Converter for Mac converts almost all popular audio formats");
		p41.setSize("8.06Mb");
		p41.setShortName("WMA MP3 Converter for Mac");
		p41.setOrderNum(4);
		p41.setIcon("new");
		p41.setVersion("2.0.0");
		p41.setFeatures(getFeature41(p41));
		s.save(p41);
		
		//free mp3-cutter-joiner
		Product p42 = new Product();
		p42.setBuyUrl(null);
		p42.setCate((Category) s.load(Category.class, 4L));
		p42.setDescription("<p align=\"left\">Do you want to cut and get out the excellent part in an audio file? Do you want to join a lot of audio files into one file? Please test MP3 Cutter Joiner. It will be your best choice. Eahoosoft Free MP3 Cutter Joiner consists of a free MP3 Cutter and a free MP3 Joiner. It is much easier for you to get highlights from MP3 files with free MP3 Cutter function, howerver, with MP3 Joiner function, you can perfectly join many audio files into one</p>");
		p42.setDownUrl("free-mp3-cutter-joiner.exe");
		p42.setFileName("mp3-cutter-joiner");
		p42.setImage("wma-mp3-box.jpg");
		p42.setName("Eahoosoft MP3 Cutter Joiner");
		p42.setPrice(0.0);
		p42.setScreenShot("free-mp3-cutter-joiner.jpg");
		p42.setShortDesc("Please test MP3 Cutter Joiner. It will be your best choice. Eahoosoft Free MP3 Cutter Joiner consists of a free MP3 Cutter and a free MP3 Joiner. ");
		p42.setSize("7.87Mb");
		p42.setShortName("MP3 Cutter Joiner");
		p42.setOrderNum(5);
		p42.setIcon("free");
		p42.setVersion("2.0.0");
		p42.setFeatures(getFeature42(p42));
		s.save(p42);
		
		//长介绍
		List<Product> list = s.createQuery("from Product").list();
		for(Product pro : list){
			if(pro.getLongDesc() != null && !pro.getLongDesc().equals(""))
				continue;
			//长介绍
			String desc = pro.getDescription();
			int start = desc.indexOf(">")+1;
			int end = desc.indexOf("<br>");
			if(end < 0)
				end = desc.indexOf("<br/>");
			if(end < 0)
				end = desc.indexOf("</p>");
			
			if(end > 0 && end-start<300){
				end = desc.indexOf("<br>", end+5);
				if(end < 0)
					end = desc.indexOf("<br/>", end+5);
				if(end < 0)
					end = desc.indexOf("</p>", end+5);
			}
			
			if(end < 0)
				end = desc.length()-1;
			String longDesc = desc.substring(start, end);
			pro.setLongDesc(longDesc);
		}
		
		s.getTransaction().commit();
		s.close();
		
	}
	
	private static Set<Feature> getFeature36(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("User friendly interface","You can easily operate this free converting tool even you are fresh man. The guide on software interface will help you a lot."));
		set.add(buildFeature("Support popular formats","This free software allows you to convert AVI, MPEG, WMV, H.264/AVC, DivX, MP4, MKV, RM, MOV, XviD, 3GP, FLV or more."));
		set.add(buildFeature("Batch conversion","Drag the several files to the software, and it will convert them one by one."));
		set.add(buildFeature("Preview the movies ","To check the video is right for converting, you are able to preview it on Eahoosoft video converter."));
		set.add(buildFeature("Convert video to audio","Extract audio files from movies, means, convert any part of movies to mp3, wma directly."));
		set.add(buildFeature("High output quality and steady","This free software will convert your videos with high quality, fast and steady."));
		set.add(buildFeature("Clip videos","Clip movies you need and set the parameters as you like. You could set start and end time freely."));
		set.add(buildFeature("Merge the movie and audios","You will merge video and audios or merge many videos together."));
		set.add(buildFeature("Last but most important one Freeware is the best!!!",""));
		return set;
	}
	private static Set<Feature> getFeature38(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Supporting more than 14 formats including bmp, wbmp, jpeg, png, tiff, gif, pcx, tga, ico, psd, jp2, j2k, dcx, pdf, etc",""));
		set.add(buildFeature("Adjusts image size on scale or according to custom size",""));
		set.add(buildFeature("Capable of adding user-defined water mark onto images",""));
		set.add(buildFeature("Previews source files with effect previews",""));
		set.add(buildFeature("Supports image rotation",""));
		set.add(buildFeature("Very easy to use",""));
		return set;
	}
	private static Set<Feature> getFeature39(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("","<h4 style=\"background:none;\">"+
				  "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\" width=\"480\" height=\"320\" id=\"FLVPlayer\">"+
                  "  <param name=\"movie\" value=\"http://www.eahoosoft.com/video/funny-bumper-ball.swf\" />"+
                  "  <param name=\"salign\" value=\"lt\" />"+
                  "  <param name=\"quality\" value=\"high\" />"+
                  "  <param name=\"scale\" value=\"noscale\" />"+
                  "  <param name=\"FlashVars\" value=\"&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=http://www.eahoosoft.com/video/funny-bumper-ball&autoPlay=true&autoRewind=true\" />"+
                  "  <embed src=\"http://www.eahoosoft.com/video/funny-bumper-ball.swf\" flashvars=\"&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=http://www.eahoosoft.com/video/funny-bumper-ball&autoPlay=true&autoRewind=true\" quality=\"high\" scale=\"noscale\" width=\"480\" height=\"320\" name=\"FLVPlayer\" salign=\"LT\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" />"+                    
"</object>"+
"				</h4>"));
		return set;
	}
	private static Set<Feature> getFeature40(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Extract CD soundtrack",""));
		set.add(buildFeature("Rip CDs to MP3, WMA, WAV, AAC, FLAC, OGG, APE and many other audio formats",""));
		set.add(buildFeature("Rip one CD soundtrack to different format music files in one go",""));
		return set;
	}
	private static Set<Feature> getFeature41(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Transform Audio to WMA MP3 ","Supports WMA, WAV, AAC, FLAC, OGG, APE, and many others as input audio formats"));
		set.add(buildFeature("Extract WMA MP3 from Videos ","Extract WMA MP3 audio from different format SD and HD video files including AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD, and many others. "));
		set.add(buildFeature("Rip audio CD to WMA MP3 formats ",""));
		set.add(buildFeature("Clip Audio segments ",""));
		set.add(buildFeature("High-Speed WMA MP3 Audio Conversion ","Great support for multithreading and multi-core CPU processing accelerates the WMA MP3 audio conversion."));
		set.add(buildFeature("Batch WMA MP3 Conversion ","Converts multiple files to WMA MP3 audio files at one time."));
		set.add(buildFeature("System Requirements<br/>"+
"OS Supported:<br/>"+
"Mac OS X v10.5 - 10.6, Snow Leopard support<br/>"+
"Hardware Requirements:<br/>"+
"800MHz Intel or AMD CPU, or above;<br/>"+
"512MB RAM or more.",""));
		return set;
	}
	private static Set<Feature> getFeature42(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Cut pieces from big audio files and then convert them in MP3 or WAV or WMA or OGG format ",""));
		set.add(buildFeature("Marge multiple files or parts of multiple files into one big file.",""));
		set.add(buildFeature("Cut/join with high precision and without losing quality",""));
		set.add(buildFeature("Cut/join files directly without costing any other disk space",""));
		set.add(buildFeature("Rich options of MP3 encoder, WMA encoder and OGG encoder. Support MP3 VBR and OGG VBR.",""));
		set.add(buildFeature("With a small player built in for pre-listening",""));
		set.add(buildFeature("Support batch MP3 audios cutter",""));
		return set;
	}
	private static int i;
	private static Feature buildFeature(String title,String content){
		Feature f = new Feature();
		f.setTitle(title);
		f.setContent(content);
		f.setOrderNum(i++);
		return f;
	}
	
}
