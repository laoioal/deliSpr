package com.githrd.deli.vo;

import java.sql.Date;

public class faqVO {
	private int no;
	private String id, pw, title, content,message;
	private Date wdate;
	
	public faqVO() {
	}
	public faqVO(String id, String pw, String title, String content) {
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	@Override
	public String toString() {
		return "faqVO [no=" + no + ", id=" + id + ", pw=" + pw + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + "]";
	}
	
	
	

}
