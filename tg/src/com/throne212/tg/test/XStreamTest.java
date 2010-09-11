package com.throne212.tg.test;

import com.thoughtworks.xstream.XStream;

public class XStreamTest {
	public static void main(String[] args) {
		XStream xstream = new XStream();
		xstream.alias("person", Person.class);
		xstream.alias("phonenumber", PhoneNumber.class);
//		Person joe = new Person("Joe", "Walnes");
//		joe.setPhone(new PhoneNumber(123, "1234-456"));
//		joe.setFax(new PhoneNumber(123, "9999-999"));
//		String xml = xstream.toXML(joe);
//		System.out.println(xml);
		
		String xml = "<person>"
		  +"<firstname>Joe</firstname>"
		  +"<lastname>Walnes</lastname>"
		  +"<phone>"
		  +"  <code>123</code>"
		  +"  <number>1234-456</number>"
		  +"</phone>"
		  +"<fax>"
		  +"  <code>123</code>"
		  +"  <number>9999-999</number>"
		  +"</fax>"
		  +"</person>";

		Person p = (Person) xstream.fromXML(xml);
		System.out.println(p.getFirstname()+" "+p.getLastname());
	}
}

class Person {
	private String firstname;
	private String lastname;
	private PhoneNumber phone;
	private PhoneNumber fax;

	// ... constructors and methods
	public Person(String firstname, String lastname) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public PhoneNumber getPhone() {
		return phone;
	}

	public void setPhone(PhoneNumber phone) {
		this.phone = phone;
	}

	public PhoneNumber getFax() {
		return fax;
	}

	public void setFax(PhoneNumber fax) {
		this.fax = fax;
	}

}

class PhoneNumber {
	private int code;
	private String number;

	// ... constructors and methods
	public PhoneNumber(int code, String number) {
		super();
		this.code = code;
		this.number = number;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
}