package kr.co.bit.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class AlertMessage {
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		System.out.println(message);
		try {
			message = URLDecoder.decode(message, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(message);
		this.message = 
			"<script type=\"text/javascript\">alert('"+message+"')</script>";
	}	
}
