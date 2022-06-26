package com.githrd.deli.vo;

public class calculatorVO {
	private String name, address;
	private double distance;
	
	 
	public calculatorVO(String name, String address, double distance) {
		super();
		this.name = name;
		this.address = address;
		this.distance = distance;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	@Override
	public String toString() {
		return "calculatorVO [name=" + name + ", address=" + address + ", distance=" + distance + "]";
	}
	
	
}
