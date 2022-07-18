package com.githrd.deli.vo;

public class adminVO {
	private String id, pw, error;
	
	
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	//public adminVO() {};
	public adminVO(String id, String pw){
		this.id = id;
		this.pw = pw;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	@Override
	public String toString() {
		return "adminVO [id=" + id + ", pw=" + pw + ", error=" + error + "]";
	}
	
}
