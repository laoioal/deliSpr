package com.githrd.deli.vo;


public class memberVO {
	private String id,addr;

	public memberVO() {}
	
	public memberVO(String id, String addr) {
		super();
		this.id = id;
		this.addr = addr;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	

}
