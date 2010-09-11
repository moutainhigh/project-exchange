package com.throne212.tg.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.PrototypicalNodeFactory;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.HeadingTag;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;
import org.htmlparser.visitors.ObjectFindingVisitor;

import com.thoughtworks.xstream.XStream;
import com.throne212.tg.common.JdbcUtil;
import com.throne212.tg.common.WebConstants;
import com.throne212.tg.config.MappingClass;
import com.throne212.tg.config.Parser;
import com.throne212.tg.config.Property;
import com.throne212.tg.config.Value;
import com.throne212.tg.tag.StrongTag;

public class FetchAction {

	private XStream xstream = new XStream();

	public FetchAction() {
		xstream.alias("mappingclass", MappingClass.class);
		xstream.alias("property", Property.class);
		xstream.alias("value", Value.class);
		xstream.alias("parser", Parser.class);
		batchUseAttr(MappingClass.class, xstream);
		batchUseAttr(Property.class, xstream);
	}

	public String fetch() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String xmlpath = WebConstants.xmlpath;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(xmlpath + File.separator + mappingClass.getName() + ".xml");
			mappingClass = (MappingClass) xstream.fromXML(new InputStreamReader(fis, "UTF-8"));
			List<Object> values = new ArrayList<Object>();
			StringBuffer paramsStr = new StringBuffer();
			StringBuffer wenhaoStr = new StringBuffer();
			for (Property prop : mappingClass.getPropertyList()) {
				Value value = prop.getValue();
				Parser parser = value.getParser();
				Object txt = null;
				if ("key".equals(value.getType())) {// 主键解析，取表主键的最大值+1
					String sql = "select max(" + prop.getName() + ") from " + mappingClass.getTable();
					conn = JdbcUtil.getConn();
					ps = conn.prepareStatement("use " + mappingClass.getDatabase());
					ps.execute();
					ps.close();

					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					if (rs.next()) {
						long max = rs.getLong(1);
						System.out.println("主键，当前最大值为：" + max);
						txt = max + 1;
					}
					JdbcUtil.close(conn, ps, rs);
				} else if ("const".equals(value.getType())) {// 常量
					txt = prop.getValue().getData();
				} else if ("parser".equals(value.getType())) {
					if ("h1".equalsIgnoreCase(parser.getType())) {
						txt = parseH1(mappingClass.getUrl(), mappingClass.getEncode(), parser);
						System.out.println("[h1结果]" + txt);
					} else if ("strong".equalsIgnoreCase(parser.getType())) {
						txt = parseStrong(mappingClass.getUrl(), mappingClass.getEncode(), parser, parser.getIndex());
						System.out.println("[strong结果]" + txt);
					} else if ("td".equalsIgnoreCase(parser.getType())) {
						txt = parseTd(mappingClass.getUrl(), mappingClass.getEncode(), parser, parser.getIndex());
						System.out.println("[td结果]" + txt);
					} else if ("img".equalsIgnoreCase(parser.getType())) {
						txt = parseImg(mappingClass.getUrl(), mappingClass.getEncode(), parser, parser.getIndex());
						System.out.println("[img结果]" + txt);
					}
				}
				values.add(txt);
				paramsStr.append("`" + prop.getName() + "`,");
				wenhaoStr.append("?,");
			}
			if (paramsStr.charAt(paramsStr.length() - 1) == ',') {
				paramsStr.deleteCharAt(paramsStr.length() - 1);
				wenhaoStr.deleteCharAt(wenhaoStr.length() - 1);
			}
			String sql = "insert into " + mappingClass.getTable() + "(" + paramsStr + ") values(" + wenhaoStr + ")";
			System.out.println("sql=" + sql);
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use " + mappingClass.getDatabase());
			ps.execute();
			ps.close();

