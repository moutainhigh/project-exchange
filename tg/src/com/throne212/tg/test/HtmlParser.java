package com.throne212.tg.test;

import java.net.URL;
import java.util.regex.Pattern;


import org.apache.log4j.Logger;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.beans.LinkBean;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.OrFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.HeadTag;
import org.htmlparser.tags.HeadingTag;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.InputTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.OptionTag;
import org.htmlparser.tags.SelectTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.tags.TitleTag;
import org.htmlparser.util.NodeIterator;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.HtmlPage;
import org.htmlparser.visitors.NodeVisitor;
import org.htmlparser.visitors.ObjectFindingVisitor;

public class HtmlParser{

  private static final Logger logger = Logger.getLogger(HtmlParser.class);

  public static void main(String[] args) {
	  String str = "<a class=\"deal-today-link\" href=\"/team.php?id=117\">今日抢购：</a>【爱心1元捐】新一波电影风暴来袭！只需19元可获正天影城观影券1张+影城全年五折卡一张+180元合家欢大礼包。注意啦！观影券看任意大片含3D不再加钱（VIP除外）";
	  System.out.println(str.replaceAll("<a class=\"deal-today-link\" href=\"/team.php\\?id=[0-9]{1,}\">今日抢购：</a>", ""));
	  //new HtmlParser().testH1();
  }
  
