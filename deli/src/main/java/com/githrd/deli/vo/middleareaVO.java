package com.githrd.deli.vo;

public class middleareaVO {
	private String city;
	private int code;
	
	public middleareaVO() {}
	public middleareaVO(String city, int code) {
		super();
		this.city = city;
		this.code = code;
	}

	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "middleareaVO [city=" + city + ", code=" + code + "]";
	}

	
	
	
}
