package com.githrd.deli.vo;

public class categoryVO {
	private int code;
	private String foodtype;

	
	
	public categoryVO() {
	}

	public categoryVO(int code, String foodtype) {
		this.code = code;
		this.foodtype = foodtype;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	
	
	
}
