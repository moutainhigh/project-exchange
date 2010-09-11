package com.throne212.tg.test;

import java.lang.reflect.Field;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;
import com.throne212.tg.config.MappingClass;
import com.throne212.tg.config.Property;

public class XStreamConfigTest {
	public static void main(String[] args) {
		XStream xstream = new XStream();
		xstream.alias("mappingclass", MappingClass.class);
		xstream.alias("property", Property.class);
		batchUseAttr(MappingClass.class,xstream);
		batchUseAttr(Property.class,xstream);
		
		MappingClass mapping = new MappingClass();
		mapping.setUrl("http://tg.chengdu.cn");
		mapping.setName("com.throne212.tg.entity.Team");
		mapping.setTable("team");
		
		Property p1 = new Property("aid","java.lang.String");
		Property p2 = new Property("bid","java.lang.String");
		mapping.setPropertyList(new ArrayList<Property>());
		mapping.getPropertyList().add(p1);
		mapping.getPropertyList().add(p2);
		
		String xml = xstream.toXML(mapping);
		System.out.println(xml);
		
	}
	private static void batchUseAttr(Class clazz,XStream xstream){
		Field[] fs = clazz.getDeclaredFields();
		for(Field f : fs){
			if(f.getType().getName().equals(String.class.getName())){
				xstream.useAttributeFor(clazz,f.getName());
			}
		}
	}
}

