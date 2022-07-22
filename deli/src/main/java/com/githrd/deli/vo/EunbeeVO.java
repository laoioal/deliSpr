package com.githrd.deli.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EunbeeVO {
	private int ano, cpts;
	private double esti, nesti, point, spts;
	private String bno, id, idb, mail, pw, npw, dir, savename, title, sdate, show, eshow;
	private Date wdate;
	

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
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
	
	public double getNesti() {
		return nesti;
	}

	public void setNesti(double nesti) {
		this.nesti = nesti;
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
	
	public String getNpw() {
		return npw;
	}

	public void setNpw(String npw) {
		this.npw = npw;
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
		setSdate();
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(wdate);
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
		return "EunbeeVO [ano=" + ano + ", cpts=" + cpts + ", esti=" + esti + ", nesti=" + nesti + ", point=" + point
				+ ", spts=" + spts + ", bno=" + bno + ", id=" + id + ", idb=" + idb + ", mail=" + mail + ", pw=" + pw
				+ ", npw=" + npw + ", dir=" + dir + ", savename=" + savename + ", title=" + title + ", sdate=" + sdate
				+ ", show=" + show + ", eshow=" + eshow + ", wdate=" + wdate + "]";
	}

}
