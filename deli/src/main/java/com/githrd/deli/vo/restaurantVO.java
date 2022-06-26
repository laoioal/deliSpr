package com.githrd.deli.vo;

public class restaurantVO {
	
	private String rname,addr;
	private int cname,mcode,restno;
	//cname : 카테고리명
	//mcode : middle area 번호
	
	
	
	public restaurantVO() {}
	
	
	public int getRestno() {
		return restno;
	}


	public void setRestno(int restno) {
		this.restno = restno;
	}


	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getCname() {
		return cname;
	}
	public void setCname(int cname) {
		this.cname = cname;
	}
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}


	@Override
	public String toString() {
		return "restaurantVO [rname=" + rname + ", addr=" + addr + ", cname=" + cname + ", mcode=" + mcode + ", restno="
				+ restno + "]";
	}
	
	
	
	
	
}
