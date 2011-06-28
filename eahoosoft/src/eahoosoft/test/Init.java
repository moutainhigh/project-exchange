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
		c4.setFileName("a");
		s.save(c4);
		
		
		//添加产品
		Product p1 = new Product();
		p1.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-2");
		p1.setCate(c1);
		p1.setDescription("<p><span class=\"clear\">All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons. There is nothing better than converting <b>MPEG2/MPEG-4 TS HD, HD WMV, FLV,AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC and HD</b> than using this video converter. You can convert your HD formatted video to SD, convert different video format like <b>DivX, H.264/AVC, WMV, MPEG-4, and AVI</b>. You can extract pictures and audios from videos. You can make your own video out of pictures with more convenient splitting, clipping, merging, and editing features.</span></p><p style=\"font-size:11px; line-height:20px\"><span class=\"clear\">HD video decoding and encoding like AVI to AVCHD allows you to make amazing high def videos for your High def players. This video converter can convert any of your files to be played on multimedia devices such as Creative Zen, iRiver, iPod, iPad, iPhone, Google Android phones, Apple TV, PS3, PSP, Blackberry phones, Wii, and NDS. </span></p>");
		p1.setDownUrl("VideoConverter.exe");
		p1.setFileName("eahoosoft-video-converter");
		p1.setImage("video-converter-box.jpg");
		p1.setName("Eahoosoft Video Converter");
		p1.setPrice(19.95);
		p1.setScreenShot("videoconverter1.jpg");
		p1.setShortDesc("All-in-one powerful video converter software that allows you to modify and convert audio, video, and animated icons.");
		p1.setShortName("Video Converter");
		p1.setSize("5.20Mb");
		p1.setFeatures(getFeature1(p1));
		p1.setOrderNum(4);
		s.save(p1);
		
		Product p2 = new Product();
		p2.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-20");
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
		p2.setShortDesc("Eahoosoft iPad Converter Suite integrates two useful software, including Eahoosoft DVD to iPad Converter software (iPad DVD software) and iPad Video Converter software. ");
		p2.setSize("5.20Mb");
		p2.setShortName("iPad Converter Suite");
		p2.setOrderNum(1);
		p2.setIndexOrderNum(2);
		p2.setFeatures(getFeature2(p2));
		s.save(p2);
		
		
		Product p3 = new Product();
		p3.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-14");
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
		p3.setSize("15.20Mb");
		p3.setShortName("DVD Converter Suite");
		p3.setOrderNum(1);
		p3.setIndexOrderNum(1);
		p3.setIcon("hot");
		p3.setFeatures(getFeature3(p3));
		s.save(p3);
		
		
		Product p4 = new Product();
		p4.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-7");
		p4.setCate(c4);
		p4.setDescription("<p><strong>Eahoosoft Audio Converter</strong> is a powerful all-in-one professional audio converter for audio conversion, audio extraction, audio CD ripping . Using Eahoosoft Audio Converter, you can convert between different audio formats including <strong>MP3, WMA, WAV, AAC, FLAC, OGG, APE, such as you can convert video to mp3, rip audio from popular video formats including high-definition (HD) videos such as AVI, MPEG, WMV, MP4, FLV, MKV, H.264/MPEG-4 AVC, AVCHD</strong>, rip music CD to different audio formats</p>"+
"<p><strong>Eahoosoft Audio Converter</strong> also allows you to   convert or rip multiple tracks to multiple formats at once, clip audio segments,   merge into a single audio file, and create customized audio files by adjusting a   range of output parameters. Super high audio conversion speed is offered with   multi-core CPU processing and multithreading both supported. </p>");
		p4.setDownUrl("AudioConverter.exe");
		p4.setFileName("eahoosoft-audio-converter");
		p4.setImage("audio-converter-box.jpg");
		p4.setName("Eahoosoft Audio Converter");
		p4.setPrice(18.95);
		p4.setScreenShot("audio-s.jpg");
		p4.setShortDesc("Eahoosoft Audio Converter is a powerful all-in-one professional audio converter for audio conversion, audio extraction, audio CD ripping. ");
		p4.setSize("8.20Mb");
		p4.setShortName("Audio Converter");
		p4.setOrderNum(1);
		p4.setFeatures(getFeature4(p4));
		s.save(p4);
		
		Product p5 = new Product();
		p5.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-35");
		p5.setCate(c3);
		p5.setDescription("<p><span class=\"clear\">All-in-one powerful video converter software for mac that allows you to modify and convert audio, video, and animated icons. There is nothing better than converting <b>MPEG2/MPEG-4 TS HD, HD WMV, FLV,AVCHD (*.m2ts, *.mts), H.264/MPEG-4 AVC and HD</b> than using this video converter. You can convert your HD formatted video to SD, convert different video format like <b>DivX, H.264/AVC, WMV, MPEG-4, and AVI</b>. You can extract pictures and audios from videos. You can make your own video out of pictures with more convenient splitting, clipping, merging, and editing features.</span></p>"+
"<p><span class=\"clear\">HD video decoding and encoding like AVI to AVCHD allows you to make amazing high def videos for your High def players. This video converter can convert any of your files to be played on multimedia devices such as Creative Zen, iRiver, iPod, iPad, iPhone, Google Android phones, Apple TV, PS3, PSP, Blackberry phones, Wii, and NDS. </span></p>");
		p5.setDownUrl("video-converter-mac.dmg");
		p5.setFileName("video-converter-mac");
		p5.setImage("video-converter-box.jpg");
		p5.setName("Eahoosoft Video Converter for Mac");
		p5.setPrice(19.95);
		p5.setScreenShot("video-converter-mac.jpg");
		p5.setShortDesc("All-in-one powerful video converter software for mac that allows you to modify and convert audio, video, and animated icons.");
		p5.setSize("8.20Mb");
		p5.setShortName("Video Converter for Mac");
		p5.setOrderNum(1);
		p5.setIcon("new");
		p5.setFeatures(getFeature5(p5));
		s.save(p5);
		
		Product p6 = new Product();
		p6.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-9");
		p6.setCate(c1);
		p6.setDescription("<p align=\"left\">Eahoosoft DVD Ripper - one of the best dvd ripper software, can rip DVD to <b>MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc</b>. with fast DVD ripping speed and excellent image and sound quality.<br>                    Eahoosoft DVD Ripper support almost all popular portable players, with the Best DVD Ripper software, you can easily rip your DVD to <b>iPad, iPhone 4, PSP, iPod Classic, iPod Touch, iPod Nano, iPhone (3G), iPhone, Zune, Zune 2, Blackberry, Nokia, Creative Zen, Sony Walkman, iRiver PMP, Archos, PS3, Apple TV, Xbox, iPAQ, NDS, Pocket PC, Mobile Phone, etc</b>. It is really outstanding and best DVD Ripper software. <br>                    This Best DVD Ripper provides easy and powerful movie edit functions, such as video trimming, video effecting and video cropping, which cater to customer’s personal need. Compared with other DVD Ripper software, the best DVD Ripper has more settings you can customize, such as customize video and audio bitrate, adjust resolution, set frame rate, etc. <br>                    With Eahoosoft DVD Ripper software, you can get excellent image and luxuriant sound in smaller file size just within a few clicks. </p>");
		p6.setDownUrl("DVDRipper.exe");
		p6.setFileName("eahoosoft-dvd-ripper");
		p6.setImage("dvd-ripper-box.jpg");
		p6.setName("Eahoosoft DVD Ripper");
		p6.setPrice(29.95);
		p6.setScreenShot("dvd-ripper1.jpg");
		p6.setShortDesc("Eahoosoft DVD Ripper - one of the best dvd ripper software, can rip DVD to MP4, H.264, AVI, MP3, WMV, WMA, FLV, MKV, MPEG-1, MPEG-2, 3GP, 3GPP, VOB, DivX, Mov, RM, RMVB, M4A, AAC, WAV, etc. with fast DVD ripping speed and excellent image and sound quality.");
		p6.setSize("8.20Mb");
		p6.setShortName("DVD Ripper");
		p6.setOrderNum(2);
		p6.setIcon("hot");
		p6.setIndexOrderNum(3);
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
		p7.setPrice(14.95);
		p7.setScreenShot("dvd-audio-ripper.jpg");
		p7.setShortDesc("Eahoosoft DVD Audio Ripper is the best DVD Audio Ripper and DVD Audio Extractor, which can rip DVD to the most popular audio formats including MP3, WMA, WAV, OGG, AAC, AC3, AIFF, AU, FLAC and extract the audio from the DVD movie.");
		p7.setSize("8.20Mb");
		p7.setShortName("DVD Audio Ripper");
		p7.setOrderNum(3);
		p7.setIcon(null);
		p7.setFeatures(getFeature7(p7));
		s.save(p7);
		
		Product p8 = new Product();
		p8.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-15");
		p8.setCate(c1);
		p8.setDescription("<p>Eahoosoft MP4 Video Converter is a professional MP4 Video Converter which is designed to convert almost any video formats to MP4 video formats, such as <strong>AVI to MP4, WMV to MP4</strong>. In addition, the MP4 converter provides a powerful way to convert video and audio files to MP3, M4A, AAC,AC3, OGG, WAV, etc.<br>This MP4 Video Converter also provides you with flexible video editing options such as crop video, trim file segment, etc. These features make Eahoosoft MP4 Video Converter the best solution to enjoy your favorite video on iPod, PSP, iPhone, PS3, Zune, Creative Zen Vision, etc.                </p>");
		p8.setDownUrl("MP4VideoConverter.exe");
		p8.setFileName("mp4-video-converter");
		p8.setImage("mp4-video-converter-box.jpg");
		p8.setName("Eahoosoft MP4 Video Converter");
		p8.setPrice(18.95);
		p8.setScreenShot("MP4-Video-Converter.jpg");
		p8.setShortDesc("Eahoosoft MP4 Video Converter is a professional MP4 Video Converter which is designed to convert almost any video formats to MP4 video formats, such as AVI to MP4, WMV to MP4. ");
		p8.setSize("8.20Mb");
		p8.setShortName("MP4 Video Converter");
		p8.setOrderNum(5);
		p8.setIcon(null);
		p8.setFeatures(getFeature8(p8));
		s.save(p8);
		
		Product p9 = new Product();
		p9.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-16");
		p9.setCate(c1);
		p9.setDescription("<p>Eahoosoft AVI Video Converter is one first-class AVI Converter to convert <strong>F4V to AVI, RMVB to AVI, ASF to AVI</strong> etc. and other popular video formats to AVI formats, which is high compatible with different types of Creative Zen, BlackBerry, Wii, PSP, PS3 and other devices. More specially, Eahoosoft AVI Converter supports different converting formats, including MPEG, MPEG-4, RM, WMV, ASF, TS, MKV, AVI, 3GP, MPV, MOD, TOD, FLV, etc to AVI. It goes without saying that it can convert convert M4A, MP3, AC3, AAC, WMA, WAV, OGG, AU, Nut, AIFF, FLAC, AMR, MIDI audio formats and take out the audio from video formats to AAC, AC3, MP3, M4A, MP2, WAV.                 </p>");
		p9.setDownUrl("AVIVideoConverter.exe");
		p9.setFileName("avi-video-converter");
		p9.setImage("avi-video-converter-box.jpg");
		p9.setName("Eahoosoft AVI Video Converter");
		p9.setPrice(19.95);
		p9.setScreenShot("AVI-Video-Converter.jpg");
		p9.setShortDesc("Eahoosoft AVI Video Converter is one first-class AVI Converter to convert F4V to AVI, RMVB to AVI, ASF to AVI etc. and other popular video formats to AVI formats, which is high compatible with different types of Creative Zen, BlackBerry, Wii, PSP, PS3 and other devices. ");
		p9.setSize("9.20Mb");
		p9.setShortName("AVI Video Converter");
		p9.setOrderNum(6);
		p9.setIcon(null);
		p9.setFeatures(getFeature9(p9));
		s.save(p9);
		
		Product p10 = new Product();
		p10.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-17");
		p10.setCate(c1);
		p10.setDescription("<p>Eahoosoft MOV Video Converter is a world-class QuickTime MOV Video Converter which can convert QuickTime MOV to MP4, AVI, WMV, 3GP, FLV, SWF, and all popular video formats,such as <strong>FLV to MOV, RMVB to MOV, MKV to MOV</strong> etc. This MOV Video Converter also assists you extract audio from MOV or convert MP3, MP2, AAC, M4A, AIFF to your MP3 players for your music enjoyment. You can enjoy your MOV video(.mov, .qt) on your PMPs easily with Eahoosoft MOV Video Converter.<br>Furthermore, Eahoosoft MOV Video Converter provides advanced functions such as trim video to get video clips and capture excellent pictures. So this powerful QuickTime MOV Video Converter doubles your enjoyment of watching your unique QuickTime videos. If you are searching for software to convert QuickTime MOV to other video files, Eahoosoft MOV Video Converter will be your best choice.                </p>");
		p10.setDownUrl("MOVVideoConverter.exe");
		p10.setFileName("mov-video-converter");
		p10.setImage("mov-video-converter-box.jpg");
		p10.setName("Eahoosoft MOV Video Converter");
		p10.setPrice(18.95);
		p10.setScreenShot("MOV-Video-Converter.jpg");
		p10.setShortDesc("Eahoosoft MOV Video Converter is a world-class QuickTime MOV Video Converter which can convert QuickTime MOV to MP4, AVI, WMV, 3GP, FLV, SWF, and all popular video formats,such as FLV to MOV, RMVB to MOV, MKV to MOV etc.");
		p10.setSize("10.20Mb");
		p10.setShortName("MOV Video Converter");
		p10.setOrderNum(7);
		p10.setIcon(null);
		p10.setFeatures(getFeature10(p10));
		s.save(p10);
		
		Product p11 = new Product();
		p11.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-18");
		p11.setCate(c1);
		p11.setDescription("<p>Eahoosoft 3GP Video Converter provides an excellent solution for 3GP mobile phone users to convert video files including AVI, DivX, XviD, WMV(Window Media Player), MPEG, MPG, DAT(VCD), RM(RealPlayer), MOV(QuickTime), ASF, VOB(DVD) etc. such as <strong>FLV to 3GP, RM to 3GP, ASF to 3GP</strong>. to 3GP format, including 3GP, 3G2, MPEG4, AMR and so on, for playback on their mobile phones with super fast conversion speed and excellent output quality. Eahoosoft 3GP Video Converter can also convert 3GP to popular video file formats such as 3GP to AVI, MPEG, DivX, WMV, and so on. It can also rip audio from 3gp movie to MP3, WAV, RA, AAC, M4A or vice versa as you like.<br>                </p>");
		p11.setDownUrl("3GPVideoConverter.exe");
		p11.setFileName("3gp-video-converter");
		p11.setImage("3gp-video-converter-box.jpg");
		p11.setName("Eahoosoft 3GP Video Converter");
		p11.setPrice(18.95);
		p11.setScreenShot("3GP-Video-Converter.jpg");
		p11.setShortDesc("Eahoosoft 3GP Video Converter provides an excellent solution for 3GP mobile phone users to convert video files including AVI, DivX, XviD, WMV(Window Media Player), MPEG, MPG, DAT(VCD), RM(RealPlayer), MOV(QuickTime), ASF, VOB(DVD) etc. ");
		p11.setSize("11.20Mb");
		p11.setShortName("3GP Video Converter");
		p11.setOrderNum(8);
		p11.setIcon(null);
		p11.setFeatures(getFeature11(p11));
		s.save(p11);
		
		Product p12 = new Product();
		p12.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-19");
		p12.setCate(c1);
		p12.setDescription("<p>Eahoosoft HD Video Converter enriches your life to enjoy HD videos anywhere. It is a high definition video converter (HD converter) designed to convert HD video to many popular formats, like <strong>AVI to HD, MP4 to HD, FLV to HD</strong>, etc. Advanced in supporting HD video with 720p, 1080p resolution and above, this powerful HD video converter can ensure a smooth HD video conversion with excellent synchronization of audio and video, no image distortion or grains upon output.<br>For professionals and HD video fanatics, the program also facilitates diverse needs to trim HD video length, crop HD video to fit for 4:3 or 16:9 aspect ratio display, adjust video effects in a very handy way. You can also change conversion settings like video bit rate, frame rate, audio channel, etc. to get better outputs.                </p>");
		p12.setDownUrl("HDVideoConverter.exe");
		p12.setFileName("hd-video-converter");
		p12.setImage("hd-video-converter-box.jpg");
		p12.setName("Eahoosoft HD Video Converter");
		p12.setPrice(18.95);
		p12.setScreenShot("HD-Video-Converter.jpg");
		p12.setShortDesc("Eahoosoft HD Video Converter enriches your life to enjoy HD videos anywhere. It is a high definition video converter (HD converter) designed to convert HD video to many popular formats, like AVI to HD, MP4 to HD, FLV to HD, etc. ");
		p12.setSize("12.20Mb");
		p12.setShortName("HD Video Converter");
		p12.setOrderNum(9);
		p12.setIcon(null);
		p12.setFeatures(getFeature12(p12));
		s.save(p12);
		
		Product p13 = new Product();
		p13.setBuyUrl("https://www.regnow.com/softsell/nph-softsell.cgi?item=29237-1");
		p13.setCate(c1);
		p13.setDescription("<p align=\"left\">FLV converter allows you to a have feel of how a professional flash video software is. Moreover, this FLV video converter can also convert various videos to FLV   and SWF flash videos like <strong>convert AVI to FLV, MPEG, WMV, DivX, MP4, MKV,   H.264, RM, RMVB, MOV, XviD, 3GP, ASF, VOB, M4V to FLV</strong>.</p><p>Split output file and customize file size according to your preferences.   Audio files with extensions like MP3, M4A, AC3, AAC, WMA and OGG are also   supported to convert into FLV file.</p>");
		p13.setDownUrl("VideotoFlash.exe");
		p13.setFileName("video-to-flash-converter");
		p13.setImage("video2flash-box.jpg");
		p13.setName("Eahoosoft Video to Flash Converter");
		p13.setPrice(18.95);
		p13.setScreenShot("flashconverter1.jpg");
		p13.setShortDesc("FLV converter allows you to a have feel of how a professional flash video software is. Moreover, this FLV video converter can also convert various videos to FLV and SWF flash videos like convert AVI to FLV, MPEG, WMV, DivX, MP4, MKV, H.264, RM, RMVB, MOV, XviD, 3GP, ASF, VOB, M4V to FLV.");
		p13.setSize("13.20Mb");
		p13.setShortName("Video to Flash Converter");
		p13.setOrderNum(10);
		p13.setIcon(null);
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
		p14.setPrice(18.95);
		p14.setScreenShot("pspconverter1.jpg");
		p14.setShortDesc("PSP video converter is an all in one device that allows you to convert PS3/PSP, PSP-MP4, and PSP-movie in all formats which includes ASF, AVI, RM, MPEG, GIF, WMV, VOB, MP4, 3GP, DivX, FLV, MOV, MKV, AVCHD to H.264/AVC or PSP MP4 setting in various resolutions which includes 1080p, 720p, 480p and convert sound settings like CDA, APE, WMA, CUE, WAV, OGG, AC3, M4A to PSP MP3 setting. such as AVI to PSP, RMVB to PSP etc");
		p14.setSize("14.20Mb");
		p14.setShortName("PSP Video Converter");
		p14.setOrderNum(11);
		p14.setIcon(null);
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
		p15.setPrice(18.95);
		p15.setScreenShot("nokiaconverter1.jpg");
		p15.setShortDesc("Eahoosoft Nokia Video Converter provides perfect solution to convert your favorite video files to Nokia mobile phone format with the best quality of picture and sound. ");
		p15.setSize("15.20Mb");
		p15.setShortName("Nokia Video Converter");
		p15.setOrderNum(12);
		p15.setIcon(null);
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
		p16.setPrice(18.95);
		p16.setScreenShot("DVDto3GP.jpg");
		p16.setShortDesc("Eahoosoft DVD to 3GP Converter is designed for Nokia, Motorola, Sony Ericsson and other mobile phones.");
		p16.setSize("16.20Mb");
		p16.setShortName("DVD to 3GP Converter");
		p16.setOrderNum(13);
		p16.setIcon(null);
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
		p17.setPrice(18.95);
		p17.setScreenShot("DVDtoAVI.jpg");
		p17.setShortDesc("Eahoosoft DVD to AVI Converter is a professional DVD to AVI Converter with super fast conversion speed and excellent quality. It can convert DVD to AVI, H.264 AVI, DivX, XviD, MPEG-1, MPEG-2, and convert DVD to HD AVI, DivX HD, XviD HD efficiently. ");
		p17.setSize("17.20Mb");
		p17.setShortName("DVD to AVI Converter");
		p17.setOrderNum(14);
		p17.setIcon(null);
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
		p18.setPrice(18.95);
		p18.setScreenShot("DVDtoFlash.jpg");
		p18.setShortDesc("Eahoosoft DVD to FLV Converter is a professional DVD to FLV converter with super fast conversion speed and excellent quality. It can convert DVD to FLV, SWF for Youtube, Myspace and Google video,etc.");
		p18.setSize("18.20Mb");
		p18.setShortName("DVD to Flash Converter");
		p18.setOrderNum(15);
		p18.setIcon(null);
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
		p19.setPrice(19.95);
		p19.setScreenShot("DVDtoHD.jpg");
		p19.setShortDesc("Eahoosoft DVD to HD Converter can convert DVD to various HD formats with no limitation.");
		p19.setSize("19.20Mb");
		p19.setShortName("DVD to HD Video Converter");
		p19.setOrderNum(16);
		p19.setIcon(null);
		p19.setFeatures(getFeature19(p19));
		s.save(p19);
		
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
		set.add(buildFeature("Merge several into one ","If you want to merge collected several video files into one you can check the “Merge into one fileoption then merge into one output file. As default the merged file is named after the first selected file (either a title or a chapter). "));
		set.add(buildFeature("Support preview and take favorite image ","You can preview the source video and edited video and compare the before and after files for your further operation. If you like the current image of the video you can use the “Snapshotoption to take a snapshot of the film and save as a picture file. You can select the destination of the picture by clicking the “Preferencesbutton. "));
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
		set.add(buildFeature("Merge into one file ","If you want to merge the selected contents into one file you can check the “Merge into one fileoption. As default the merged file is named after the first selected file (either a title or a chapter). "));
		set.add(buildFeature("Capture your favorite image ","If you like the current image of the video you can use the “Snapshotoption. Just click the “Snapshotbutton the image will be saved and you can click the “Filenext to “Snapshotbutton to open your picture. You can select the destination of the picture by clicking the “Preferencesbutton. "));
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
		set.add(buildFeature("Main Features","Batch multithreading and conversion which allows you to convert many files at a time using one click.<br/>Choose any video cut of a file to convert by just specifying its start and duration period; divide one file into different files<br/>Manually modify multiple audio and video parameters frame rate, bit rate, sample rate, and codec.<br/>Automatic computer shut down feature. With this innovative feature you won’t have to wait at the end of their task<br/>Watch the input file before or during the conversion and the output file at the end of the conversion using a built-in sizable player<br/>"));
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
