package eahoosoft.test;

import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.pojo.Category;
import eahoosoft.pojo.Feature;
import eahoosoft.pojo.Product;

public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		//添加目录
		Category c1 = new Category();
		c1.setName("DVD/Video Tools");
		c1.setFileName("");
		s.save(c1);
		
		Category c2 = new Category();
		c2.setName("iPod/iPad/iPhone Tools");
		c2.setFileName("i");
		s.save(c2);
		
		Category c3 = new Category();
		c3.setName("Mac Software");
		c3.setFileName("m");
		s.save(c3);
		
		Category c4 = new Category();
		c4.setName("Audio Tools");
		c4.setFileName("m");
		s.save(c4);
		
		
		//添加产品
		Product p1 = new Product();
		p1.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-2");
		p1.setCate(c1);
		p1.setDescription("<p style=\"font-size:11px; line-height:20px\"><span class=\"clear\">All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons. There is nothing better than converting <b>MPEG2/MPEG-4 TS HD, HD WMV, FLV,AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC and HD</b> than using this video converter. You can convert your HD formatted video to SD, convert different video format like <b>DivX, H.264/AVC, WMV, MPEG-4, and AVI</b>. You can extract pictures and audios from videos. You can make your own video out of pictures with more convenient splitting, clipping, merging, and editing features.</span></p><p style=\"font-size:11px; line-height:20px\"><span class=\"clear\">HD video decoding and encoding like AVI to AVCHD allows you to make amazing high def videos for your High def players. This video converter can convert any of your files to be played on multimedia devices such as Creative Zen, iRiver, iPod, iPad, iPhone, Google Android phones, Apple TV, PS3, PSP, Blackberry phones, Wii, and NDS. </span></p>");
		p1.setDownUrl("VideoConverter.exe");
		p1.setFileName("eahoosoft-video-converter");
		p1.setImage("video-converter-box.jpg");
		p1.setName("Eahoosoft Video Converter");
		p1.setPrice(19.95);
		p1.setScreenShot("videoconverter1.jpg");
		p1.setShortDesc("All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons.");
		p1.setShortName("5.20Mb");
		p1.setFeatures(getFeature1(p1));
		s.save(p1);
		
		
		
		s.getTransaction().commit();
		s.close();
	}
	private static Set<Feature> getFeature1(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("High Definition Video Converter",
				"This video converter allows you to decode and encode high definition videos like MPEG2/MPEG-4 TS HD, HD WMV, FLV,MKV, AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC,  HD ASF, HD VOB, HD WMV, HD MPEG4, HD MPEG2 TS, HD MPEG2, and HD AVI."));
		set.add(buildFeature("All purpose Video Converter",
		"Convert MP4 to WMV or AVI or even vice versa. It allows you to convert MPEG, AVI, WMV,  H.264/AVC, MP4, MOV, FLV, 3GP, RM, DivX, XviD and more video settings without a fuss."));
		set.add(buildFeature("Sound extractor and converter",
		"This software allows you to extract audios from videos and convert b AVI to MP3. You can convert between MP3, M4A, RA, WAV, and WMA audio files. You can rip CD to music files and convert lossless audios."));
		set.add(buildFeature("Video Converter for Multimedia Gadgets",
		"Convert audio or video file and play them on different multimedia gadgets such as Google Android phones, mobile phones, PMP, Wii, NDS, Xbox, Zune, PS3, PSP, Apple TV, iPhone, iPad, and iPod, and even post it on YouTube!"));
		set.add(buildFeature("Video Merger and Video Clipper",
		"Merge multiple photos of videos and put in transition styles in between each clipping to create a better video stream. Clip a video to pick segments from it and join them together to make a completely new video."));
		set.add(buildFeature("Additional features",
		"<ul>"+
        "      <li>Extra video outline for the latest iPhone 4</li>"+
        "      <li>Powered by NVIDIA CUDA with five times quicker conversion period</li>"+
        "      <li>Allows transferring of output files to PSP, iPhone, and iPod</li>"+
		"					<li>Allows you to add a transitional effects at the middle of video merge for clean cuts and merging</li>"+
        "      <li>Categorize the profile setting into various types</li>"+
        "      <li>Extra Android MPEG-4 profile exclusively for Google phones</li>"+
		"					<li>Extra conversion output for Apple iPad</li>"+
        "      <li>Additional use of power management</li>"+
        "      <li>Split large files to a few smaller files</li>"+
		"					<li>Ready support Google Android phones and iPad: Samsung i7500, Motorola CLIQ, Motorola Droid, HTC Tattoo, HTC G2 Magic, HTC Hero, Nexus One</li>"+
        "    </ul>"));
		set.add(buildFeature("What's new in 2.1.2?",
		"<ul >"+
        "      <li>1. Support iPad MOV Format.</li>"+
        "      <li>2. Automatically shuts down or hibernate your computer once conversion is finished.</li>"+
        "    </ul>"));
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