  public void testH1(){
	  try {
	      NodeFilter filter = new TagNameFilter("H1");
	      Parser parser = new Parser();
	      //parser.setURL("http://www.google.com");
	      parser.setInputHTML("<h1><a class=\"deal-today-link\" href=\"/team.php?id=116\">今日抢购：</a>【爱心1元捐】杰士邦“性感前束”安全套！1盒12片，市场价45元，章鱼团秒杀价只需22.5元，一片还不到2元钱！买就送世界杯限量版开瓶器！买2盒就包邮！团一盒杰士邦，团一份激情与浪漫！</h1>");
	      parser.setEncoding(parser.getEncoding());
	      NodeList list = parser.extractAllNodesThatMatch(filter);
	      for (int i = 0; i < list.size(); i++) {
	    	  org.htmlparser.tags.HeadingTag headingTag = (HeadingTag) list.elementAt(i);
	    	  logger.fatal("testNodeFilter() " + list.elementAt(i).toHtml());
	    	  logger.info("text:\t" + headingTag.getChildrenHTML());
	    	  Pattern pattern = Pattern.compile("<a class=\"deal-today-link\" href=\"/team.php\\?id=116\">今日抢购：</a>");
	    	  System.out.println(pattern.matcher(headingTag.getChildrenHTML()).find());
	    	  String rst = headingTag.getChildrenHTML().replaceAll(pattern.pattern(), "");
	    	  logger.info("rst:\t"+rst);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
  }
  
  /*
   * 测试ObjectFindVisitor的用法
   */
  public void testImageVisitor() {
    try {
      ImageTag imgLink;
      ObjectFindingVisitor visitor = new ObjectFindingVisitor(ImageTag.class);
      Parser parser = new Parser();
      parser.setInputHTML("<p align=\"center\">	<a href=\"http://www.autohome.com.cn/img/?img=2010/8/12/12-15-20-32-656510419.jpg\" target=\"_blank\"><img alt=\"明年登陆国内 曝标致508海外无伪装谍照 汽车之家\" border=\"1\" src=\"http://img.autohome.com.cn/2010/8/12/12-15-20-32-15315446.jpg\" style=\"border-color: black;\" title=\"明年登陆国内 曝标致508海外无伪装谍照 汽车之家\" /></a></p>");
      //parser.setURL("http://localhost:8080/Auto/news/1281754807390.html");
      parser.setEncoding(parser.getEncoding());
      parser.visitAllNodesWith(visitor);
      Node[] nodes = visitor.getTags();
      for (int i = 0; i < nodes.length; i++) {
        imgLink = (ImageTag) nodes[i];
        logger.fatal("testImageVisitor() ImageURL = " + imgLink.getImageURL());
        logger.fatal("testImageVisitor() ImageLocation = " + imgLink.extractImageLocn());
        logger.fatal("testImageVisitor() SRC = " + imgLink.getAttribute("SRC"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试TagNameFilter用法
   */
  public void testNodeFilter() {
    try {
      NodeFilter filter = new TagNameFilter("IMG");
      Parser parser = new Parser();
      parser.setURL("http://www.google.com");
      parser.setEncoding(parser.getEncoding());
      NodeList list = parser.extractAllNodesThatMatch(filter);
      for (int i = 0; i < list.size(); i++) {
        logger.fatal("testNodeFilter() " + list.elementAt(i).toHtml());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

  }

  /*
   * 测试NodeClassFilter用法
   */
  public void testLinkTag() {
    try {

      NodeFilter filter = new NodeClassFilter(LinkTag.class);
      Parser parser = new Parser();
      parser.setURL("http://www.google.com");
      parser.setEncoding(parser.getEncoding());
      NodeList list = parser.extractAllNodesThatMatch(filter);
      for (int i = 0; i < list.size(); i++) {
        LinkTag node = (LinkTag) list.elementAt(i);
        logger.fatal("testLinkTag() Link is :" + node.extractLink());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

  }

  /*
   * 测试<link href=" text=’text/css’ rel=’stylesheet’ />用法
   */
  public void testLinkCSS() {
    try {

      Parser parser = new Parser();
      parser.setInputHTML("<head><title>Link Test</title>"
          + "<link href=’/test01/css.css' text='text/css' rel='stylesheet' />"
          + "<link href='/test02/css.css' text='text/css' rel='stylesheet' />" + "</head>"
          + "<body>");
      parser.setEncoding(parser.getEncoding());

      for (NodeIterator e = parser.elements(); e.hasMoreNodes();) {
        Node node = e.nextNode();
        logger.fatal("testLinkCSS()" + node.getText() + node.getClass());

      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试OrFilter的用法
   */
  public void testOrFilter() {
    NodeFilter inputFilter = new NodeClassFilter(InputTag.class);
    NodeFilter selectFilter = new NodeClassFilter(SelectTag.class);

    NodeList nodeList = null;

    try {
      Parser parser = new Parser();
      parser
          .setInputHTML("<head><title>OrFilter Test</title>"
              + "<link href='/test01/css.css' text='text/css' rel='stylesheet' />"
              + "<link href='/test02/css.css' text='text/css' rel='stylesheet' />"
              + "</head>"
              + "<body>"
              + "<input type='text' value='text1′ name='text1′/>"
              + "<input type='text' value='text2′ name='text2′/>"
              + "<select><option id='1′>1</option><option id='2′>2</option><option id='3′></option></select>"
              + "<a href='http://www.yeeach.com'>yeeach.com</a>" + "</body>");

      parser.setEncoding(parser.getEncoding());
      OrFilter lastFilter = new OrFilter();
      lastFilter.setPredicates(new NodeFilter[] { selectFilter, inputFilter });
      nodeList = parser.parse(lastFilter);
      for (int i = 0; i <= nodeList.size(); i++) {
        if (nodeList.elementAt(i) instanceof InputTag) {
          InputTag tag = (InputTag) nodeList.elementAt(i);
          logger.fatal("OrFilter tag name is :" + tag.getTagName() + " ,tag value is:"
              + tag.getAttribute("value"));
        }
        if (nodeList.elementAt(i) instanceof SelectTag) {
          SelectTag tag = (SelectTag) nodeList.elementAt(i);
          NodeList list = tag.getChildren();

          for (int j = 0; j < list.size(); j++) {
            OptionTag option = (OptionTag) list.elementAt(j);
            logger.fatal("OrFilter Option" + option.getOptionText());
          }

        }
      }

    } catch (ParserException e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试对<table><tr><td></td></tr></table>的解析
   */
  public void testTable() {
    Parser myParser;
    NodeList nodeList = null;
    myParser = Parser.createParser("<body> " + "<table id='table1′ >"
        + "<tr><td>1-11</td><td>1-12</td><td>1-13</td>"
        + "<tr><td>1-21</td><td>1-22</td><td>1-23</td>"
        + "<tr><td>1-31</td><td>1-32</td><td>1-33</td></table>" + "<table id='table2′ >"
        + "<tr><td>2-11</td><td>2-12</td><td>2-13</td>"
        + "<tr><td>2-21</td><td>2-22</td><td>2-23</td>"
        + "<tr><td>2-31</td><td>2-32</td><td>2-33</td></table>" + "</body>", "GBK");
    NodeFilter tableFilter = new NodeClassFilter(TableTag.class);
    OrFilter lastFilter = new OrFilter();
    lastFilter.setPredicates(new NodeFilter[] { tableFilter });
    try {
      nodeList = myParser.parse(lastFilter);
      for (int i = 0; i <= nodeList.size(); i++) {
        if (nodeList.elementAt(i) instanceof TableTag) {
          TableTag tag = (TableTag) nodeList.elementAt(i);
          TableRow[] rows = tag.getRows();

          for (int j = 0; j < rows.length; j++) {
            TableRow tr = (TableRow) rows[j];
            TableColumn[] td = tr.getColumns();
            for (int k = 0; k < td.length; k++) {
              logger.fatal("<td>" + td[k].toPlainTextString());
            }

          }

        }
      }

    } catch (ParserException e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试NodeVisitor的用法，遍历所有节点
   */
  public void testVisitorAll() {
    try {
      Parser parser = new Parser();
      parser.setURL("http://www.google.com");
      parser.setEncoding(parser.getEncoding());
      NodeVisitor visitor = new NodeVisitor() {
        public void visitTag(Tag tag) {
          logger.fatal("testVisitorAll()  Tag name is :" + tag.getTagName() + " \n Class is :"
              + tag.getClass());
        }

      };

      parser.visitAllNodesWith(visitor);
    } catch (ParserException e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试对指定Tag的NodeVisitor的用法
   */
  public void testTagVisitor() {
    try {

      Parser parser = new Parser("<head><title>dddd</title>"
          + "<link href='/test01/css.css' text='text/css' rel='stylesheet' />"
          + "<link href='/test02/css.css' text='text/css' rel='stylesheet' />" + "</head>"
          + "<body>" + "<a href='http://www.yeeach.com'>yeeach.com</a>" + "</body>");
      NodeVisitor visitor = new NodeVisitor() {
        public void visitTag(Tag tag) {
          if (tag instanceof HeadTag) {
            logger.fatal("visitTag() HeadTag : Tag name is :" + tag.getTagName()
                + " \n Class is :" + tag.getClass() + "\n Text is :" + tag.getText());
          } else if (tag instanceof TitleTag) {
            logger.fatal("visitTag() TitleTag : Tag name is :" + tag.getTagName()
                + " \n Class is :" + tag.getClass() + "\n Text is :" + tag.getText());

          } else if (tag instanceof LinkTag) {
            logger.fatal("visitTag() LinkTag : Tag name is :" + tag.getTagName()
                + " \n Class is :" + tag.getClass() + "\n Text is :" + tag.getText()
                + " \n getAttribute is :" + tag.getAttribute("href"));
          } else {
            logger.fatal("visitTag() : Tag name is :" + tag.getTagName() + " \n Class is :"
                + tag.getClass() + "\n Text is :" + tag.getText());
          }

        }

      };

      parser.visitAllNodesWith(visitor);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /*
   * 测试HtmlPage的用法
   */
  public void testHtmlPage() {
    String inputHTML = "<html>" + "<head>"
        + "<title>Welcome to the HTMLParser website</title>" + "</head>" + "<body>"
        + "Welcome to HTMLParser" + "<table id='table1′ >"
        + "<tr><td>1-11</td><td>1-12</td><td>1-13</td>"
        + "<tr><td>1-21</td><td>1-22</td><td>1-23</td>"
        + "<tr><td>1-31</td><td>1-32</td><td>1-33</td></table>" + "<table id='table2′ >"
        + "<tr><td>2-11</td><td>2-12</td><td>2-13</td>"
        + "<tr><td>2-21</td><td>2-22</td><td>2-23</td>"
        + "<tr><td>2-31</td><td>2-32</td><td>2-33</td></table>" + "</body>" + "</html>";
    Parser parser = new Parser();
    try {
      parser.setInputHTML(inputHTML);
      parser.setEncoding(parser.getURL());
      HtmlPage page = new HtmlPage(parser);
      parser.visitAllNodesWith(page);
      logger.fatal("testHtmlPage -title is :" + page.getTitle());
      NodeList list = page.getBody();

      for (NodeIterator iterator = list.elements(); iterator.hasMoreNodes();) {
        Node node = iterator.nextNode();
        logger.fatal("testHtmlPage -node  is :" + node.toHtml());
      }

    } catch (ParserException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  /*
   * 测试LinkBean的用法
   */
  public void testLinkBean() {
    Parser parser = new Parser();

    LinkBean linkBean = new LinkBean();
    linkBean.setURL("http://www.google.com");
    URL[] urls = linkBean.getLinks();

    for (int i = 0; i < urls.length; i++) {
      URL url = urls[i];
      logger.fatal("testLinkBean() -url  is :" + url);
    }

  }

}