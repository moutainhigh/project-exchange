package com.throne212.tg.test;

import java.util.ArrayList;

import com.throne212.tg.action.FetchAction;
import com.throne212.tg.config.MappingClass;
import com.throne212.tg.config.Parser;
import com.throne212.tg.config.Property;
import com.throne212.tg.config.Value;

public class ActionTest {
	public static void main(String[] args) {
		FetchAction a = new FetchAction();
		MappingClass mapping = new MappingClass();
		mapping.setUrl("http://tg.chengdu.cn");
		mapping.setName("com.throne212.tg.entity.Team");
		mapping.setTable("team");
		mapping.setEncode("UTF-8");
		
		//title
		Property title = new Property("title","java.lang.String");
		title.setName("title");
		title.setType("java.lang.String");
		mapping.setPropertyList(new ArrayList<Property>());
		mapping.getPropertyList().add(title);
		
		Value value = new Value();
		title.setValue(value);
		value.setType("parser");
		
		Parser parser = new Parser();
		parser.setType("h1");
		parser.setExclude("<a class=\"deal-today-link\" href=\"/team.php\\?id=[0-9]{1,}\">今日抢购：</a>");
		parser.setPattern(".*");
		value.setParser(parser);
		
		//price		
		Property price = new Property();
		price.setName("price");
		price.setType("java.lang.double");
		Value priceValue = new Value();
		priceValue.setType("parser");
		priceValue.setParser(parser);
		Parser priceParser = new Parser();
		priceParser.setType("strong");
		priceParser.setExclude("¥");
		priceParser.setPattern("[0-9]{1,}\\.?[0-9]*");
		price.setValue(priceValue);
		priceValue.setParser(priceParser);
		mapping.getPropertyList().add(price);
		
		a.setMappingClass(mapping);
		a.generate();
		
		System.out.println("**********************");
		
		a.fetch();
		
	}
}
