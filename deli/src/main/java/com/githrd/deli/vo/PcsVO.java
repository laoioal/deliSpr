package com.githrd.deli.vo;

import java.text.*;
import java.sql.Time;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PcsVO {
	private int mno;
	private double esti;
	private String id, name, kakaoid, pw, mail, tel, addr, sdate, oriname, dir, savename;
	private Date jdate;
	private MultipartFile[] file;
	private List<FileVO> list;
	
	
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public List<FileVO> getList() {
		return list;
	}
	public void setList(List<FileVO> list) {
		this.list = list;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public double getEsti() {
		return esti;
	}
	public void setEsti(double esti) {
		this.esti = esti;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");;
		sdate = form.format(jdate);
		
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	@Override
	public String toString() {
		return "PcsVO [mno=" + mno + ", esti=" + esti + ", id=" + id + ", name=" + name + ", kakaoid=" + kakaoid
				+ ", pw=" + pw + ", mail=" + mail + ", tel=" + tel + ", addr=" + addr + ", sdate=" + sdate
				+ ", oriname=" + oriname + ", dir=" + dir + ", savename=" + savename + ", jdate=" + jdate + ", file="
				+ Arrays.toString(file) + ", list=" + list + "]";
	}


}
