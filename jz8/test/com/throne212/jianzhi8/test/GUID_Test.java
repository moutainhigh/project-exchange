package com.throne212.jianzhi8.test;

import java.util.UUID;

public class GUID_Test {

	public static void main(String[] args) {
		UUID uuid = UUID.randomUUID(); 
		Long id = uuid.getMostSignificantBits();
		System.out.println(uuid.toString());
		System.out.println(id);
	}
	
}
