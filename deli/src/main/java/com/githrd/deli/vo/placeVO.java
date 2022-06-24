package com.githrd.deli.vo;


public class placeVO {
	private String name, address;
	private double pickuplat,pickuplon;
	
	
	public placeVO() {}
	public placeVO(String name, String address, double pickuplat, double pickuplon) {
		super();
		this.name = name;
		this.address = address;
		this.pickuplat = pickuplat;
		this.pickuplon = pickuplon;
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
	public double getPickuplat() {
		return pickuplat;
	}
	public void setPickuplat(double pickuplat) {
		this.pickuplat = pickuplat;
	}
	public double getPickuplon() {
		return pickuplon;
	}
	public void setPickuplon(double pickuplon) {
		this.pickuplon = pickuplon;
	}
	
	
	
}