			ps = conn.prepareStatement(sql);
			int i = 1;
			for (Object obj : values) {
				ps.setObject(i++, obj);
				System.out.println("val=[" + obj + "]");
			}
			int rst = ps.executeUpdate();
			System.out.println("rst=" + rst);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			JdbcUtil.close(conn, ps, rs);
		}
		return "fetch_succ";
	}

	public String parseH1(String url, String encode, Parser p) {
		try {
			NodeFilter filter = new TagNameFilter("H1");
			org.htmlparser.Parser parser = new org.htmlparser.Parser();
			// parser.setURL("http://www.google.com");
			parser.setURL(url);
			parser.setEncoding(encode);
			NodeList list = parser.extractAllNodesThatMatch(filter);
			for (int i = 0; i < list.size(); i++) {
				org.htmlparser.tags.HeadingTag headingTag = (HeadingTag) list.elementAt(i);
				String txt = headingTag.getChildrenHTML();
				if (p.getExclude() != null)
					txt = txt.replaceAll(p.getExclude(), "");
				if (p.getPattern() != null) {
					Pattern pattern = Pattern.compile(p.getPattern());
					Matcher m = pattern.matcher(txt);
					if (m.find()) {
						return m.group();
					}
				} else
					return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static NodeFilter strongFilter = new NodeFilter() {
		public boolean accept(Node node) {
			if (node instanceof StrongTag)
				return true;
			return false;
		}
	};

	public String parseStrong(String url, String encode, Parser p, int index) {
		try {
			org.htmlparser.Parser parser = new org.htmlparser.Parser();
			parser.setURL(url);
			parser.setEncoding(encode);

			PrototypicalNodeFactory factory = new PrototypicalNodeFactory();
			factory.registerTag(new StrongTag());
			parser.setNodeFactory(factory);

			NodeList list = parser.extractAllNodesThatMatch(strongFilter);
			for (int i = 0; i < list.size(); i++) {
				if (i < index)
					continue;
				Node node = list.elementAt(i);
				StrongTag strongTag = (StrongTag) node;
				String txt = strongTag.getChildrenHTML();
				if (p.getExclude() != null) {
					txt = txt.replaceAll(p.getExclude(), "");
				}
				if (p.getPattern() != null) {
					Pattern pattern = Pattern.compile(p.getPattern());
					Matcher m = pattern.matcher(txt);
					if (m.find()) {
						return m.group();
					}
				} else
					return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String parseTd(String url, String encode, Parser p, int index) {
		try {
			NodeFilter filter = new TagNameFilter("TD");
			org.htmlparser.Parser parser = new org.htmlparser.Parser();
			// parser.setURL("http://www.google.com");
			parser.setURL(url);
			parser.setEncoding(encode);
			NodeList list = parser.extractAllNodesThatMatch(filter);
			for (int i = 0; i < list.size(); i++) {
				if (i < index)
					continue;
				org.htmlparser.tags.TableColumn headingTag = (TableColumn) list.elementAt(i);
				String txt = headingTag.getChildrenHTML();
				if (p.getExclude() != null)
					txt = txt.replaceAll(p.getExclude(), "");
				if (p.getPattern() != null) {
					Pattern pattern = Pattern.compile(p.getPattern());
					Matcher m = pattern.matcher(txt);
					if (m.find()) {
						return m.group();
					}
				} else
					return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String parseImg(String url, String encode, Parser p, int index) {
		try {
			ImageTag imgLink;
			ObjectFindingVisitor visitor = new ObjectFindingVisitor(ImageTag.class);
			org.htmlparser.Parser parser = new org.htmlparser.Parser();
			parser.setURL(url);
			parser.setEncoding(encode);
			parser.visitAllNodesWith(visitor);
			Node[] nodes = visitor.getTags();
			for (int i = 0; i < nodes.length; i++) {
				if (i < index)
					continue;
				imgLink = (ImageTag) nodes[i];
				String txt = imgLink.getAttribute("SRC");
				return txt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private MappingClass mappingClass;

	public String generate() {
		String xmlpath = WebConstants.xmlpath;
		Writer writer = null;
		try {
			writer = new PrintWriter(xmlpath + File.separator + mappingClass.getName() + ".xml", "UTF-8");
			xstream.toXML(this.mappingClass, writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null)
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return "generate_succ";
	}

	private static void batchUseAttr(Class clazz, XStream xstream) {
		Field[] fs = clazz.getDeclaredFields();
		for (Field f : fs) {
			if (f.getType().getName().equals(String.class.getName())) {
				xstream.useAttributeFor(clazz, f.getName());
			}
		}
	}

	public MappingClass getMappingClass() {
		return mappingClass;
	}

	public void setMappingClass(MappingClass mappingClass) {
		this.mappingClass = mappingClass;
	}

	public static void main(String[] args) {

	}

}
