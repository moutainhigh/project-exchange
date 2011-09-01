package eahoosoft.test;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;

import eahoosoft.dao.HibernateSessionFactory;
import eahoosoft.freemarker.Common;
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
		c4.setFileName("a");
		s.save(c4);
		
		Category c5 = new Category();
		c5.setName("iPhone/iPad Apps");
		c5.setFileName("g");
		s.save(c5);
		
		
		//添加产品
		Product p1 = new Product();
		p1.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-2&q=1&v=0&d=0");
		p1.setCate(c1);
		p1.setDescription("<p><span class=\"clear\">All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons. There is nothing better than converting <b>MPEG2/MPEG-4 TS HD, HD WMV, FLV,AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC and HD</b> than using this video converter. You can convert your HD formatted video to SD, convert different video format like <b>DivX, H.264/AVC, WMV, MPEG-4, and AVI</b>. You can extract pictures and audios from videos. You can make your own video out of pictures with more convenient splitting, clipping, merging, and editing features.</span></p><p style=\"font-size:11px; line-height:20px\"><span class=\"clear\">HD video decoding and encoding like AVI to AVCHD allows you to make amazing high def videos for your High def players. This video converter can convert any of your files to be played on multimedia devices such as Creative Zen, iRiver, iPod, iPad, iPhone, Google Android phones, Apple TV, PS3, PSP, Blackberry phones, Wii, and NDS. </span></p>");
		p1.setDownUrl("VideoConverter.exe");
		p1.setFileName("eahoosoft-video-converter");
		p1.setImage("video-converter-box.jpg");
		p1.setName("Eahoosoft Video Converter");
		p1.setPrice(29.95);
		p1.setScreenShot("videoconverter1.jpg");
		p1.setShortDesc("All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons.");
		p1.setShortName("Video Converter");
		p1.setSize("5.20Mb");
		p1.setFeatures(getFeature1(p1));
		p1.setOrderNum(4);
		p1.setVersion("V2.1.2");
		s.save(p1);
		
		Product p2 = new Product();
		p2.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-9&q=1&v=0&d=0");
		p2.setCate(c2);
		p2.setDescription("<p align=\"left\">"+
"				Eahoosoft iPad Converter Suite integrates two useful software, including Eahoosoft DVD to iPad Converter software (iPad DVD software) and iPad Video Converter software. All these two kinds of software are great assistants to your iPad."+
"<br>"+
"Eahoosoft iPad Converter Suite provides powerful and professional functions. With this iPad software pack, you can rip any DVD files (DVD-Video, DVD folder and DVD IFO file) to iPad. Also you can convert all popular videos/audios to iPad formats. "+
"<br>"+
"Apart from the major functions, Eahoosoft iPad Converter Suite also provides lots of useful editing functions. You can trim, crop your videos. You can even join multiple pieces of videos or audios together as a single one. Moreover, Eahoosoft iPad Converter Suite enables you to adjust your video effect through the function of editing effect."+
 "</p>");
		p2.setDownUrl("iPadConverterSuite.exe");
		p2.setFileName("ipad-converter-suite");
		p2.setImage("ipadconvertersuite-box.jpg");
		p2.setName("Eahoosoft iPad Converter Suite");
		p2.setPrice(24.95);
		p2.setScreenShot("ipad-converter-suite-bk.jpg");
		p2.setShortDesc("Integrates two useful software, including Eahoosoft DVD to iPad Converter software (iPad DVD software) and iPad Video Converter software. ");
		p2.setSize("12.6Mb");
		p2.setShortName("iPad Converter Suite");
		p2.setOrderNum(1);
		p2.setIndexOrderNum(2);
		p2.setVersion("V2.0.1");
		p2.setFeatures(getFeature2(p2));
		s.save(p2);
		
		
		Product p3 = new Product();
		p3.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-10&q=1&v=0&d=0");
		p3.setCate(c1);
		p3.setDescription("<p align=\"left\">"+
"				Eahoosoft DVD Converter Suite is the perfect combination of Eahoosoft DVD Ripper, Eahoosoft Video Converter. With these powerful DVD Converter Suite, you can easily convert DVD and video to all the popular formats: MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc, extract audio from DVD movie or video file and convert them to M4A, MP3, AC3, AAC, WMA, WAV, OGG easily and fast with high quality."+
"<br>"+
"Eahoosoft DVD Converter Suite supports almost all the portable devices, such as: PSP, iPod Classic, iPod Touch, iPod Nano, iPhone (4G), iPhone, Zune, Zune 2, Blackberry, Nokia, Creative Zen, iRiver PMP, Archos, PS3, Apple TV, Xbox, iPAD, Mobile Phone, etc. You can enjoy your favorite DVD and video files on them."+
"<br>"+
"Eahoosoft DVD Converter Suite has strong movie editing functions of movie joiner, movie cutter and movie crop for you to edit your movie. It also allows you to customize the settings including video and audio bitrate, resolution, frame rate, etc. You can also choose the audio track and subtitle of DVD to meet your needs."+
"<br>"+
"Eahoosoft DVD Converter Suite is very user-friendly and easy to use, you can convert DVD an video to various video and audio formats with just a few clicks for you mouse. Free download valuable Eahoosoft DVD Converter Suite, enjoy your wonderful digital life."+
"</p>");
		p3.setDownUrl("dvdconvertersuite.exe");
		p3.setFileName("dvd-converter-suite");
		p3.setImage("dvdconvertersuite-box.jpg");
		p3.setName("Eahoosoft DVD Converter Suite");
		p3.setPrice(39.00);
		p3.setScreenShot("dvdconvertersuite.jpg");
		p3.setShortDesc("Eahoosoft DVD Converter Suite is the perfect combination of Eahoosoft DVD Ripper, Eahoosoft Video Converter.");
		p3.setSize("12.6Mb");
		p3.setShortName("DVD Converter Suite");
		p3.setOrderNum(1);
		p3.setIndexOrderNum(1);
		p3.setIcon("hot");
		p3.setVersion("V2.0.1");
		p3.setFeatures(getFeature3(p3));
		s.save(p3);
		
		
		Product p4 = new Product();
		p4.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-6&q=1&v=0&d=0");
		p4.setCate(c4);
		p4.setDescription("<p><strong>Eahoosoft Audio Converter</strong> is a powerful all-in-one professional audio converter for audio conversion, audio extraction, audio CD ripping . Using Eahoosoft Audio Converter, you can convert between different audio formats including <strong>MP3, WMA, WAV, AAC, FLAC, OGG, APE, such as you can convert video to mp3, rip audio from popular video formats including high-definition (HD) videos such as AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD</strong>, rip music CD to different audio formats</p>"+
"<p><strong>Eahoosoft Audio Converter</strong> also allows you to   convert or rip multiple tracks to multiple formats at once, clip audio segments,   merge into a single audio file, and create customized audio files by adjusting a   range of output parameters. Super high audio conversion speed is offered with   multi-core CPU processing and multithreading both supported. </p>");
		p4.setDownUrl("AudioConverter.exe");
		p4.setFileName("eahoosoft-audio-converter");
		p4.setImage("audio-converter-box.jpg");
		p4.setName("Eahoosoft Audio Converter");
		p4.setPrice(24.95);
		p4.setScreenShot("audio-s.jpg");
		p4.setShortDesc("Eahoosoft Audio Converter is a powerful all-in-one professional audio converter for audio conversion, audio extraction, audio CD ripping.");
		p4.setSize("8.06Mb");
		p4.setShortName("Audio Converter");
		p4.setOrderNum(1);
		p4.setVersion("V2.0.1");
		p4.setFeatures(getFeature4(p4));
		s.save(p4);
		
		Product p5 = new Product();
		p5.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-11&q=1&v=0&d=0");
		p5.setCate(c3);
		p5.setDescription("<p><span class=\"clear\">All-in-one powerful video converter software for mac that allows you to modify and convert audio, video, and animated icons. There is nothing better than converting <b>MPEG2/MPEG-4 TS HD, HD WMV, FLV,AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC and HD</b> than using this video converter. You can convert your HD formatted video to SD, convert different video format like <b>DivX, H.264/AVC, WMV, MPEG-4, and AVI</b>. You can extract pictures and audios from videos. You can make your own video out of pictures with more convenient splitting, clipping, merging, and editing features.</span></p>"+
"<p><span class=\"clear\">HD video decoding and encoding like AVI to AVCHD allows you to make amazing high def videos for your High def players. This video converter can convert any of your files to be played on multimedia devices such as Creative Zen, iRiver, iPod, iPad, iPhone, Google Android phones, Apple TV, PS3, PSP, Blackberry phones, Wii, and NDS. </span></p>");
		p5.setDownUrl("video-converter-mac.dmg");
		p5.setFileName("video-converter-mac");
		p5.setImage("video-converter-box.jpg");
		p5.setName("Eahoosoft Video Converter for Mac");
		p5.setPrice(29.95);
		p5.setScreenShot("video-converter-mac.jpg");
		p5.setShortDesc("All-in-one powerful video converter software for mac that allows you to modify and convert audio, video, and animated icons.");
		p5.setSize("8.06Mb");
		p5.setShortName("Video Converter for Mac");
		p5.setOrderNum(1);
		p5.setIcon("new");
		p5.setVersion("V2.0.1");
		p5.setFeatures(getFeature5(p5));
		s.save(p5);
		
		Product p6 = new Product();
		p6.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-8&q=1&v=0&d=0");
		p6.setCate(c1);
		p6.setDescription("<p align=\"left\">Eahoosoft DVD Ripper - one of the best dvd ripper software, can rip DVD to <b>MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc</b>. with fast DVD ripping speed and excellent image and sound quality.<br>                    Eahoosoft DVD Ripper support almost all popular portable players, with the Best DVD Ripper software, you can easily rip your DVD to <b>iPad, iPhone 4, PSP, iPod Classic, iPod Touch, iPod Nano, iPhone (3G), iPhone, Zune, Zune 2, Blackberry, Nokia, Creative Zen, Sony Walkman, iRiver PMP, Archos, PS3, Apple TV, Xbox, iPAQ, NDS, Pocket PC, Mobile Phone, etc</b>. It is really outstanding and best DVD Ripper software. <br>                    This Best DVD Ripper provides easy and powerful movie edit functions, such as video trimming, video effecting and video cropping, which cater to customer's personal need. Compared with other DVD Ripper software, the best DVD Ripper has more settings you can customize, such as customize video and audio bitrate, adjust resolution, set frame rate, etc. <br>                    With Eahoosoft DVD Ripper software, you can get excellent image and luxuriant sound in smaller file size just within a few clicks. </p>");
		p6.setDownUrl("DVDRipper.exe");
		p6.setFileName("eahoosoft-dvd-ripper");
		p6.setImage("dvd-ripper-box.jpg");
		p6.setName("Eahoosoft DVD Ripper");
		p6.setPrice(29.95);
		p6.setScreenShot("dvd-ripper.jpg");
		p6.setShortDesc("One of the best dvd ripper software, can rip DVD to MP4, H.264, AVI, MP3, WMV, WMA, FLV, 3GP, RMVB, WAV, etc. with fast speed and excellent image and sound quality.");
		p6.setSize("7.15Mb");
		p6.setShortName("DVD Ripper");
		p6.setOrderNum(2);
		p6.setIcon("hot");
		p6.setIndexOrderNum(3);
		p6.setVersion("V2.0.1");
		p6.setFeatures(getFeature6(p6));
		s.save(p6);
		
		Product p7 = new Product();
		p7.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-22");
		p7.setCate(c1);
		p7.setDescription("<p align=\"left\">Eahoosoft DVD Audio Ripper is the best DVD Audio Ripper and DVD Audio Extractor, which can rip DVD to the most popular audio formats including MP3, WMA, WAV, OGG, AAC, AC3, AIFF, AU, FLAC and extract the audio from the DVD movie. The ripped audio files can be played on all popular MP3 players like iPod, iPod nano, iPod shuffle, Sansa, Zune, PSP, iPhone, iRiver, Archos, Creative Zen etc and mobile phones.<br>Eahoosoft DVD Audio Ripper provides you with rich options to set audio properties such as audio bitrate, Sample Rate, etc. It also has powerful function of trimming for you to set up your segment. In the process of converting, you can select target subtitle and audio track according to your need.</p>");
		p7.setDownUrl("DVDAudioRipper.exe");
		p7.setFileName("dvd-audio-ripper");
		p7.setImage("dvd-audio-ripper-box.jpg");
		p7.setName("Eahoosoft DVD Audio Ripper");
		p7.setPrice(19.95);
		p7.setScreenShot("dvd-audio-ripper.jpg");
		p7.setShortDesc("The best DVD Audio Ripper and DVD Audio Extractor, which can rip DVD to the most popular audio formats including MP3, WMA, WAV and extract the audio from the DVD movie.");
		p7.setSize("7.08Mb");
		p7.setShortName("DVD Audio Ripper");
		p7.setOrderNum(3);
		p7.setIcon(null);
		p7.setVersion("V2.0.1");
		p7.setFeatures(getFeature7(p7));
		s.save(p7);
		
		Product p8 = new Product();
		p8.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=05");
		p8.setCate(c1);
		p8.setDescription("<p>Eahoosoft MP4 Video Converter is a professional MP4 Video Converter which is designed to convert almost any video formats to MP4 video formats, such as <strong>AVI to MP4, WMV to MP4</strong>. In addition, the MP4 converter provides a powerful way to convert video and audio files to MP3, M4A, AAC,AC3, OGG, WAV, etc.<br>This MP4 Video Converter also provides you with flexible video editing options such as crop video, trim file segment, etc. These features make Eahoosoft MP4 Video Converter the best solution to enjoy your favorite video on iPod, PSP, iPhone, PS3, Zune, Creative Zen Vision, etc.                </p>");
		p8.setDownUrl("MP4VideoConverter.exe");
		p8.setFileName("mp4-video-converter");
		p8.setImage("mp4-video-converter-box.jpg");
		p8.setName("Eahoosoft MP4 Video Converter");
		p8.setPrice(24.95);
		p8.setScreenShot("MP4-Video-Converter.jpg");
		p8.setShortDesc("A professional MP4 Video Converter which is designed to convert almost any video formats to MP4 video formats, such as AVI to MP4, WMV to MP4. ");
		p8.setSize("5.01Mb");
		p8.setShortName("MP4 Video Converter");
		p8.setOrderNum(5);
		p8.setIcon(null);
		p8.setVersion("V2.0.1");
		p8.setFeatures(getFeature8(p8));
		s.save(p8);
		
		Product p9 = new Product();
		p9.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=06");
		p9.setCate(c1);
		p9.setDescription("<p>Eahoosoft AVI Video Converter is one first-class AVI Converter to convert <strong>F4V to AVI, RMVB to AVI, ASF to AVI</strong> etc. and other popular video formats to AVI formats, which is high compatible with different types of Creative Zen, BlackBerry, Wii, PSP, PS3 and other devices. More specially, Eahoosoft AVI Converter supports different converting formats, including MPEG, MPEG-4, RM, WMV, ASF, TS, MKV, AVI, 3GP, MPV, MOD, TOD, FLV, etc to AVI. It goes without saying that it can convert convert M4A, MP3, AC3, AAC, WMA, WAV, OGG, AU, Nut, AIFF, FLAC, AMR, MIDI audio formats and take out the audio from video formats to AAC, AC3, MP3, M4A, MP2, WAV.                 </p>");
		p9.setDownUrl("AVIVideoConverter.exe");
		p9.setFileName("avi-video-converter");
		p9.setImage("avi-video-converter-box.jpg");
		p9.setName("Eahoosoft AVI Video Converter");
		p9.setPrice(29.95);
		p9.setScreenShot("AVI-Video-Converter.jpg");
		p9.setShortDesc("First-class AVI Converter to convert F4V to AVI, RMVB to AVI, ASF to AVI etc. and other popular video formats to AVI formats.");
		p9.setSize("5.01Mb");
		p9.setShortName("AVI Video Converter");
		p9.setOrderNum(6);
		p9.setIcon(null);
		p9.setVersion("V2.0.1");
		p9.setFeatures(getFeature9(p9));
		s.save(p9);
		
		Product p10 = new Product();
		p10.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=07");
		p10.setCate(c1);
		p10.setDescription("<p>Eahoosoft MOV Video Converter is a world-class QuickTime MOV Video Converter which can convert QuickTime MOV to MP4, AVI, WMV, 3GP, FLV, SWF, and all popular video formats,such as <strong>FLV to MOV, RMVB to MOV, MKV to MOV</strong> etc. This MOV Video Converter also assists you extract audio from MOV or convert MP3, MP2, AAC, M4A, AIFF to your MP3 players for your music enjoyment. You can enjoy your MOV video(.mov, .qt) on your PMPs easily with Eahoosoft MOV Video Converter.<br>Furthermore, Eahoosoft MOV Video Converter provides advanced functions such as trim video to get video clips and capture excellent pictures. So this powerful QuickTime MOV Video Converter doubles your enjoyment of watching your unique QuickTime videos. If you are searching for software to convert QuickTime MOV to other video files, Eahoosoft MOV Video Converter will be your best choice.                </p>");
		p10.setDownUrl("MOVVideoConverter.exe");
		p10.setFileName("mov-video-converter");
		p10.setImage("mov-video-converter-box.jpg");
		p10.setName("Eahoosoft MOV Video Converter");
		p10.setPrice(24.95);
		p10.setScreenShot("MOV-Video-Converter.jpg");
		p10.setShortDesc("World-class QuickTime MOV Video Converter which can convert QuickTime MOV to MP4, AVI, WMV, 3GP, FLV, SWF, and all popular video formats.");
		p10.setSize("5.01Mb");
		p10.setShortName("MOV Video Converter");
		p10.setOrderNum(7);
		p10.setIcon(null);
		p10.setVersion("V2.0.1");
		p10.setFeatures(getFeature10(p10));
		s.save(p10);
		
		Product p11 = new Product();
		p11.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=08");
		p11.setCate(c1);
		p11.setDescription("<p>Eahoosoft 3GP Video Converter provides an excellent solution for 3GP mobile phone users to convert video files including AVI, DivX, XviD, WMV(Window Media Player), MPEG, MPG, DAT(VCD), RM(RealPlayer), MOV(QuickTime), ASF, VOB(DVD) etc. such as <strong>FLV to 3GP, RM to 3GP, ASF to 3GP</strong>. to 3GP format, including 3GP, 3G2, MPEG4, AMR and so on, for playback on their mobile phones with super fast conversion speed and excellent output quality. Eahoosoft 3GP Video Converter can also convert 3GP to popular video file formats such as 3GP to AVI, MPEG, DivX, WMV, and so on. It can also rip audio from 3gp movie to MP3, WAV, RA, AAC, M4A or vice versa as you like.<br>                </p>");
		p11.setDownUrl("3GPVideoConverter.exe");
		p11.setFileName("3gp-video-converter");
		p11.setImage("3gp-video-converter-box.jpg");
		p11.setName("Eahoosoft 3GP Video Converter");
		p11.setPrice(24.95);
		p11.setScreenShot("3GP-Video-Converter.jpg");
		p11.setShortDesc("Provides an excellent solution for 3GP mobile phone users to convert video files including AVI, DivX, XviD, WMV, MPEG, MPG, RM, MOV, ASF, VOB etc.");
		p11.setSize("5.01Mb");
		p11.setShortName("3GP Video Converter");
		p11.setOrderNum(8);
		p11.setIcon(null);
		p11.setVersion("V2.0.1");
		p11.setFeatures(getFeature11(p11));
		s.save(p11);
		
		Product p12 = new Product();
		p12.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=09");
		p12.setCate(c1);
		p12.setDescription("<p>Eahoosoft HD Video Converter enriches your life to enjoy HD videos anywhere. It is a high definition video converter (HD converter) designed to convert HD video to many popular formats, like <strong>AVI to HD, MP4 to HD, FLV to HD</strong>, etc. Advanced in supporting HD video with 720p, 1080p resolution and above, this powerful HD video converter can ensure a smooth HD video conversion with excellent synchronization of audio and video, no image distortion or grains upon output.<br>For professionals and HD video fanatics, the program also facilitates diverse needs to trim HD video length, crop HD video to fit for 4:3 or 16:9 aspect ratio display, adjust video effects in a very handy way. You can also change conversion settings like video bit rate, frame rate, audio channel, etc. to get better outputs.                </p>");
		p12.setDownUrl("HDVideoConverter.exe");
		p12.setFileName("hd-video-converter");
		p12.setImage("hd-video-converter-box.jpg");
		p12.setName("Eahoosoft HD Video Converter");
		p12.setPrice(24.95);
		p12.setScreenShot("HD-Video-Converter.jpg");
		p12.setShortDesc("Enriches your life to enjoy HD videos anywhere. It is a high definition video converter (HD converter) designed to convert HD video to many popular formats.");
		p12.setSize("5.01Mb");
		p12.setShortName("HD Video Converter");
		p12.setOrderNum(9);
		p12.setIcon(null);
		p12.setVersion("V2.0.1");
		p12.setFeatures(getFeature12(p12));
		s.save(p12);
		
		Product p13 = new Product();
		p13.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=0");
		p13.setCate(c1);
		p13.setDescription("<p align=\"left\">FLV converter allows you to a have feel of how a professional flash video software is. Moreover, this FLV video converter can also convert various videos to FLV   and SWF flash videos like <strong>convert AVI to FLV, MPEG, WMV, DivX, MP4, MKV,   H.264, RM, RMVB, MOV, XviD, 3GP, ASF, VOB, M4V to FLV</strong>.</p><p>Split output file and customize file size according to your preferences.   Audio files with extensions like MP3, M4A, AC3, AAC, WMA and OGG are also   supported to convert into FLV file.</p>");
		p13.setDownUrl("VideotoFlash.exe");
		p13.setFileName("video-to-flash-converter");
		p13.setImage("video2flash-box.jpg");
		p13.setName("Eahoosoft Video to Flash Converter");
		p13.setPrice(24.95);
		p13.setScreenShot("flashconverter1.jpg");
		p13.setShortDesc("Allows you to a have feel of how a professional flash video software is. Moreover, it can also convert various videos to FLV and SWF flash videos like convert AVI to FLV, MPEG etc.");
		p13.setSize("7.55Mb");
		p13.setShortName("Video to Flash Converter");
		p13.setOrderNum(10);
		p13.setIcon(null);
		p13.setVersion("V2.1.1");
		p13.setFeatures(getFeature13(p13));
		s.save(p13);
		
		
		Product p14 = new Product();
		p14.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-6");
		p14.setCate(c1);
		p14.setDescription("<p align=\"left\">A PSP video converter is an all in one device that allows you to convert PS3/PSP, PSP-MP4, and PSP-movie in all formats which includes ASF, AVI, RM, MPEG, GIF, WMV, VOB, MP4, 3GP, DivX, FLV, MOV, MKV,  AVCHD to H.264/AVC or PSP MP4 setting in various resolutions which includes  <strong>1080p, 720p, 480p and convert sound settings</strong> like CDA, APE, WMA, CUE, WAV, OGG, AC3, M4A to PSP MP3 setting. such as AVI to PSP, RMVB to PSP etc<br>                  On top of that PSP converter lets you convert your photos into videos,  convert several files at once; divide files and enjoy several more powerful  features.</p>");
		p14.setDownUrl("Videotopsp.exe");
		p14.setFileName("psp-video-converter");
		p14.setImage("psp-video-converter-box.jpg");
		p14.setName("Eahoosoft PSP Video Converter");
		p14.setPrice(24.95);
		p14.setScreenShot("pspconverter1.jpg");
		p14.setShortDesc("An all in one device that allows you to convert PS3/PSP, PSP-MP4, and PSP-movie in all formats which includes ASF, AVI, RM, MPEG, GIF, WMV, VOB, MP4, 3GP, DivX, FLV, MOV, MKV, AVCHD etc");
		p14.setSize("8.31Mb");
		p14.setShortName("PSP Video Converter");
		p14.setOrderNum(11);
		p14.setIcon(null);
		p14.setVersion("V2.1.1");
		p14.setFeatures(getFeature14(p14));
		s.save(p14);
		
		
		Product p15 = new Product();
		p15.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-8");
		p15.setCate(c1);
		p15.setDescription("<p>Eahoosoft Nokia Video Converter provides perfect solution to convert your favorite video files to Nokia mobile phone format with the best quality of picture and sound. This Nokia Video Converter software could support almost all source formats, including WMV, MPEG, MPG, ASF, MOD, FLV, SWF, RM and HD files, etc. such as <strong>flv to nokia, avi to nokia</strong>. In addition, Eahoosoft Nokia Video Converter also has many   advanced function and rich settings for video output. So this powerful Nokia   Video Converter doubles your enjoyment of watching videos on Nokia phone. This   Video to Nokia Converter Software is so easy-to-use that whether you are an   experienced user or a beginner, converting all popular video formats to Nokia   video is just in a breeze. <br>                   </p></p>");
		p15.setDownUrl("VideotoNokia.exe");
		p15.setFileName("nokia-video-converter");
		p15.setImage("nokia-converter-box.jpg");
		p15.setName("Eahoosoft Nokia Video Converter");
		p15.setPrice(24.95);
		p15.setScreenShot("nokiaconverter1.jpg");
		p15.setShortDesc("Provides perfect solution to convert your favorite video files to Nokia mobile phone format with the best quality of picture and sound. ");
		p15.setSize("8.37Mb");
		p15.setShortName("Nokia Video Converter");
		p15.setOrderNum(12);
		p15.setIcon(null);
		p15.setVersion("V2.1.0");
		p15.setFeatures(getFeature15(p15));
		s.save(p15);
		
		
		Product p16 = new Product();
		p16.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-27");
		p16.setCate(c1);
		p16.setDescription("<p>Eahoosoft DVD to 3GP Converter is designed for Nokia, Motorola, Sony Ericsson and other mobile phones.<br>Eahoosoft DVD to 3GP Converter provides an excellent solution for 3GP mobile phone users to convert DVD to 3GP format, including 3GP, 3G2, MPEG4, AMR and so on, for playback on their mobile phones with super fast conversion speed and excellent output quality. <br>Eahoosoft DVD to 3GP Converter provides various powerful editing options such as DVD movie trimming, effect settings, video and audio encoder settings, batch conversion and so on. Extremely fast conversion speed and friendly user interface let you convert video files between many formats with ease.<br>Free download Eahoosoft DVD to 3GP Converter now and turn your favorite DVD to 3GP movies and 3GP music videos for your mobile phone!<br>                </p>");
		p16.setDownUrl("DVDto3GP.exe");
		p16.setFileName("dvd-to-3gp-converter");
		p16.setImage("dvd-to-3gp-box.jpg");
		p16.setName("Eahoosoft DVD to 3GP Converter");
		p16.setPrice(24.95);
		p16.setScreenShot("DVDto3GP.jpg");
		p16.setShortDesc("Eahoosoft DVD to 3GP Converter is designed for Nokia, Motorola, Sony Ericsson and other mobile phones.");
		p16.setSize("8.37Mb");
		p16.setShortName("DVD to 3GP Converter");
		p16.setOrderNum(13);
		p16.setIcon(null);
		p16.setVersion("V2.1.0");
		p16.setFeatures(getFeature16(p16));
		s.save(p16);
		
		Product p17 = new Product();
		p17.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-24");
		p17.setCate(c1);
		p17.setDescription("<p>Eahoosoft DVD to AVI Converter is a professional DVD to AVI Converter with super fast conversion speed and excellent quality. It can convert DVD to AVI, H.264 AVI, DivX, XviD, MPEG-1, MPEG-2, and convert DVD to HD AVI, DivX HD, XviD HD efficiently. These converted files can be played on your popular players including Xbox, Xbox 360, Archos, Creative Zen, iRiver, BlackBerry, PSP, PS3, Wii.<br>Eahoosoft DVD to AVI Converter fully support you to customize your settings - video and audio bitrate, resolution, frame rate, Sample Rate, etc. You can select target subtitle and audio track in the light of your need.<br>Eahoosoft DVD to AVI Converter has powerful function of trimming, cropping, merging and effecting. In the process of converting, you can easily adjust and see the effects of video brightness, contrast and saturation at the same time.<br>                </p>");
		p17.setDownUrl("DVDtoAVI.exe");
		p17.setFileName("dvd-to-avi-converter");
		p17.setImage("dvd-to-avi-box.jpg");
		p17.setName("Eahoosoft DVD to AVI Converter");
		p17.setPrice(24.95);
		p17.setScreenShot("DVDtoAVI.jpg");
		p17.setShortDesc("A professional DVD to AVI Converter with super fast conversion speed and excellent quality. It can convert DVD to AVI, H.264 AVI, DivX, XviD, MPEG-1, MPEG-2, and convert DVD to HD AVI, DivX HD, XviD HD efficiently. ");
		p17.setSize("8.37Mb");
		p17.setShortName("DVD to AVI Converter");
		p17.setOrderNum(14);
		p17.setIcon(null);
		p17.setVersion("V2.1.0");
		p17.setFeatures(getFeature17(p17));
		s.save(p17);
		
		Product p18 = new Product();
		p18.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-31");
		p18.setCate(c1);
		p18.setDescription("<p>Eahoosoft DVD to FLV Converter is a professional DVD to FLV converter with super fast conversion speed and excellent quality. It can convert DVD to FLV, SWF for Youtube, Myspace and Google video,etc.<br>Eahoosoft DVD to FLV Converter also allows you to select target subtitle and audio track. The converted small sized Flash Video can be easily shared with your friends and family by E-mail, FTP upload, or just regular storage devices.<br>Eahoosoft DVD to FLV Converter has powerful function of trimming, cropping, merging, and effecting. In the process of converting, you can easily adjust and see the effects of video brightness, contrast and saturation at the same time. Only a few clicks to convert your DVD to FLV and enjoy it on the web with others for your ideal life.<br>                </p>");
		p18.setDownUrl("DVDtoFlash.exe");
		p18.setFileName("dvd-to-flash-converter");
		p18.setImage("dvd-to-flash-box.jpg");
		p18.setName("Eahoosoft DVD to Flash Converter");
		p18.setPrice(24.95);
		p18.setScreenShot("DVDtoFlash.jpg");
		p18.setShortDesc("A professional DVD to FLV converter with super fast conversion speed and excellent quality. It can convert DVD to FLV, SWF for Youtube, Myspace and Google video,etc.");
		p18.setSize("8.37Mb");
		p18.setShortName("DVD to Flash Converter");
		p18.setOrderNum(15);
		p18.setIcon(null);
		p18.setVersion("V2.1.0");
		p18.setFeatures(getFeature18(p18));
		s.save(p18);
		
		Product p19 = new Product();
		p19.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-29");
		p19.setCate(c1);
		p19.setDescription("<p>Eahoosoft DVD to HD Converter can convert DVD to various HD formats with no limitation. High-Definition video<br>Besides supporting versatile HD formats, Eahoosoft DVD to HD Converter also allows you editing function and customize advanced parameters is supported as well. Capture pictures and preview are also allowed with ideal DVD to HD Converter. To hold DVD to HD Converter at hand let you enjoy colorful videos at iPod, iPhone, Xbox,Blackberry and almost all portable devices at anytime and anyplace. In addition, both novice and beginners can convert DVD to HD with friendly-use interface provided by DVD to HD Converter. Why not try Eahoosoft DVD to HD Converter right now? Free download supported!<br>               </p>");
		p19.setDownUrl("DVDtoHD.exe");
		p19.setFileName("dvd-to-hd-converter");
		p19.setImage("dvd-to-hd-box.jpg");
		p19.setName("Eahoosoft DVD to HD Video Converter");
		p19.setPrice(24.95);
		p19.setScreenShot("DVDtoHD.jpg");
		p19.setShortDesc("Eahoosoft DVD to HD Converter can convert DVD to various HD formats with no limitation.");
		p19.setSize("8.37Mb");
		p19.setShortName("DVD to HD Video Converter");
		p19.setOrderNum(16);
		p19.setIcon(null);
		p19.setVersion("V2.1.0");
		p19.setFeatures(getFeature19(p19));
		s.save(p19);
		
		Product p20 = new Product();
		p20.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-30");
		p20.setCate(c1);
		p20.setDescription("<p>Eahoosoft DVD to Mobile Phone Converter is professional DVD to Mobile Phone Converter software, which helps you rip and convert DVD to Mobile Phone 3GP, MP4, AVI, 3G2 and other video and audio formats. The output videos/audios can be played on most popular Mobile Phones including Nokia, Samsung, Motorola, LG, Sony Ericsson, Palm, etc.<br>Compared with other DVD to Mobile Phone ripping software, Eahoosoft DVD to Mobile Phone Converter possesses more powerful editing functions. When converting DVD to Mobile Phone, you can adjust output video effect, trim any part of DVD, crop the video play region and specify the output settings, select target subtitle and audio track and so on.<br>                </p>");
		p20.setDownUrl("MobilePhone.exe");
		p20.setFileName("dvd-to-mobile-converter");
		p20.setImage("dvd-to-mobile-box.jpg");
		p20.setName("Eahoosoft DVD to Mobile Phone Converter");
		p20.setPrice(24.95);
		p20.setScreenShot("DVDtoMobilePhone.jpg");
		p20.setShortDesc("A professional DVD to Mobile Phone Converter software, which helps you rip and convert DVD to Mobile Phone 3GP, MP4, AVI, 3G2 and other video and audio formats.");
		p20.setSize("8.37Mb");
		p20.setShortName("DVD to Mobile Phone Converter");
		p20.setOrderNum(17);
		p20.setIcon(null);
		p20.setVersion("V2.1.0");
		p20.setFeatures(getFeature20(p20));
		s.save(p20);
		
		Product p21 = new Product();
		p21.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-27");
		p21.setCate(c1);
		p21.setDescription("<p>Eahoosoft DVD to MOV Converter is an easy-to-use DVD MOV Converter to convert DVD files to MOV . With all popular codec built in, it can convert DVD movies to all popular video/audio formats like MOV, MP4, 3GP, MPEG, WMV, MPG, FLV, MP3, M4A, WMA, WAV etc. with super fast speed and high quality. Eahoosoft DVD to MOV Converter also presets many parameters for your portable player. You can easily convert DVD to your iPod, PSP, Zune etc. With Eahoosoft DVD to MOV Converter you can enjoy your DVD movies on your PCs and portable devices any time and any where without DVD discs.Free to try and when you buy it you can always get free technical support and upgrade.<br>                </p>");
		p21.setDownUrl("DVDtoMOV.exe");
		p21.setFileName("dvd-to-mov-converter");
		p21.setImage("dvd-to-mov-box.jpg");
		p21.setName("Eahoosoft DVD to MOV Converter");
		p21.setPrice(24.95);
		p21.setScreenShot("DVDtoMOV.jpg");
		p21.setShortDesc("An easy-to-use DVD MOV Converter to convert DVD files to MOV . With all popular codec built in, it can convert DVD movies to all popular video/audio formats.");
		p21.setSize("8.37Mb");
		p21.setShortName("DVD to MOV Converter");
		p21.setOrderNum(18);
		p21.setIcon(null);
		p21.setVersion("V2.1.0");
		p21.setFeatures(getFeature21(p21));
		s.save(p21);
		
		Product p22 = new Product();
		p22.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-25");
		p22.setCate(c1);
		p22.setDescription("<p>Eahoosoft DVD to MP4 Converter is the best DVD to MP4 Converter, which can help you convert DVD to MP4, H.264/MPEG-4 AVC (.mp4), MOV, AVI, and convert DVD to HD MP4, HD MOV, HD AVI, DVD to audio like M4A, MP3, AAC, etc for all MP4 players such as iPod, iPod touch, iPod nano, iPhone, iPhone 3G, iPhone 3GS, PSP, Creative Zen, Zune, Zune 2, iRiver PMP, Archos, PS3, Xbox, and more.<br>Compared with other DVD to MP4 converters, Eahoosoft DVD to MP4 Converter provides more settings for you to customize - video and audio bitrate, resolution, frame rate, Sample Rate, etc, in addition to the default profiles. It also has powerful editing function for you to trim, crop, and effect your output file.<br><br>                </p>");
		p22.setDownUrl("DVDtoMP4.exe");
		p22.setFileName("dvd-to-mp4-converter");
		p22.setImage("dvd-to-mp4-box.jpg");
		p22.setName("Eahoosoft DVD to MP4 Converter");
		p22.setPrice(24.95);
		p22.setScreenShot("DVDtoMP4.jpg");
		p22.setShortDesc("The best DVD to MP4 Converter, which can help you convert DVD to MP4, H.264/MPEG-4 AVC (.mp4), MOV, AVI and more.");
		p22.setSize("8.37Mb");
		p22.setShortName("DVD to MP4 Converter");
		p22.setOrderNum(19);
		p22.setIcon(null);
		p22.setVersion("V2.1.0");
		p22.setFeatures(getFeature22(p22));
		s.save(p22);
		
		Product p23 = new Product();
		p23.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-23");
		p23.setCate(c1);
		p23.setDescription("<p>Eahoosoft DVD to PSP Converter is the professional DVD to PSP Converter program, which helps you to convert DVD to PSP MP4, convert DVD to PS3 MP4, even DVD to PSP H.264 (.psp), PS3 AVI and extract audio track from DVD to MP3, AAC PSP audio formats. It supports many other portable devices as well.<br>Compared with other DVD to PSP converters, Eahoosoft DVD to PSP Converter has more settings you can customize. For example, this perfect DVD converter to PSP format allows you to convert DVD to PSP by customizing file size, ripping DVD's any segment, selecting target subtitle and audio track, etc.<br>                </p>");
		p23.setDownUrl("DVDtoPSP.exe");
		p23.setFileName("dvd-to-psp-converter");
		p23.setImage("dvd-to-psp-box.jpg");
		p23.setName("Eahoosoft DVD to PSP Converter");
		p23.setPrice(24.95);
		p23.setScreenShot("DVDtoPSP.jpg");
		p23.setShortDesc("The professional DVD to PSP Converter program, which helps you to convert DVD to PSP MP4, convert DVD to PS3 MP4, even DVD to PSP H.264 (.psp), PS3 AVI and extract audio track from DVD to MP3, AAC PSP audio formats.");
		p23.setSize("8.37Mb");
		p23.setShortName("DVD to PSP Converter");
		p23.setOrderNum(20);
		p23.setIcon(null);
		p23.setVersion("V2.1.0");
		p23.setFeatures(getFeature23(p23));
		s.save(p23);
		
		Product p24 = new Product();
		p24.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-26");
		p24.setCate(c1);
		p24.setDescription("<p>Eahoosoft DVD to WMV Converter is a professional DVD to WMV Converter, which can convert DVD to WMV, WMA, MP3 with the greatest quality and the highest speed. This excellent converter supports most of the WMV players such as Google Phone, BlackBerry Storm, BlackBerry Bold, Palm Pre, Zune, Zune 2, PSP, PS3, Xbox 360, Dell Player, HP iPAQ...<br>Eahoosoft DVD to WMV Converter provides you the chance to customize the settings to meet your need, including video and audio bitrate, resolution, frame rate, Sample Rate, etc. You can also select target subtitle and audio track.<br>Eahoosoft DVD to WMV Converter has powerful function of trimming, cropping, merging and effecting. In the process of converting, you can easily adjust and see the effects of video brightness, contrast and saturation at the same time.<br>                </p>");
		p24.setDownUrl("DVDtoWMV.exe");
		p24.setFileName("dvd-to-wmv-converter");
		p24.setImage("dvd-to-wmv-box.jpg");
		p24.setName("Eahoosoft DVD to WMV Converter");
		p24.setPrice(24.95);
		p24.setScreenShot("DVDtoWMV.jpg");
		p24.setShortDesc("A professional DVD to WMV Converter, which can convert DVD to WMV, WMA, MP3 with the greatest quality and the highest speed.");
		p24.setSize("8.37Mb");
		p24.setShortName("DVD to WMV Converter");
		p24.setOrderNum(21);
		p24.setIcon(null);
		p24.setVersion("V2.1.0");
		p24.setFeatures(getFeature24(p24));
		s.save(p24);
		
		Product p25 = new Product();
		p25.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-32");
		p25.setCate(c1);
		p25.setDescription("<p>Eahoosoft DVD to Zune Converter is the most professional DVD to Zune Converter software which can convert DVD to Zune WMV, MP4, H.264/MPEG-4 AVC(.mp4). So you can play your favorite DVD on Microsoft Zune. Moreover, as expected, this DVD to Zune Converter can rip DVD to Zune MP3, WMA, M4A, AAC.<br>Plus, Eahoosoft DVD to Zune Converter combines more functions into this DVD to Zune software, such as crop you DVD video play region to suit your Zune, trim the video length to meet your needs, merge several files into file, even edit your video, and select audio track and subtitle, take snapshot when preview. Free download this DVD to Zune software, and enjoy your DVD video on Zune wherever you are.<br>                </p>");
		p25.setDownUrl("DVDtoZune.exe");
		p25.setFileName("dvd-to-zune-converter");
		p25.setImage("dvd-to-zune-box.jpg");
		p25.setName("Eahoosoft DVD to Zune Converter");
		p25.setPrice(24.95);
		p25.setScreenShot("DVDtoZune.jpg");
		p25.setShortDesc("The most professional DVD to Zune Converter software which can convert DVD to Zune WMV, MP4, H.264/MPEG-4 AVC(.mp4). ");
		p25.setSize("8.37Mb");
		p25.setShortName("DVD to Zune Converter");
		p25.setOrderNum(22);
		p25.setIcon(null);
		p25.setVersion("V2.1.0");
		p25.setFeatures(getFeature25(p25));
		s.save(p25);
		
		Product p26 = new Product();
		p26.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-12&q=1&v=0&d=0");
		p26.setCate(c3);
		p26.setDescription("<p>Eahoosoft Audio Converter for Mac is a  powerful all-in-one professional audio converter for audio conversion, audio  extraction, audio CD ripping on MAC OS X . Using Eahoosoft Audio Converter for  Mac, you can <strong>convert between different audio formats including MP3, WMA, WAV,  AAC, FLAC, OGG, APE</strong>, extract audio from popular video formats including  high-definition (HD) videos such as AVI, MPEG, WMV, VOB, RMVB, XviD,MP4, FLV,  MKV, H.264/MPEG-4 AVC</p>"+
"<p><strong>Platform</strong>: Mac OS X&nbsp;&nbsp;<a href=\"../eahoosoft-audio-converter/eahoosoft-audio-converter.html\">Go to Windows Version &gt;&gt;</a>				</p>");
		p26.setDownUrl("audio-converter-mac.dmg");
		p26.setFileName("audio-converter-mac");
		p26.setImage("audio-converter-box.jpg");
		p26.setName("Eahoosoft Audio Converter for Mac");
		p26.setPrice(24.95);
		p26.setScreenShot("audio-converter-mac.jpg");
		p26.setShortDesc("A powerful all-in-one professional audio converter for audio conversion, audio extraction, audio CD ripping on MAC OS X .");
		p26.setSize("8.06Mb");
		p26.setShortName("Audio Converter for Mac");
		p26.setOrderNum(2);
		p26.setIcon("new");
		p26.setVersion("V2.0.1");
		p26.setFeatures(getFeature26(p26));
		s.save(p26);
		
		
		Product p27 = new Product();
		p27.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=03");
		p27.setCate(c4);
		p27.setDescription("<p align=\"left\">Here comes the amazing WMA MP3 converter for your MP3 player now! Eahoosoft WMA MP3 Converter converts almost all popular audio formats (WMA, WAV, AAC, FLAC, OGG, APE, etc.) to WMA MP3 audio files, as well as extracts WMA MP3 music from just about any video formats including high-definition (HD) video formats (AVI, MPEG, MP4, WMV, H.264/MPEG-4 AVC, AVCHD, etc.).<br>The support for batch conversion, multithreading and multi-core CPU processing assure you of high WMA MP3 conversion speed. This WMA MP3 converter also gives you the options of customizing the output WMA MP3 audio files, converting a single file into multiple format files simultaneously, adding and editing audio effects and tweaking different output parameters for personalization. Have a free trial of Eahoosoft WMA MP3 Converter now to get your loved songs and music videos played on any MP3 player! </p>");
		p27.setDownUrl("WMAMP3Converter.exe");
		p27.setFileName("wma-mp3-converter");
		p27.setImage("wma-mp3-box.jpg");
		p27.setName("Eahoosoft WMA MP3 Converter");
		p27.setPrice(19.95);
		p27.setScreenShot("wma-mp3-shot.jpg");
		p27.setShortDesc("Converts almost all popular audio formats (WMA, WAV, AAC, FLAC, OGG, APE, etc.) to WMA MP3 audio files, as well as extracts WMA MP3 music from just about any video formats. ");
		p27.setSize("8.06Mb");
		p27.setShortName("WMA MP3 Converter");
		p27.setOrderNum(2);
		p27.setVersion("V2.1.0");
		p27.setFeatures(getFeature27(p27));
		s.save(p27);
		
		Product p28 = new Product();
		p28.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-33");
		p28.setCate(c4);
		p28.setDescription("<p>Eahoosoft Video to Audio Converter is a easy and flexible tool used to extract audio from AVI, MPEG, VOB, WMV/ASF, DAT, RM/RMVB, MOV format medium files to MP3, WAV, WMA and OGG format. It can batch extract audio from video files such as AVI, MPEG, WMV/ASF, RM/RMVB, files to MP3,WMA,OGG and WAV files, So you can listen them with your mp3 player or extract audio from video files to CD quality WAV files for burning your own audio CD. You can setup output audio bitrate, frequency, and channels. Support VBR of MP3 and OGG.It has user-firenldy and easy-to-use interface. Converting in high precision and no quality is lost.                </p>");
		p28.setDownUrl("VideotoAudioConverter.exe");
		p28.setFileName("video-to-audio-converter");
		p28.setImage("video-to-audio-converter-box.jpg");
		p28.setName("Eahoosoft Video to Audio Converter");
		p28.setPrice(24.95);
		p28.setScreenShot("VideotoAudio.jpg");
		p28.setShortDesc("A easy and flexible tool used to extract audio from AVI, MPEG, VOB, WMV/ASF, DAT, RM/RMVB, MOV format medium files to MP3, WAV, WMA and OGG format.");
		p28.setSize("5.06Mb");
		p28.setShortName("Video to Audio Converter");
		p28.setOrderNum(3);
		p28.setVersion("V2.1.0");
		p28.setFeatures(getFeature28(p28));
		s.save(p28);
		
		Product p29 = new Product();
		p29.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-7&q=1&v=0&d=00");
		p29.setCate(c2);
		p29.setDescription("<p align=\"left\">Eahoosoft DVD to iPad Converter is specifically designed for Apple iPad users to watch DVD movies on your iPad's Multi-Touch screen. With this DVD to iPad converter, you can rip DVD to <b>iPad H.264 (SD and HD), MP4, MOV,and MPEG-4 videos in different resolutions (1280*720, 960*540,720*480, 640*480)</b>. All conversions are optimized to offer you the best possible DVD movie experience on your iPad.<br>Apart from converting DVD to iPad videos, Eahoosoft DVD to iPad Converter allows you to rip DVD audio to iPad MP3, WMA audios; customize conversion parameters, split files, convert a video segment, preview movies, select audio and subtitles, capture video images, and specify the output file size.<br>Download Eahoosoft DVD to iPad Converter for FREE now and experience DVD movies in high-resolution on your iPad.<br>1.Rip and convert DVD to iPad video formats (MPEG-4, MP4, H.264,MOV) <br>2.Rip and convert DVD to iPad audio formats (MP3, WMA) </p>");
		p29.setDownUrl("DVDtoiPad.exe");
		p29.setFileName("dvd-to-iPad-converter");
		p29.setImage("dvd-to-ipad-box.jpg");
		p29.setName("Eahoosoft DVD to iPad Converter");
		p29.setPrice(24.95);
		p29.setScreenShot("dvd-ipad.jpg");
		p29.setShortDesc("Specifically designed for Apple iPad users to watch DVD movies on your iPad's Multi-Touch screen in different resolutions (1280*720, 960*540,720*480, 640*480).");
		p29.setSize("7.07Mb");
		p29.setShortName("DVD to iPad Converter");
		p29.setOrderNum(2);
		p29.setIndexOrderNum(4);
		p29.setVersion("V2.0.1");
		p29.setFeatures(getFeature29(p29));
		s.save(p29);
		
		Product p30 = new Product();
		p30.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-4&q=1&v=0&d=0");
		p30.setCate(c2);
		p30.setDescription("<p>iPad Video Converter is especially made for iPad customers who wish to watch almost every file saved on various formats on their iPad. It converts all types of video setting such as 3GP, AVI, ASF, MPEG, RMVB, DivX, MOV, WMV, RM, and MP4 and Audio setting such as CDA, MP2, APE, OGG, AC3, RA, and WMA to iPad video such as <strong>FLV to iPad, MPG to iPad</strong>. It also allows you to convert HD videos, like, H3264/MPEG-4AVC, AVCHID to iPad 720p H.264 video. So watching high definition films can now be done wherever and whenever!<br/></p>");
		p30.setDownUrl("Videotoipad.exe");
		p30.setFileName("ipad-video-converter");
		p30.setImage("ipad-video-converter-box.jpg");
		p30.setName("Eahoosoft iPad Video Converter");
		p30.setPrice(24.95);
		p30.setScreenShot("ipadconverter.jpg");
		p30.setShortDesc("Especially made for iPad customers who wish to watch almost every file saved on various formats on their iPad. ");
		p30.setSize("8.11Mb");
		p30.setShortName("iPad Video Converter");
		p30.setOrderNum(3);
		p30.setIndexOrderNum(5);
		p30.setVersion("V2.1.1");
		p30.setFeatures(getFeature30(p30));
		s.save(p30);
		
		Product p31 = new Product();
		p31.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-21");
		p31.setCate(c2);
		p31.setDescription("<p align=\"left\">Eahoosoft DVD to iPhone Suite has the function of Eahoosoft DVD to iPhone Converter and Eahoosoft iPhone Video Converter, so with Eahoosoft DVD to iPhone Suite you can convert both DVD movie and video files to MP4, MOV, H.264, MP3, M4A formats.<br>Eahoosoft DVD to iPhone Suite is also a professional audio converter that can convert audio files including MP3, MP2, AAC, AC3, WAV, MID, MIDI, WMA, M4A, RA, RAM to iPhone/iPhone 3G/iPhone 3GS/ iPhone 4/iPod Touch/iPod Classic/iPod Nano MP3, M4A, AAC audio formats.<br>Compared with other conversion software, Eahoosoft DVD to iPhone Suite has multifunctional editing system. You can use it to join movie, cut movie and crop movie. You can also customize the settings including video and audio bitrate, resolution, frame rate, etc. The audio track and subtitle settings are also available for you. It is totally costumer-oriented. </p>");
		p31.setDownUrl("iPhoneConverterSuite.exe");
		p31.setFileName("iphone-converter-suite");
		p31.setImage("iphoneconvertersuite-box.jpg");
		p31.setName("Eahoosoft iPhone Converter Suite");
		p31.setPrice(24.95);
		p31.setScreenShot("iphone-converter-suite-bk.jpg");
		p31.setShortDesc("Has the function of Eahoosoft DVD to iPhone Converter and Eahoosoft iPhone Video Converter, so you can convert both DVD movie and video files to MP4, MOV, H.264, MP3, M4A formats.");
		p31.setSize("12.7Mb");
		p31.setShortName("iPhone Converter Suite");
		p31.setOrderNum(4);
		p31.setIndexOrderNum(null);
		p31.setVersion("V2.0.1");
		p31.setFeatures(getFeature31(p31));
		s.save(p31);
		
		Product p32 = new Product();
		p32.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=01");
		p32.setCate(c2);
		p32.setDescription("<p align=\"left\">Eahoosoft DVD to iPhone Converter is the Best DVD to iPhone Converter program. It can convert DVD to iPhone MP4, MOV, H.264 etc video and MP3, WMA, etc audio formats easily and fast, also owns the way to convert DVD to iPhone 3G, iPhone 3GS, iPhone 4. <br>Compared with other DVD to iPhone Converter programs on the market, Eahoosoft DVD to iPhone Converter has the highest conversion speed (&gt;400%) and the best image quality. With this best DVD to iPhone Converter, you can also easily customize the output file to cater for your personal need, such as setting video/audio bitrate, ripping any segment of a DVD, trimming video, cropping movie, setting video effect, selecting target subtitle and audio track, previewing both the original and output video, etc. </p>");
		p32.setDownUrl("DVDtoiphone.exe");
		p32.setFileName("dvd-to-iPhone-converter");
		p32.setImage("dvd-to-iphone-box.jpg");
		p32.setName("Eahoosoft DVD to iPhone Converter");
		p32.setPrice(24.95);
		p32.setScreenShot("dvd-iphone.jpg");
		p32.setShortDesc("The Best DVD to iPhone Converter program. It can convert DVD to iPhone MP4, MOV, H.264 etc video and MP3, WMA, etc audio formats easily and fast.");
		p32.setSize("8.20Mb");
		p32.setShortName("DVD to iPhone Converter");
		p32.setOrderNum(5);
		p32.setIndexOrderNum(null);
		p32.setVersion("V2.0.1");
		p32.setFeatures(getFeature32(p32));
		s.save(p32);
		
		Product p33 = new Product();
		p33.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-5&q=1&v=0&d=0");
		p33.setCate(c2);
		p33.setDescription("<p align=\"left\">An iPhone video converter is the number one video converter tool that allows you to turn all video files such as WMV, AVI, RM, MKV, VOB, DivX, H.264, VOB, AVCHD, RMVB, MPEG, and MP4 into iPhone movies excellently. An iPhone video converter for 4, 3GS, and 3G aids you in turning videos for iPhone such as <strong>AVI to iPhone, FLV to iPhone</strong> and post movies on your iPhone without a fuss                                                An iPhone       video converter is specifically innovated for iPhone enthusiasts which can       turn video files like <strong>3GP, ASF, RMVB, RM, MOV, MP4, DivX,&nbsp; WMV,       MPEG, and AVI </strong>to iPhones MP4/MPEG-4 and iPhone movies and can even be       used to convert the newest video settings like AVCHD, H.264, and MKV<br>                    AN iPhone       video converter supports wide screen TVS, and 480p TV outputs<br>                    It allows       conversion of MP3, AAC, and Wav for trendy audio files like <strong>CDA, APE,       OGG, AC3, RA, WMA, MP2, and MP3, </strong>not to mention, it also allows you tp       extract sound files from music videos and movies to turn into iPhone music       AAC, MP3, and WAV.<br>           </p>");
		p33.setDownUrl("Video2iPhone.exe");
		p33.setFileName("iphone-video-converter");
		p33.setImage("iphone-video-converter-box.jpg");
		p33.setName("Eahoosoft iPhone Video Converter");
		p33.setPrice(24.95);
		p33.setScreenShot("iphoneconverter.jpg");
		p33.setShortDesc("The number one video converter tool that allows you to turn all video files such as WMV, AVI, RM, MKV, VOB, DivX, H.264, VOB, AVCHD, RMVB, MPEG, and MP4 into iPhone movies excellently. ");
		p33.setSize("8.30Mb");
		p33.setShortName("iPhone Video Converter");
		p33.setOrderNum(6);
		p33.setIndexOrderNum(null);
		p33.setVersion("V2.1.1");
		p33.setFeatures(getFeature33(p33));
		s.save(p33);
		
		Product p34 = new Product();
		p34.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-3&q=1&v=0&d=02");
		p34.setCate(c2);
		p34.setDescription("<p align=\"left\">Eahoosoft DVD to iPod Converter is the most professional DVD to iPod converter software to DVD to iPod Touch, DVD to iPod Nano, DVD to iPod Classic. You can easily convert almost all kinds of DVDs to iPod MP4 video, MP4 AVC video, MOV, M4V and iPod MP3 etc audio with the latest MPEG-4 video encoding technology. You will enjoy your favorite DVDs on your iPhone/iPhone 3GS/iPhone 4/ iPod Nano/iPod Classic and Apple TV without any difficulties.As the best customer-oriented DVD to iPod Converter software, Eahoosoft DVD to iPod Converter provides rich options such as DVD movie trimming, DVD movie cropping, DVD video effect, subtitle and audio track selection, snapshot favorite picture and so forth. It is easy-to-use and a few clicks are enough to finish your conversion job. Free Download Eahoosoft DVD to iPod Converter and have a try! Enjoy your favorite DVD movies on your iPod anytime and anywhere. </p>");
		p34.setDownUrl("DVDtoipod.exe");
		p34.setFileName("dvd-to-iPod-converter");
		p34.setImage("dvd-to-ipod-box.jpg");
		p34.setName("Eahoosoft DVD to iPod Converter");
		p34.setPrice(24.95);
		p34.setScreenShot("dvd-ipod.jpg");
		p34.setShortDesc("The most professional DVD to iPod converter software to DVD to iPod Touch, DVD to iPod Nano, DVD to iPod Classic. ");
		p34.setSize("7.10Mb");
		p34.setShortName("DVD to iPod Converter");
		p34.setOrderNum(7);
		p34.setIndexOrderNum(null);
		p34.setVersion("V2.0.1");
		p34.setFeatures(getFeature34(p34));
		s.save(p34);
		
		Product p35 = new Product();
		p35.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-5");
		p35.setCate(c2);
		p35.setDescription("<p align=\"left\">With the launch of iPod video converter you can now watch a movie or video in any setting on your iPod. With a state of the art movie iPod converter you can turn in almost any HD and SD video formats including HD WMV, AVI, HD MOV, WMV, HD MPEG4, DivX, AVCHD, MP4, HD AVI, H.264/AVC, H.264/MPEG-4 AVC, MKV, AVCHD, RM, VOB, ASF, MOV, VOB, and 3GP into iPod or and MP4 video formats and iPhone MPEG-4. Such as <strong>Convert AVI to iPod, FlV to iPod etc.</strong>                  With an iPod movie converter you can bring your complete photos and music  and collection with you anywhere you go. Convert CUE, MP3, APE, WMA, AAC, WAV,  and M4A to iPod audio settings, and change different photo set up into iPod  videos.</p>");
		p35.setDownUrl("Videotoipod.exe");
		p35.setFileName("ipod-video-converter");
		p35.setImage("ipod-video-converter-box.jpg");
		p35.setName("Eahoosoft ipod Video Converter");
		p35.setPrice(24.95);
		p35.setScreenShot("ipodconverter.jpg");
		p35.setShortDesc("With the launch of iPod video converter you can now watch a movie or video in any setting on your iPod. ");
		p35.setSize("8.30Mb");
		p35.setShortName("ipod Video Converter");
		p35.setOrderNum(8);
		p35.setIndexOrderNum(null);
		p35.setVersion("V2.1.1");
		p35.setFeatures(getFeature35(p35));
		s.save(p35);
		
		
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
		
		Product p37 = new Product();
		p37.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-13&q=1&v=0&d=0");
		p37.setCate(c3);
		p37.setDescription("<p>iPad Video Converter for Mac is especially made for iPad customers who wish to watch almost every file saved on various formats on their iPad. It converts all types of video setting such as 3GP, AVI, ASF, MPEG, RMVB, DivX, MOV, WMV, RM, and MP4 and Audio setting such as CDA, MP2, APE, OGG, AC3, RA, and WMA to iPad video such as FLV to iPad, MPG to iPad. It also allows you to convert HD videos, like, H3264/MPEG-4AVC, AVCHID to iPad 720p H.264 video. So watching high definition films can now be done wherever and whenever!<br>               <strong>Platform</strong>: Mac OS X&nbsp;&nbsp;<a href=\"../ipad-video-converter/ipad-video-converter.html\">Go to Windows Version &gt;&gt;</a>				</p>");
		p37.setDownUrl("ipad-video-converter-mac.dmg");
		p37.setFileName("ipad-video-converter-mac");
		p37.setImage("ipad-video-converter-box.jpg");
		p37.setName("Eahoosoft iPad Video Converter for Mac");
		p37.setPrice(24.95);
		p37.setScreenShot("ipad-video-converter-mac.jpg");
		p37.setShortDesc("iPad Video Converter for Mac is especially made for iPad customers who wish to watch almost every file saved on various formats on their iPad.");
		p37.setSize("8.06Mb");
		p37.setShortName("iPad Video Converter for Mac");
		p37.setOrderNum(3);
		p37.setIcon("new");
		p37.setVersion("2.0.0");
		p37.setFeatures(getFeature37(p37));
		s.save(p37);
		
		//image converter
		Product p38 = new Product();
		p38.setBuyUrl("https://usd.swreg.org/cgi-bin/s.cgi?s=128442&p=128442-15&q=1&v=0&d=0");
		p38.setCate(c1);
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
		p39.setCate(c5);
		p39.setDescription("Here is a simple puzzle games. It is specifically designed for Apple iPad users.No matter straight horizontal or oblique ,if you make the five same colour ball into line, you can eliminate the ball to score. When the different colors of the ball turn into more and more, do you become hurry-scurry and disorderly? With the highly intelligent, can you vanquish these naughty wacky ball? Free download games and have a try!");
		p39.setDownUrl("http://itunes.apple.com/us/app/funny-bumper-ball/id451465399?ls=1&mt=8");
		p39.setFileName("funny-bumper-ball");
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
		p40.setCate(c4);
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
		
		//更换购买链接
		List<Product> list = s.createQuery("from Product").list();
		for(Product pro : list){
			if(pro.getBuyUrl()!=null)
				pro.setBuyUrl(Common.replaceChars(pro.getBuyUrl()));
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
        "      Extra video outline for the latest iPhone 4<br/>"+
        "      Powered by NVIDIA CUDA with five times quicker conversion period<br/>"+
        "      Allows transferring of output files to PSP, iPhone, and iPod<br/>"+
		"					Allows you to add a transitional effects at the middle of video merge for clean cuts and merging<br/>"+
        "      Categorize the profile setting into various types<br/>"+
        "      Extra Android MPEG-4 profile exclusively for Google phones<br/>"+
		"					Extra conversion output for Apple iPad<br/>"+
        "      Additional use of power management<br/>"+
        "      Split large files to a few smaller files<br/>"+
		"					Ready support Google Android phones and iPad: Samsung i7500, Motorola CLIQ, Motorola Droid, HTC Tattoo, HTC G2 Magic, HTC Hero, Nexus One<br/>"+
        "    "));
		set.add(buildFeature("What's new in 2.1.2?",
        "      1. Support iPad MOV Format.<br/>"+
        "      2. Automatically shuts down or hibernate your computer once conversion is finished.<br/>"+
        "    "));
		return set;
	}
	private static Set<Feature> getFeature2(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Rip DVD to iPad ",
				"DVD to iPad Converter allows you to rip and convert any DVD to iPad video/audio formats. "));
		set.add(buildFeature("Convert video to iPad ",
		"iPad Video Converter could help you to convert all popular video formats, such as MPG, MPEG, MPEG 2, VOB, HD TS, HD MTS, HD M2TS, HD MPG, etc, to iPad supporting formats "));
		set.add(buildFeature("Trim and crop ",
		"Eahoosoft iPad Converter Suite enables you to trim any segment of a video or audio you like. Also you can crop the aspect ratio to fit your player screen and cut off the unwanted areas of the video. "));
		set.add(buildFeature("Edit video effect ",
		"With the help of Eahoosoft iPad Converter Suite, you can adjust video brightness, contrast and saturation for the customized playing effect. "));
		set.add(buildFeature("Merge video ",
		"Eahoosoft iPad Converter Suite provides you the function of joining multiple pieces of videos or audios together for you to enjoy. "));
		set.add(buildFeature("Select audio track and subtitle ",
		"You can select your own audio track and subtitle as you want. "));
		set.add(buildFeature("Adjust your own settings ",
		"In order to enhance work efficiency, you are allowed to set Video Encoder, Resolution, Frame Rate, Video Bitrate and Audio Encoder, Sample Rate, Channels, Audio Bitrate. And all these settings can be saved as your reference for later use. "));
		set.add(buildFeature("Preview and snapshot ","The built-in player of Eahoosoft iPad Converter Suite enables you to preview the original video and the output video effect during the process of converting or editing for you to get a fully control of the video effect. While previewing videos, you can capture any picture you like and save it as JPEG, GIF or BMP format. "));
		set.add(buildFeature("Easy to use ","The user-friendly interface of Eahoosoft iPad Converter Suite makes the operation quite easy for both beginners and advanced users. After a few mouse clicks, this magic software will do the rest work for you. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>300%), completely support dual core CPU."));
