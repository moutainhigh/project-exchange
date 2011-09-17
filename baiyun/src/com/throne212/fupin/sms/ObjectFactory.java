package com.throne212.fupin.sms;

import javax.xml.bind.annotation.XmlRegistry;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the com.throne212.fupin.sms package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: com.throne212.fupin.sms
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link SendMessageToMobile }
	 * 
	 */
	public SendMessageToMobile createSendMessageToMobile() {
		return new SendMessageToMobile();
	}

	/**
	 * Create an instance of {@link SendMessageToUser }
	 * 
	 */
	public SendMessageToUser createSendMessageToUser() {
		return new SendMessageToUser();
	}

	/**
	 * Create an instance of {@link SendMessageToMobileResponse }
	 * 
	 */
	public SendMessageToMobileResponse createSendMessageToMobileResponse() {
		return new SendMessageToMobileResponse();
	}

	/**
	 * Create an instance of {@link SendMessageToUserResponse }
	 * 
	 */
	public SendMessageToUserResponse createSendMessageToUserResponse() {
		return new SendMessageToUserResponse();
	}

}
