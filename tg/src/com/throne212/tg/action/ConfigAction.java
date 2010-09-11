package com.throne212.tg.action;

import java.io.File;
import java.util.Map;
import java.util.TreeMap;

import com.throne212.tg.common.WebConstants;

public class ConfigAction {
	public static void main(String[] args) {
		new ConfigAction().show();
	}

	Map<String, String> maps = new TreeMap<String, String>();

	public String show() {
		String xmlpath = WebConstants.xmlpath;
		File dir = new File(xmlpath);
		if (dir.isDirectory()) {
			String[] fileNames = dir.list();
			for (String file : fileNames) {
				if (file.contains(".xml")) {
					String name = file.substring(0, file.lastIndexOf("."));
					maps.put(name, file);
				}
			}
		}
		return "config_show";
	}

	public Map<String, String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}
}
