package com.githrd.deli.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EunbeeVO {
	private int bno, ano, cpts;
	private double esti, point, spts;
	private String id, idb, mail, pw, dir, savename, title, sdate, show, eshow;
	private Date wdate;
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public int getAno() {
		return ano;
	}
	
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public double getEsti() {
		return esti;
	}
	
	public void setEsti(double esti) {
		this.esti = esti;
	}
	
	public double getPoint() {
		return point;
	}

	public void setPoint(double point) {
		this.point = point;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getIdb() {
		return idb;
	}

	public void setIdb(String idb) {
		this.idb = idb;
	}

	public String getMail() {
		return mail;
	}
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCpts() {
		return cpts;
	}

	public void setCpts(int cpts) {
		this.cpts = cpts;
	}

	public double getSpts() {
		return spts;
	}

	public void setSpts(double spts) {
		this.spts = spts;
	}

	public Date getWdate() {
		return wdate;
	}
	
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		sdate = form1.format(wdate);
	}
	
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public String getEshow() {
		return eshow;
	}

	public void setEshow(String eshow) {
		this.eshow = eshow;
	}

	@Override
	public String toString() {
		return "EunbeeVO [bno=" + bno + ", ano=" + ano + ", cpts=" + cpts + ", esti=" + esti + ", point=" + point
				+ ", spts=" + spts + ", id=" + id + ", idb=" + idb + ", mail=" + mail + ", pw=" + pw + ", dir=" + dir
				+ ", savename=" + savename + ", title=" + title + ", sdate=" + sdate + ", show=" + show + ", eshow="
				+ eshow + ", wdate=" + wdate + "]";
	}



}
