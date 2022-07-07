package com.githrd.deli.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MembVO {
	private int mno;
	private String name, id, kakaoid, pw, mail, tel, addr, sdate;
	private Date jdate;
	public int getMno() {
		return mno; 
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKakaoid() {
		return kakaoid;
	}
	public void setKakaoid(String kakaoid) {
		this.kakaoid = kakaoid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		form.format(jdate);
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
		setSdate();
	}
	@Override
	public String toString() {
		return "MembVO [mno=" + mno + ", name=" + name + ", id=" + id + ", kakaoid=" + kakaoid + ", pw=" + pw
				+ ", mail=" + mail + ", tel=" + tel + ", addr=" + addr + ", sdate=" + sdate + ", jdate=" + jdate
				+ ", getMno()=" + getMno() + ", getName()=" + getName() + ", getId()=" + getId() + ", getKakaoid()="
				+ getKakaoid() + ", getPw()=" + getPw() + ", getMail()=" + getMail() + ", getTel()=" + getTel()
				+ ", getAddr()=" + getAddr() + ", getSdate()=" + getSdate() + ", getJdate()=" + getJdate()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
