package com.githrd.deli.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import java.text.*;

/**
 * @author	박찬슬
 * @since	2022/05/24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.24	-	클래스제작
 * 								담당자 : 박찬슬
 */

public class FileVO {
	private int ano, fno, amno, rno, cnt;
	private long len;
	private String id, oriname, savename, dir, sdate;
	private Date wdate;
	private MultipartFile[] file;
	private List<FileVO> list;
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getAmno() {
		return amno;
	}
	public void setAmno(int amno) {
		this.amno = amno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일 HH24:mm:ss");
		sdate = form.format(wdate);
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
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
	@Override
	public String toString() {
		return "FileVO [ano=" + ano + ", fno=" + fno + ", amno=" + amno + ", rno=" + rno + ", cnt=" + cnt + ", len="
				+ len + ", id=" + id + ", oriname=" + oriname + ", savename=" + savename + ", dir=" + dir + ", sdate="
				+ sdate + ", wdate=" + wdate + ", file=" + Arrays.toString(file) + ", list=" + list + "]";
	}
	

}