//		set.add(buildFeature("",""));
//		set.add(buildFeature("",""));
//		set.add(buildFeature("",""));
//		set.add(buildFeature("",""));
		return set;
	}
	private static Set<Feature> getFeature3(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD and any video/audio to the various video/audio formats ","Eahoosoft DVD Converter Suite software could easily convert DVD and any video to the various video/audio formats such as MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc. "));
		set.add(buildFeature("Support almost all popular portable players ","Eahoosoft DVD Converter Suite software can convert DVD and video to all the popular devices: PSP, iPod Classic, iPod Touch, iPod Nano, iPhone (3G), iPhone, Zune, Zune 2, Blackberry, Nokia, Creative Zen, Sony Walkman, iRiver PMP, Archos, PS3, Apple TV, Xbox, iPad, Mobile Phone, etc."));
		set.add(buildFeature("Easy and powerful editing function (Merge, Trim, Crop) ","Eahoosoft DVD Converter Suite software offers powerful editing functions such as merging multiple DVD chapters, titles or different videos files into one file, trimming any clip of video or DVD, cropping video size and so forth. "));
		set.add(buildFeature("Set video effect ","Get your desired video quality by modifying video Brightness, Contrast, Saturation. With it, you also can apply your modified standard to all the movies. "));
		set.add(buildFeature("Get adjustable quality to put converted video on player ","Define video settings, so you can set the Video Encoder, Frame Rate, Video Bitrate, Resolution. As for the Resolution, if you don't find what you want, you are available to input your own resolution in Width(pixels) * Height(pixels). Set audio settings, including Audio Encoder, Sample Rate, Channels, Audio Bitrate. All the settings can be saved in the option list of \"User-Defined\". "));
		set.add(buildFeature("Preview video effect when you manage it ","With Eahoosoft DVD Converter Suite, it provides the original video preview and output video preview, you can see the video effect when you manage it."));
		set.add(buildFeature("Convert video to picture ","If you like the current image of the video you can use the \"Snapshotoption. Just click the \"Snapshotbutton the image will be saved in the format of GIF, JPEG, BMP, and you can click the \"Openbutton next to \"Snapshotbutton to open your picture. "));
		set.add(buildFeature("Easy to use ","Eahoosoft DVD Converter Suite is very user-friendly and easy to use. Only a few clicks to complete the conversion with supervising the whole process on real time. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>300%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature4(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert between popular audio formats including MP3, WMA, WAV, AAC, FLAC, OGG, AC3 ",""));
		set.add(buildFeature("Extract audio from video and HD-video files including AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD",""));
		set.add(buildFeature("Rip audio CD to popular audio formats ",""));
		set.add(buildFeature("Full audio output customization ",""));
		set.add(buildFeature("High-speed multi-file conversion with support for multithreading, multi-core CPU processing, and batch audio conversion ",""));
		set.add(buildFeature("What's new in the version 2.10?","1. Support to merge into a file .<br/>2. Fix some bugs,delivers excellent audio quality."));
		return set;
	}
	private static Set<Feature> getFeature5(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("High Definition Video Converter ","This video converter for mac allows you to decode and encode high definition videos like MPEG2/MPEG-4 TS HD, HD WMV, FLV,MKV, AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC, HD ASF, HD VOB, HD WMV, HD MPEG4, HD MPEG2 TS, HD MPEG2, and HD AVI."));
		set.add(buildFeature("All purpose Video Converter","Convert MP4 to WMV or AVI or even vice versa. It allows you to convert MPEG, AVI, WMV, H.264/AVC, MP4, MOV, FLV, 3GP, RM, DivX, XviD and more video settings without a fuss."));
		set.add(buildFeature("Sound extractor and converter ","This software allows you to extract audios from videos and convert b AVI to MP3. You can convert between MP3, M4A, RA, WAV, and WMA audio files. You can rip CD to music files and convert lossless audios."));
		set.add(buildFeature("Video Converter for Multimedia Gadgets","Convert audio or video file and play them on different multimedia gadgets such as Google Android phones, mobile phones, PMP, Wii, NDS, Xbox, Zune, PS3, PSP, Apple TV, iPhone, iPad, and iPod, and even post it on YouTube!"));
		set.add(buildFeature("Additional features:","    Extra video outline for the latest iPhone 4<br/>"+
"    Powered by NVIDIA CUDA with five times quicker conversion period<br/>"+
"    Allows transferring of output files to PSP, iPhone, and iPod<br/>"+
"    Allows you to add a transitional effects at the middle of video merge for clean cuts and merging<br/>"+
"    Categorize the profile setting into various types<br/>"+
"    Extra Android MPEG-4 profile exclusively for Google phones<br/>"+
"    Extra conversion output for Apple iPad<br/>"+
"    Additional use of power management<br/>"+
"    Split large files to a few smaller files<br/>"+
"    Ready support Google Android phones and iPad: Samsung i7500, Motorola CLIQ, Motorola Droid, HTC Tattoo, HTC G2 Magic, HTC Hero, Nexus One"));
		set.add(buildFeature("OS Supported: ","Mac OS X v10.5 - 10.6, Snow Leopard support"));
		set.add(buildFeature("Hardware Requirements: ","800MHz Intel or AMD CPU, or above;<br/>512MB RAM or more."));
		return set;
	}
	private static Set<Feature> getFeature6(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Rip DVD to all popular video and audio formats ","The Best DVD Ripper software could easily rip DVD to MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, DPG, AAC, WAV, etc. "));
		set.add(buildFeature("Support almost all popular portable players ","It can rip your DVD to iPad, iPhone 4, PSP, iPod Classic, iPod Touch, iPod Nano, iPhone (3G), iPhone, Zune, Zune 2, Blackberry, Nokia, Creative Zen, Sony Walkman, iRiver PMP, Archos, PS3, Apple TV, Xbox, iPAQ, Pocket PC, Mobile Phone, NDS, etc."));
		set.add(buildFeature("Edit Display Effect ","The Best DVD Ripper offers the solution to adjust the display brightness, contrast and saturation. "));
		set.add(buildFeature("Fastest way to output diverse formats from DVD ","Eahoosoft DVD Ripper supports to convert DVD to different video or audio formats at one time conveniently. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD Ripper, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate. "));
		set.add(buildFeature("Clip into segments and crop frame size ","Set accurate time length clips according to your preference and cut off unwanted area of a video to feature a highlight fitted for your different portable players. "));
		set.add(buildFeature("Merge several into one ","If you want to merge collected several video files into one you can check the \"Merge into one fileoption then merge into one output file. As default the merged file is named after the first selected file (either a title or a chapter). "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshotoption to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferencesbutton. "));
		set.add(buildFeature("Select audio track and subtitle ","Eahoosoft DVD Ripper allows you to choose the audio track and subtitle for your converted video. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to rip and copy DVD movies. "));
		set.add(buildFeature("Fastest Conversion Speed ","The DVD Ripper Provide unmatchable conversion speed, completely support dual core CPU. "));
		set.add(buildFeature("What's new in the version 2.01? ","    1. Support to merge into a file.<br/>    2. Preview video during the conversion.    3. fix some bugs,delivers excellent video quality."));
		return set;
	}
	private static Set<Feature> getFeature7(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Rip DVD to all popular audio formats and Extract audio from DVD movies","Eahoosoft DVD Audio Ripper can rip DVD to the most popular audio formatsAAC, AC3, AIFF, AMR, AU, FLAC, MP3, M4A, MP2, OGG, WAV, WMA and extract the audio from the DVD movies. "));
		set.add(buildFeature("Support all portable media players ","The ripped audio files can be played on all popular MP3 players like iPod, iPod nano, iPod shuffle, Sansa, Zune, PSP, iPhone, iRiver, Archos, Creative Zen etc and mobile phones. "));
		set.add(buildFeature("Easy and powerful DVD audio ripping ( Trim) ","Eahoosoft DVD Audio Ripper offers powerful DVD audio trimming function to capture any DVD clips exactly by setting the start and end time. "));
		set.add(buildFeature("Select audio track and subtitle ","It allows you to select audio track and subtitle for your output file. "));
		set.add(buildFeature("One input file different output formats ","You are able to input your DVD file and convert to different audio formats at the same time. "));
		set.add(buildFeature("Trim DVD Casually ","You could trim any segments you want to rip from DVD by accurately setting start time and end time or just drag the slider bar to the position where you want to trim."));
		set.add(buildFeature("Setting output video and audio parameters ","Detailed video and audio settings are provided by this DVD Audio Ripper for you to adjust, such as Resolution Video Bitrate, Frame Rate, Audio Channels, Sample Rate, etc. "));
		set.add(buildFeature("Merge into one file ","If you want to merge the selected contents into one file you can check the \"Merge into one fileoption. As default the merged file is named after the first selected file (either a title or a chapter). "));
		set.add(buildFeature("Capture your favorite image ","If you like the current image of the video you can use the \"Snapshotoption. Just click the \"Snapshotbutton the image will be saved and you can click the \"Filenext to \"Snapshotbutton to open your picture. You can select the destination of the picture by clicking the \"Preferencesbutton. "));
		set.add(buildFeature("Support Instant Preview ","You can preview both the source DVD file and converted file in the same video edit window. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to rip and copy DVD movies. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature8(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("More efficient video formats conversionAbundant formats supported ","Input formats:<br/>Video: MPG, MPEG, MPEG 2, VOB, DAT, MP4, M4V, TS, RM, RMVB, WMV, ASF, MKV, AVI, 3GP, 3G2, FLV, SWF, QT, MOV, DV, HD TS, HD MPG, HD MPEG, HD MP4, HD WMV, QuickTime HD MOV, HD H.264, HD RM.<br/>Audio: MP3, MP2, AAC, AC3, WAV, WMA, M4A, OGG, AU, APE, FLAC.<br/>Output formats:<br/>This MP4 Converter offers the MPEG-4, H.264/MPEG-4 AVC, MOV, H.264 AVI, DivX, XviD, HD H.264, HD AVI, HD MPEG 4, HD MOV to support iPod, iPhone, PSP, Zune, Walkman, BlackBerry, Archos and Creative Zen Vision from any popular video/audio files with easy procedures. "));
		set.add(buildFeature("Powerful Video Editing functions ","Split segments randomly or exactly<br/>Split movies by presetting the exact start and end time, or just dragging the slider bar.<br/>Merge files into one<br/>This MP4 Video Converter doubles your enjoyment with joining several interesting clips into one.<br/>Crop video playing region to retain what you want<br/>Crop frame size to remove your unwanted area using MP4 Converter like the smart scissors.<br/>Capture highlights<br/>Take snapshot to capture the image of highlight while previewing movies. It can be saved in default folder automatically.<br/>Customize output settings<br/>Set the Video Encoder, Resolution, Frame Rate, Video Bitrate.<br/>Preview both the input and instant output video effect simultaneously<br/>You can preview the original video and the instant output video for your operation at the same time. "));
		set.add(buildFeature("Easier operation and better quality ","Friendly user interface<br/>An intuitively designed user interface brings you more convenience and enjoyment.<br/>Fast speed and high video quality<br/>With professional video encoding and decoding technique, Eahoosoft MP4 Video Converter brings you the advanced and high speed converting process. "));
		set.add(buildFeature("What's new in the version 2.10?","    1. Support to merge into a file<br/>    2. Preview video during the conversion.<br/>    fix some bugs,delivers excellent video quality."));
		return set;
	}
	private static Set<Feature> getFeature9(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Support convert all popular videos to AVI, HD AVI, HD MPG, HD TS ","Eahoosoft AVI Video Converter gives you a hand to get AVI, and HD AVI videos from all popular videos, like MPEG, MPEG-4, RM, WMV, ASF, TS, MKV, AVI, 3GP, FLV, etc. "));
		set.add(buildFeature("Trim your video length. ","Clip any segment of your video perfectly. "));
		set.add(buildFeature("Crop the play region ","Adjust the playing region of the video to fit for your player and your favor. "));
		set.add(buildFeature("Merge into one file ","Merge your separated video files into only one AVI file. "));
		set.add(buildFeature("Capture favorite pictures ","Capture your favorite pictures when preview your video and you can choose to save it as JPEG, GIF or BMP formats. You can also set the saved folder or it will be saved automatically in the defaulted folder. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide super fast speed to convert video to AVI, and the convert to AVI conversion speed will be promoted with the performance increase your CPU with the \"CPU Usage\" "));
		set.add(buildFeature("Easy to use ","Just few clicks to convert to AVI. This AVI Converter is easy-to-use for beginners and veterans. "));
		return set;
	}
	private static Set<Feature> getFeature10(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Abundant formats supported ","Eahoosoft MOV Video Converter ia able to convert QuickTime MOV to MP4 and other video formats.<br/>Support output video profile: MPEG-4, H.264/MPEG-4 AVC, MOV, M4V, AVI, DivX, XviD, ASF, WMV, MPEG-1, MPEG-2, 3GP, 3GPP, MKV, FLV, SWF, VOB, DV, Super VCD(NTSC, PAL, SECAM), VCD(NTSC, PAL, SECAM) , DVD(NTSC, PAL, SECAM), HD H.264, HD AVI, HD MPG, HD TS, HD WMV, HD MPEG 4, HD MOV, HD ASF<br/>Support output audio profile: AAC, AC3, AIFF, AMR, AU, FLAC, MP3, M4V, MP2, OGG, WAV, WMA<br/>Compatible with various digital device<br/>With powerful MOV Video Converter, you can enjoy QuickTime MOV videos on other digital devices, including iPod, iPhone, Apple TV, BlackBerry, Gphone, PSP, Zune, Creative Zen, iRiver, and other MP4 players."));
		set.add(buildFeature("Powerful Video Editing functions ","Split segments randomly or exactly<br/>Split movies by presetting the exact start and end time, or just dragging the slider bar.<br/>Merge files into one<br/>Eahoosoft MOV Video Converter doubles your enjoyment with joining several interesting clips into one.<br/>Crop video play region to retain what you want<br/>Crop frame size to remove unwanted area with this MOV Video Converter like the smart scissors.<br/>Capture highlights<br/>Take snapshot to capture the image of highlight while previewing movies. It can be saved in default folder automatically.<br/>Real-time preview<br/>Its preview display enables you to preview the original video and the instant output video for your operation at the same time.<br/>Customize video converting<br/>Eahoosoft MOV Video Converter also allows you to set the Video Encoder, Resolution, Frame Rate, Video Bitrate for video, set the Audio Encoder, Sample Rate, Channels, Audio Bitrate for audio. You are capable of saving all the output settings as your preference, which is saved in the user-defined column automatically. "));
		set.add(buildFeature("Easier operation and better quality ","An intuitively designed user interface brings you more convenience and enjoyment. Eahoosoft MOV Video Converter integrates plenty of professional codec so that all the conversion is in amazing speed with super quality without the installation of third party media players. "));
		return set;
	}
	private static Set<Feature> getFeature11(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert video to 3GP","Convert almost all popular video files AVI, DivX, XviD, WMV(Window Media Player), MPEG, MPG, DAT(VCD), RM(RealPlayer), MOV(QuickTime), ASF, VOB(DVD) etc. to 3GP format, including 3GP, 3G2, MPEG4, AMR and so on. "));
		set.add(buildFeature("It acts as AVI to 3GP, MPEG to 3GP, WMV to 3GP, DivX to 3GP, VOB to 3GP and so on.",""));
		set.add(buildFeature("Extract audio from video files ","Extract and convert audio from video files to MP3 and M4A as your mobile phone tones."));
		set.add(buildFeature("Convert 3GP files to video formats ","Convert 3GP files to popular video formats like 3GP to AVI, MPEG, DivX, WMV, WMA, MOV and H.264/MPEG-4 AVC, etc."));
		set.add(buildFeature("Convert audio from 3gp movie ","Rip audio from 3gp movie to MP3, WAV, RA, AAC, M4A and so on."));
		set.add(buildFeature("Support Nokia, Motorola, Sony Ericsson and other mobile phones",""));
		set.add(buildFeature("Trim movie length ","Trim your video files to capture your favorite movie clips. "));
		set.add(buildFeature("Super fast conversion speed beyond your imagination. ",""));
		return set;
	}
	private static Set<Feature> getFeature12(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert HD video of all types ","This high definition video converter (HD converter) flawlessly supports all kinds of HD video, including MOD/TOD and AVCHD videos from camcorder devices, MTS/M2TS videos. "));
		set.add(buildFeature("Make HD video available in various formats ","Eahoosoft HD Video Converter can convert HD video to almost all available formats, e.g. AVI, MP4, WMV, MKV, RMVB, FLV, MPG, MOV, VOB, 3GP. "));
		set.add(buildFeature("Stable and high speed HD video conversion ","You can convert batch of HD videos at a time and run the program on multicore CPU system for a fast HD video conversion. "));
		set.add(buildFeature("Put HD video to enjoy on personal devices ","This HD tool provides abundant output profiles to convert HD video for playback on iPod, iPhone, PSP, Zune, Apple TV, Xbox, mobile phones and more without hassles. "));
		set.add(buildFeature("Professional conversion settings for flexible output ","There are advanced settings for conversion like video bit rate, frame rate, audio bit rate, channel, etc. to broaden output of the HD video conversion. "));
		set.add(buildFeature("Built-in HD video player with screenshot output ","The program comes with an embedded video player for you to preview the HD videos and capture the video frames and then save them to JPG, BMP or PNG files. "));
		set.add(buildFeature("Adjust video effect to your satisfaction ","You can tweak the brightness, contrast and saturation of the image so as to get the video to project better on your device screen. "));
		set.add(buildFeature("Cut your favorite part out of the entire video ","This HD video converter lets you pick a precise length of the HD video for conversion to get rid of unwanted parts easily. "));
		set.add(buildFeature("Crop the video image for better display ","To make the HD video display better on different screens, e.g. TV screen, projector canvas, mobile phone screen, Eahoosoft HD Video Converter offers 4:3, 16:9, pan scan crop presets as well as the opportunity to customize. "));
		return set;
	}
	private static Set<Feature> getFeature13(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("High Speed Multi-core CPU","FLV supports multi-core CPU which means that you convert as many files as you wish at the peak conversion speed at the same time. "));
		set.add(buildFeature("Video to FLV converter","It allows you to turn 3GP, XviDm, MOV, RM, MKV, AVCHD, H.264/AVC, MP4, DivX, WMV, MPEG, AVI files into Flash FLV videos."));
		set.add(buildFeature("merge several files into a single flash video formats(flv, swf, f4v) file. ",""));
		set.add(buildFeature("Main Features","Batch multithreading and conversion which allows you to convert many files at a time using one click.<br/>Choose any video cut of a file to convert by just specifying its start and duration period; divide one file into different files<br/>Manually modify multiple audio and video parameters frame rate, bit rate, sample rate, and codec.<br/>Automatic computer shut down feature. With this innovative feature you won't have to wait at the end of their task<br/>Watch the input file before or during the conversion and the output file at the end of the conversion using a built-in sizable player<br/>"));
		return set;
	}
	private static Set<Feature> getFeature14(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert Videos to PSP MP4 and MPEG-4 Videos","It allows you to convert different video setting to PSP video settings like VOB, MPEG, WMV, and VOB to PSP "));
		set.add(buildFeature("PS3 Video Converter","Change different video settings like 3GP, AVI, MKV, MPEG, H.264/AVC, WMV, DivX, MP4, MOV to PS3 MPEG-4 video setting"));
		set.add(buildFeature("Convert Audio to PSP Music ","PSP MP3 converter allows you to convert sound settings like CUE, WMA, OGG, WAV, AAC, M4Am and AC3 to PSP music such as WMA, MP3, WAV, and M4A"));
		set.add(buildFeature("Key Characteristics","The profile setting are categorized by various forms<br/>Supports multi-core CPU and allows instant conversion at the quickest pace possible<br/>Directly extract and convert a section from the original video file by inputting its start time and longevity and duration<br/>Convert a file into multiple various settings at the same time protecting the original file setting<br/>Modifiable parameters such as audio channel, quality, codec, sample rate, bit rate and frame rate<br/>Allows your PC to auto shut down, standby, hibernate right after the process is completed"));
		set.add(buildFeature("What's new in 2.11?","Automatically shuts down your computer once conversion is finished. "));
		return set;
	}
	private static Set<Feature> getFeature15(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Allow you to convert most video/audio formats to Nokia Video ","Support video/audio formats <br>Input video/audio formats: MPG, MPEG, MPEG 2, VOB, DAT, MP4, M4V, TS, RM, RMVB, WMV, ASF, MKV, AVI, 3GP, 3G2, FLV, SWF, MPV, QT, MOV, DV, MP3, MP2, AAC, AC3, WAV, WMA, M4A, RM, RAM, OGG, AIFF, APE, FLAC, Etc.<br/>Output video/audio formats: MP3, WAV, AAC audio formats and various video formats like MP4, 3GP.Extract audio from AVI,MPEG,MP4,3GP and more videos and convert to Nokia music MP3 and WAV audios. "));
		set.add(buildFeature("Compatible with all Nokia Serials ","This Video to Nokia Converter offers the proper video/audio compatible with Nokia N96, E75, E71, E63, N95, N75, N73, 5300, 6555, etc. "));
		set.add(buildFeature("Split segments randomly or exactly ","Split movies by presetting the exact start and end time, or just dragging the slider bar. "));
		set.add(buildFeature("Merge files into one ","This Nokia Video Converter doubles your enjoyment with joining several interesting clips into one. "));
		set.add(buildFeature("Customize output settings ","Set the Video Encoder, Resolution, Frame Rate, Video Bitrate."));
		set.add(buildFeature("Preview both the input and instant output video effect simultaneously ","You can preview the original video and the instant output video for your operation at the same time. "));
		set.add(buildFeature("Friendly user interface ","An intuitively designed user interface brings you more convenience and enjoyment. "));
		set.add(buildFeature("Fast speed and high video quality ","With professional video encoding and decoding technique, Eahoosoft Nokia Video Converter brings you the advanced and high speed converting process. "));
		set.add(buildFeature("Support video preview and batch file conversion ",""));
		set.add(buildFeature("Support \"Drag and Drop\" files to Nokia Video Converter. ",""));
		return set;
	}
	private static Set<Feature> getFeature16(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to 3gp video and audio","Convert almost all kinds of DVD movies to to 3GP format, including 3GP, 3G2, MPEG4, AMR and so on "));
		set.add(buildFeature("Support many devices .","Support Nokia, Motorola, Sony Ericsson and other mobile phones. "));
		set.add(buildFeature("Wonderful video effects ","Adjust the display brightness, contrast and saturation to get special effects. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to 3GP Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate ."));
		set.add(buildFeature("trim, merge and crop video ","Clip any part of the DVD movie into video clips by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one file\" option. With Eahoosoft DVD to 3GP Converter you can remove black edges of your DVD movie and crop movie image size by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to iPod so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to 3GP converter allows you select audio track and subtitle for your output file "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to 3GP. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature17(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to iPod video and audio ","Convert almost all kinds of DVD movies to iPod video and audio such as convert DVD to iPod MP4 Video, DVD to XVID/DIVX AVI, DVD to H.264/MPEG-4 AVC, MOV, M4V etc. Extract DVD audio to AAC, MP3, WAV, AIFF, M4A and so on. "));
		set.add(buildFeature("Support many devices ","The best DVD to iPod ripper would help you to convert DVD to iPod, DVD to iPod touch, DVD to iPod nano, DVD to iPod Classic and others like iPad, iPod touch 2, iPod nano 4, iPhone, iPhone 3G, iPhone 3GS/ iPhone 4, Apple TV and more. "));
		set.add(buildFeature("Wonderful video effects ","Adjust the display brightness, contrast and saturation to get special effects. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to AVI Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate ."));
		set.add(buildFeature("trim, merge and crop video ","Clip any part of the DVD movie into video clips by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one file\" option. With Eahoosoft DVD to AVI Converter you can remove black edges of your DVD movie and crop movie image size by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to iPod so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to AVI converter allows you select audio track and subtitle for your output file "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to iPod. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature18(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Directly convert DVD to FLV, SWF with a flash player ","Eahoosoft DVD to FLV Converter can perfectly convert DVD to FLV, SWF for you to upload to Youtube, Myspace and Google video. "));
		set.add(buildFeature("Colorful video effect ","Adjust the display brightness, contrast and saturation. "));
		set.add(buildFeature("Wonderful video/audio settings ","More video and audio settings are provided by this DVD to FLV Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate then save them as user-defined profile for future use. You also can customize you need video resolution in form of xxx*xxx. "));
		set.add(buildFeature("Trim DVD Casually ","You could trim any segments you want to convert from DVD to FLV by accurately setting start time and end time or just drag the slider bar to the position where you want to trim. "));
		set.add(buildFeature("Merge into one file ","If you want to merge the selected contents into one file you can check the \"Merge into one file\" option. As default the merged file is named after the first selected file (either a title or a chapter). "));
		set.add(buildFeature("Crop your video ","With Eahoosoft DVD to FLV Converter you can remove black edge of your DVD movie and get any playing area of the video by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to your portable devices so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to rip and copy DVD movies. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to FLV converter allows you select audio track and subtitle for your output file. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature19(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to hd video ","Convert almost all kinds of DVD movies to hd video such as convert DVD to HD avi, HD mp4, HD ts, HD mpg and so on. "));
		set.add(buildFeature("Wonderful video effects ","Adjust the display brightness, contrast and saturation to get special effects. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to iPod Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate "));
		set.add(buildFeature("trim, merge and crop video ","Clip any part of the DVD movie into video clips by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one file\" option. With Eahoosoft DVD to HD Converter you can remove black edges of your DVD movie and crop movie image size by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to iPod so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to HD converter allows you select audio track and subtitle for your output file. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to HD. "));
		set.add(buildFeature("Fastest Conversion Speed ",""));
		return set;
	}
	private static Set<Feature> getFeature20(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("DVD to Mobile Phone video and audio converter ","With this perfect Eahoosoft DVD to Mobile Phone Converter you can easily convert DVD to Mobile Phone video formats including 3GP, 3G2, MPEG-4, H.264/MPEG-4 AVC, WMV, AVI, and AAC, MP3, M4A, WMA, MP2, WAV audio formats. "));
		set.add(buildFeature("Support various mobile phones","iPhone, Dell Player, HP, iPAQ, General Pocket PC, Gphone, Sony XPERIA X1a, Sony XPERIA X1i/X1c, Nokia series, BlackBerry Series, Palm Pre, Motorola, Motorola RA2RZ U8, Motorola A1200, Motorola ROKR E6, Motorola Q8, LG, LG KG70, LG KU990, LG Prada, LG KE970, Samsung series, Sony Ericsson, Sony Ericsson S500C, Sony Ericsson K818C, etc. "));
		set.add(buildFeature("Optimize Video Effect ","Convert DVD to Mobile Phone with flexible video and audio settings: adjust Brightness / Contrast / Saturation to optimize the picture performance, and preset Volume. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to Mobile Phone Converter software, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate , you also can input you own Resolution in the form of xxx*xxx. then save them as user-defined profile for future use. "));
		set.add(buildFeature("Trim, merge and crop video ","Clip any part of the DVD movie into video clips just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one file\" option. With Eahoosoft DVD to Mobile Phone Converter you can remove black edges of your DVD movie and crop movie image size by pressing \"Crop\" button and set the screen size by Keep original/ Full screen/ 16:9/ 4:3 to adjust to mobile phone so you can get the best video quality. "));
		set.add(buildFeature("Capture your favorite image ","If you come into your favorite image you can use the \"Snapshot\" option so that the image will be saved at: C:\\Documents and Settings\\Administrator\\My Documents\\Eahoosoft Studio\\Snapshot in default and click the \"File\" next to \"Snapshot\" button to open your picture. "));
		set.add(buildFeature("Support Preview ","A few clicks are all you need to do to convert DVD to HD. You can preview the source video and edited video and compare them for your further operation. "));
		set.add(buildFeature("Select audio track and subtitle at your will ","This excellent DVD to Mobile Phone converter enables you to select audio track and subtitle for your output file. "));
		set.add(buildFeature("Intuitive interface ","The user-friendly screenshot must be helpful in guiding you how to convert DVD to 3GP and other formats to play on Mobile Phone."));
		return set;
	}
	private static Set<Feature> getFeature21(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to MOV video and audio ","Convert almost all kinds of DVD movies to MOV and other video formats. "));
		set.add(buildFeature("Support many devices ","With powerful DVD to MOV Converter, you can enjoy QuickTime MOV videos on other digital devices, including iPod, iPhone, Apple TV, BlackBerry, Gphone, PSP, Zune, Creative Zen, iRiver, and other MP4 players. "));
		set.add(buildFeature("Wonderful video effects ","Adjust the display brightness, contrast and saturation to get special effects. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to MOV Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate ."));
		set.add(buildFeature("trim, merge and crop video ","Clip any part of the DVD movie into video clips by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one file\" option. With Eahoosoft DVD to MOV Converter you can remove black edges of your DVD movie and crop movie image size by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to iPod so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to MOV converter allows you select audio track and subtitle for your output file "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to iPod. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature22(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Directly Convert DVD to MP4, H.264/MPEG-4 AVC (.mp4), MOV, AVI ","Eahoosoft DVD to MP4 Converter can easily convert DVD to MP4, H.264/MPEG-4 AVC (.mp4), MOV, AVI in the highest speed and quality. "));
		set.add(buildFeature("Upgrade to support HD video output ","Provides the professional way to convert DVD to HD H.264, HD AVI, HD MPEG 4, HD MOV video. "));
		set.add(buildFeature("Take out audio from DVD ","Besides convert DVD to MP4, it also can convert DVD to AAC, AC3, AIFF, AMR, AU, FLAC, MP3, M4A, MP2, OGG, WAV, WMA audio formats to make your music enjoyment more colorful. "));
		set.add(buildFeature("Sync to most players or devices ","Eahoosoft DVD to MP4 Converter can make your converted video compatible with iPod, iPod touch, iPod touch 2, iPod nano, iPod nano 4, iPod classic, iPhone, iPhone 3G, Apple TV, PSP, PS3, Wii, Zune, Zune 2, Xbox, Xbox 360, Google Phone, Sony Walkman, Archos, Creative Zen, iRiver, BlackBerry, BlackBerry Storm, BlackBerry Bold, Palm Pre, Motorala, LG, Sony Ericsson, Mobile Phone, etc. ."));
		set.add(buildFeature("Professional way to edit video effect ","Adjust the display brightness, contrast and saturation. "));
		set.add(buildFeature("Superb video/audio settings ","This DVD to MP4 Converter provides more video and audio settings, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate then save them as user-defined profile for future use. You also can customize you need video resolution in form of xxx*xxx. "));
		set.add(buildFeature("Trim DVD Casually ","You could trim any segments you want to convert from DVD by accurately setting start time and end time or just drag the slider bar to the position where you want to trim. "));
		set.add(buildFeature("Merge into one file ","If you want to merge the selected contents into one file you can check the \"Merge into one file\" option. As default the merged file is named after the first selected file (either a title or a chapter)."));
		set.add(buildFeature("Crop your video ","With Eahoosoft DVD to MP4 Converter you can remove black edge of your DVD movie and get any playing area of the video by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to your portable devices so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferences\" button. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to rip and convert DVD to MP4. "));
		set.add(buildFeature("Select audio track and subtitle ","It allows you to select audio track and subtitle for your output file. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature23(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to PSP output formats ","The best Eahoosoft DVD to PSP converter can convert DVD to PSP video and extract audio track from DVD to PSP audio. SD Video: MPEG-4, H.264, H.264/MPEG-4 AVC, AVI, DivX, XviD,WMV HD Video: HD H.264, HD DivX, HD WMV, HD XviD, HD MPEG 4, HD H.264/MPEG-4 AVC Audio: MP3, M4A, WAV, WMA "));
		set.add(buildFeature("DVD to PSP, DVD to PS3 and DVD to others ","It supports many devices including PSP, PS3, PSP 3000, Sony Walkman, Sony XPERIA X1a, Sony XPERIA X1i/X1c "));
		set.add(buildFeature("Edit Display Effect ","Eahoosoft DVD to PSP Converter provides the video effect parameters, video Brightness, Contrast, Saturation and audio Volume. "));
		set.add(buildFeature("Output video and audio parameters ","You are available to set output video and audio parameters using this DVD to PSP converter software, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate. Input video Resolution you need in the form of Width (pixels)*Height (pixels), then saved all those settings as user-defined profile."));
		set.add(buildFeature("Clip into segments and crop frame size ","Set accurate time length clips according to your preference and cut off unwanted area of a video to feature a highlight fitted for your different portable players. "));
		set.add(buildFeature("Merge several into one ","If you want to merge collected several video files into one you can check the \"Merge into one file\" option then merge into one output file. As default the merged file is named after the first selected file. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshot\" option to take a snapshot of the film and save as a picture file. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to PSP converter allows you to rip the whole DVD movie with selectable target subtitle, audio track. "));
		set.add(buildFeature("High DVD converting speed ","Provide the faster than ever before conversion speed (>300%), completely support dual core CPU. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to PSP. "));
		return set;
	}
	private static Set<Feature> getFeature24(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Directly convert DVD to WMV ","Eahoosoft DVD to WMV Converter can perfectly convert DVD to WMV, WMA, MP3 in excellent video/audio quality, and super fast conversion speed. "));
		set.add(buildFeature("Sync to most players compatible with WMV ","After you rip DVD to WMV, you can put the converted video on Google Phone, BlackBerry Storm, BlackBerry Bold, Palm Pre, Zune, Zune 2, PSP, PS3, Xbox 360, Dell Player, HP iPAQ, etc. "));
		set.add(buildFeature("Set Video Effect ","Convert DVD to WMV with flexible video and audio settings: adjust Brightness / Contrast / Saturation to optimize the picture performance, and preset Volume. "));
		set.add(buildFeature("Variable output video and audio parameters ","Detailed video and audio settings are provided by this DVD to WMV converter software for you to adjust, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels for target sound effect, Sample Rate, Encoder, Audio Bitrate then save them as user-defined profile for future use. "));
		set.add(buildFeature("Trim DVD Casually ","You could trim any segments you want to convert from DVD by accurately setting start time and end time or just drag the slider bar to the position where you want to trim. "));
		set.add(buildFeature("Merge into one file ","If you want to merge collected several video files into one you can check the \"Merge into one file\" option then merge into one output file. As default the merged file is named after the first selected file. "));
		set.add(buildFeature("Crop your video ","With Eahoosoft DVD to WMV Converter you can remove black edge of your DVD movie and get any playing area of the video by using its \"Crop\" function. You can also select the \"Zoom\" mode to extrude your video slightly to adjust to your portable devices so you can get the best video quality. "));
		set.add(buildFeature("Select audio track and subtitle to convert ","The portions of DVD movie can be selected by this excellent DVD to WMV converter, such as selecting certain subtitle, audio track to rip. "));
		set.add(buildFeature("Preview and take a snapshot ","You can preview the source video and edited video. When you come into your favorite movie scenes during previewing, the DVD to WMV converter can capture the screen images and save them as JPEG, GIF, BMP files. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to WMV. "));
		return set;
	}
	private static Set<Feature> getFeature25(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to Zune compatible videos and audios ","Eahoosoft DVD to Zune Converter can convert DVD to Zune WMV, MP4, H.264/MPEG-4 AVC(.mp4) video and rip DVD to MP3, WMA, M4A, AAC audio format with excellent output video/audio quality. "));
		set.add(buildFeature("Set video effect ","Eahoosoft DVD to Zune Converter allows you to adjust the video effect: video Brightness, Contrast, Saturation. "));
		set.add(buildFeature("Trim DVD Movie ","Eahoosoft DVD to Zune Converter has the trim function. It means that you can get any time-length video clips by setting the exact time or just drag the slider bar. "));
		set.add(buildFeature("Crop DVD video ","Adjust the size of DVD video play region and the output aspect ratio to get the perfect playing effect on Zune. "));
		set.add(buildFeature("Merge into one file ","Merge your selected DVD sources into one file after conversion for you to enjoy successively. "));
		set.add(buildFeature("Support all the parameters ","All the parameters of profile can be provided for you to choose the exact settings for your players with the assistance of Eahoosoft DVD to Zune Converter. Edit Video Settings, and choose you player suited Video Encoder, Resolution, Frame Rate, Video Bitrate. Input you need Video Resolution in the form of Width(pixels)*Height(pixels), along with the Audio Settings adjusting: Audio Encoder, Sample Rate, Channels, Audio Bitrate. All settings can be saved as user-defined profile in prepare for future use. "));
		set.add(buildFeature("Support preview ","By using this DVD to Zune Converter, you can preview both the DVD original video and output video effect at the same time. "));
		set.add(buildFeature("Audio track and subtitle ","Select the audio track and subtitle you want for your output video. "));
		set.add(buildFeature("Take snapshot ","Capture your favorite pictures when you preview your DVD. It can be saved in the default folder automatically. "));
		set.add(buildFeature("Fastest conversion speed ","Provide the fastest conversion speed (>300%), completely support dual core CPU. "));
		set.add(buildFeature("Easy to use ","Eahoosoft DVD to Zune Converter is really easy to use. The whole process of conversion can be finished in few clicks. "));
		return set;
	}
	private static Set<Feature> getFeature26(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert between popular audio formats including MP3, WMA, WAV, AAC, FLAC, OGG, AC3, M4A ",""));
		set.add(buildFeature("Extract audio from video and HD-video files including AVI, MPEG, WMV, VOB, RMVB, XviD,MP4, FLV, MKV, H.264/MPEG-4 AVC",""));
		set.add(buildFeature("Rip audio CD to popular audio formats",""));
		set.add(buildFeature("Full audio output customization",""));
		set.add(buildFeature("Support batch conversion",""));
		set.add(buildFeature("High-speed multi-file conversion with support for multithreading, multi-core CPU processing",""));
		set.add(buildFeature("OS Supported: ","Mac OS X v10.5 - 10.6, Snow Leopard support"));
		set.add(buildFeature("Hardware Requirements: ","800MHz Intel or AMD CPU, or above;<br/>512MB RAM or more."));
		return set;
	}
	private static Set<Feature> getFeature27(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Transform Audio to WMA MP3 ","Supports WMA, WAV, AAC, FLAC, OGG, APE, and many others as input audio formats. "));
		set.add(buildFeature("Extract WMA MP3 from Videos ","Extract WMA MP3 audio from different format SD and HD video files including AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD, and many others. "));
		set.add(buildFeature("Rip audio CD to WMA MP3 formats ",""));
		set.add(buildFeature("Clip Audio segments ",""));
		set.add(buildFeature("High-Speed WMA MP3 Audio Conversion ","Great support for multithreading and multi-core CPU processing accelerates the WMA MP3 audio conversion."));
		set.add(buildFeature("Batch WMA MP3 Conversion ","Converts multiple files to WMA MP3 audio files at one time. "));
		return set;
	}
	private static Set<Feature> getFeature28(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert between popular audio formats including MP3, WMA, WAV, OGG ",""));
		set.add(buildFeature("Extract audio from video and HD-video files including AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD",""));
		set.add(buildFeature("Batch video to audio conversion ",""));
		set.add(buildFeature("High-speed multi-file conversion with support for multithreading, multi-core CPU processing ",""));
		return set;
	}
	private static Set<Feature> getFeature29(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Rip DVD to iPad compatible video formats ","Eahoosoft DVD to iPad Converter enables you to convert DVD to iPad Video and audio files including MP4, H.264, MP3, AAC, WMA. "));
		set.add(buildFeature("Extract audios from DVD ","With Eahoosoft DVD to iPad Converter, you are able to extract any audio you like from your DVD file, and enjoy it on your iPad. "));
		set.add(buildFeature("Trim, crop, merge, watermark ","Eahoosoft DVD to iPad Converter owns powerful editing functions, such as trimming any segment of a video, cropping the video size, merging several files together. "));
		set.add(buildFeature("Adjust video effect ","The best DVD to iPad Converter allows you to adjust video brightness, contrast and saturation for you to get customized video effect. "));
		set.add(buildFeature("Preview and snapshot ","The built-in player of this DVD to iPad converter can help you to preview the source and target videos for you to get a fully control of the video effect. During the process of previewing, you can capture and save any picture you like. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to iPad converter allows you select audio track and subtitle. "));
		set.add(buildFeature("Easy to use ","The user-friendly interface makes the operation quite easy for both beginners and advanced users "));
		return set;
	}
	private static Set<Feature> getFeature30(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("iPad High Definition Converter","Convert High Definition videos into iPad 720p H.264, supported high definition setting includes AVCHD*.mts,*m2ts, AVI HD, WMV HD, Quick Time HD, MPEG-2 TS HD, MPEG-4 TS HD, H.264/MPEG-4 AVC. "));
		set.add(buildFeature("Supports Mutlti-core CPU","You can maximize the use of your multi-core processor by turning files using all cores for instant conversion."));
		set.add(buildFeature("iPad Music converter","Get audios from videos and turn them into iPad AIFF, AAC, WAV, MP3 audio; just turn all well known audio setting into iPad audio format."));
		set.add(buildFeature("iPad Video Converter ","iPad video converter allows you to convert just any popular video setting to MOV video, MPEG4, and H.264. "));
		set.add(buildFeature("Major Features","Multilingual interfaces<br/>    Modify a variety of output parameters: frame rate, channel codec, aspect ratio, bit rate, and many more<br/>    Automatically divide files into numerous parts by setting the start time and the duration period<br/>    Allows you to have conversion outlines with optimized output parameters to perfectly sync your iPad<br/>    Watch video and extract from it<br/>    Output multiple setting in one file<br/>    Automatically shuts down or hibernate your computer once conversion is finished"));
		set.add(buildFeature("What's new in 2.11?","1. Support iPad MOV Format.<br/>2. Automatically shuts down or hibernate your computer once conversion is finished."));
		return set;
	}
	private static Set<Feature> getFeature31(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD and any video/audio to MP4/H.264 ","Eahoosoft DVD to iPhone Converter Suite could easily convert DVD and video/audio files to iPhone/iPhone (3G), iPhone 3GS/ iPhone 4 MP4, H.264, and MOV. "));
		set.add(buildFeature("Professional function of audio converter ","Eahoosoft DVD to iPhone Converter Suite could easily convert any audio such as MP3, MP2, AAC, AC3, WAV, MID, MIDI, WMA, M4A, RA, RAM to iPhone M4A/AAC/MP3 audio files."));
		set.add(buildFeature("Easy and powerful editing function (Merge, Trim, Crop) ","Eahoosoft DVD to iPhone Converter Suite offers powerful editing functions such as merging multiple DVD chapters, titles or different videos files into one file, trimming any clip of video or DVD, cropping video size and so forth. "));
		set.add(buildFeature("Set video effect ","Define video settings, so you can set the Video Encoder, Frame Rate, Video Bitrate, Resolution. As for the Resolution, if you don't find what you want, you are available to input your own resolution in Width(pixels) * Height(pixels). Set audio settings, including Audio Encoder, Sample Rate, Channels, Audio Bitrate. All the settings can be saved in the option list of \"User-Defined\". "));
		set.add(buildFeature("Snapshot picture and preview ","With Eahoosoft DVD to iPhone Suite, it provides the original video preview and output video preview, you can see the video effect when you modify it. If you like the current image of the video you can use the \"Snapshotoption. Just click the \"Snapshotbutton the image will be saved and you can click the \"Openbutton next to \"Snapshotbutton to open your picture. "));
		set.add(buildFeature("Easy to use ","The Best DVD to iPhone Converter Suite is very user-friendly and easy to use. Only a few clicks to complete the conversion with supervising the whole process on real time."));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>300%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature32(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert any DVDs to iPhone video and audio formats ","Eahoosoft DVD to iPhone Converter can convert DVD to iPhone MP4, H.264/MPEG-4 AVC, MOV, M4V Videos. In addition, it could also convert DVD to AAC, MP3, WAV, AIFF, M4A audio formats. "));
		set.add(buildFeature("Support devices ","It can converting DVD to iPhone, iPhone 3G, iPhone 3GS, iPhone 4. "));
		set.add(buildFeature("Edit Display Effect ","Best DVD to iPhone Ripper provides the video effect parameters, video Brightness, Contrast, Saturation and audio Volume. "));
		set.add(buildFeature("Set output video and audio parameters ","Detailed video and audio settings are provided by this DVD to iPhone Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate then you can save them as user-defined profile for convenience. "));
		set.add(buildFeature("Trim DVD randomly ","You could get any time length segments you want by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. "));
		set.add(buildFeature("Crop your video ","With Eahoosoft DVD to iPhone Converter you can remove black edge of your DVD movie and get any playing area of the video. "));
		set.add(buildFeature("Merge into one file ","Check the \"Merge into one fileoption to merge the selected contents into one file. As default the merged file is named after the first selected file. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to iPhone converter allows you to rip the whole DVD movie with selectable target subtitle, audio track. "));
		set.add(buildFeature("Capture your favorite image ","Capture image of the video when previewing with the built-in player and save as JPG, GIF, BMP. You can select the destination of the picture by clicking the \"Preferencesbutton. "));
		set.add(buildFeature("Support Preview ","You can preview the source video and edited video. "));
		set.add(buildFeature("High DVD converting speed ","Provide the faster than ever before conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature33(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert Video to iPhone compatible formate","Turn different videos such as 3GP, MP4, DivX, WMV, MPEG, and AVI into iPhone MPEG-4/MP4 videos; examples are MKV to iPhone"));
		set.add(buildFeature("Support multi-core CPU","Automatically sense CPU. For multi-core CPU conversion speed is achieved in maximum conversion rate than ever."));
		set.add(buildFeature("Audio extractor","Extract audio from video; convert APE, OGG, AC3, RA, WMA, MP2, CDA, and MP3 to iPhone music AIFF, AAC, WAV, and MP3. CD translation is supported."));
		set.add(buildFeature("Key Characteristics","    The profile settings are classified by various forms.<br/>    Multithreading and group conversion mean that you can convert several files in one go.<br/>    Allows you to modify parameters including aspect ratio, codec, channel, sample rate, frame rate, and bit rate<br/>    Capable to divide a file into several and turn any part of a file using its beginning time and duration period opt for<br/>    Allow you to put in multiple files in similar or different settings converted into one source<br/>    Has an auto-shut down feature that allows you to leave the application while its working<br/>"));
		set.add(buildFeature("What's new in 2.11?","Automatically shuts down your computer once conversion is finished. "));
		return set;
	}
	private static Set<Feature> getFeature34(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("Convert DVD to iPod video and audio ","Convert almost all kinds of DVD movies to iPod video and audio such as convert DVD to iPod MP4 Video, DVD to H.264/MPEG-4 AVC, MOV, M4V etc. Extract DVD audio to AAC, MP3, WAV, AIFF, M4A and so on."));
		set.add(buildFeature("Support many devices ","The best DVD to iPod ripper would help you to convert DVD to iPod, DVD to iPod touch, DVD to iPod nano, DVD to iPod Classic and others like iPad, iPod touch 2, iPod nano 4, iPhone, iPhone 3G, iPhone 3GS/ iPhone 4, Apple TV and more. "));
		set.add(buildFeature("Wonderful video effects ","Adjust the display brightness, contrast and saturation to get special effects. "));
		set.add(buildFeature("Output video and audio parameters ","More video and audio settings are provided by this DVD to iPod Converter, such as Video Resolution, Video Bitrate, Frame Rate, Encoder and Audio Channels, Sample Rate, Encoder, Audio Bitrate "));
		set.add(buildFeature("trim, merge and crop video ","Clip any part of the DVD movie into video clips by accurately setting start time and end time or just dragging the slider bar to the position where you want to stop the trimming. Merge many DVD titles/chapters into one by checking the \"Merge into one fileoption. With Eahoosoft DVD to iPod Converter you can remove black edges of your DVD movie and crop movie image size by using its \"Cropfunction. You can also select the \"Zoommode to extrude your video slightly to adjust to iPod so you can get the best video quality. "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the \"Snapshotoption to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the \"Preferencesbutton. "));
		set.add(buildFeature("Select audio track and subtitle ","This excellent DVD to iPod converter allows you select audio track and subtitle for your output file. "));
		set.add(buildFeature("Easy to use ","A few clicks are all you need to do to convert DVD to iPod. "));
		set.add(buildFeature("Fastest Conversion Speed ","Provide the fastest conversion speed (>400%), completely support dual core CPU. "));
		return set;
	}
	private static Set<Feature> getFeature35(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("iPod Movie converter ","Convert VOB, 3GP, ASF, RMVB, MOV, AVI, RM, MPEG, AVCHD, WMV, MKV, DivX, H.264/AVC, and MP4 to iPhone and iPod MPEG-4 video. "));
		set.add(buildFeature("Maximum Conversion Speed","Supports multi-core CPU which means that you can take the benefit of your multi-core system when changing iPod movies and videos"));
		set.add(buildFeature("iPod Music Converter","Convert on trend music like AIFF, MP3, AAC, WMA, WAV, M4A, CUE, APE to iPhone and iPod AIFF, MP3, AAC, WAV, M4A. Supports CD decoding."));
		set.add(buildFeature("Key Specifications:","Works well with all iPod types including iPod touch, iPod shuffle, iPod nano (5th Gen), iPod classic<br/>Supports multithreading and group conversion that allows several files at the same time<br/>Allows you to convert a segment from audio or video file; divide a huge file into several so you can place it in your iPod<br/>Add in output parameters as well as codec, resolution quality, audio channel, sample rate, frame rate, and bit rate<br/>Convert a source file into several iPod video settings at a time<br/>Automatically shuts down, exit, and hibernate your CPU, once the task is done"));
		set.add(buildFeature("What's new in 2.11?","Automatically shuts down your computer once conversion is finished. "));
		return set;
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
	private static Set<Feature> getFeature37(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("iPad High Definition Converter","Convert High Definition videos into iPad 720p H.264, supported high definition setting includes AVCHD*.mts,*m2ts, AVI HD, WMV HD, Quick Time HD, MPEG-2 TS HD, MPEG-4 TS HD, H.264/MPEG-4 AVC. "));
		set.add(buildFeature("Supports Mutlti-core CPU","You can maximize the use of your multi-core processor by turning files using all cores for instant conversion."));
		set.add(buildFeature("iPad Music converter","Get audios from videos and turn them into iPad AIFF, AAC, WAV, MP3 audio; just turn all well known audio setting into iPad audio format."));
		set.add(buildFeature("iPad Video Converter ","iPad video converter allows you to convert just any popular video setting to MOV video, MPEG4, and H.264. "));
		set.add(buildFeature("Major Features","    Multilingual interfaces<br/>    Modify a variety of output parameters: frame rate, channel codec, aspect ratio, bit rate, and many more<br/>    Automatically divide files into numerous parts by setting the start time and the duration period<br/>    Allows you to have conversion outlines with optimized output parameters to perfectly sync your iPad<br/>    Watch video and extract from it<br/>    Output multiple setting in one file<br/>"));
		set.add(buildFeature("OS Supported: ","Mac OS X v10.5 - 10.6, Snow Leopard support"));
		set.add(buildFeature("Hardware Requirements: ","800MHz Intel or AMD CPU, or above;<br/>512MB RAM or more."));
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
	private static int i;
	private static Feature buildFeature(String title,String content){
		Feature f = new Feature();
		f.setTitle(title);
		f.setContent(content);
		f.setOrderNum(i++);
		return f;
	}
	private static Set<Feature> getFeature(Product p){
		Set<Feature> set = new TreeSet<Feature>();
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		set.add(buildFeature("",""));
		return set;
	}
}
