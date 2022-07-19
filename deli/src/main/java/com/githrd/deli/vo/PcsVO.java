package com.githrd.deli.vo;
/**
 * @author	박찬슬
 * @since	2022/06/30
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 					2022/06/11	- 담당자 : 박찬슬
 * 									회원관련 vo 클래스 제작
 */
import java.text.*;
import java.sql.Time;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PcsVO {
	private int bno, mno, mmno, code, end, rest;
	private double esti;
	private String id, name, kakaoid, pw, mail, tel, addr, dti_addr, oriname, dir, savename,
		city, foodtype, authkey, title, body, larea, marea, sarea, category, rname, sdate;
	private Date jdate;
	private MultipartFile[] file;
	private List<FileVO> list;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMmno() {
		return mmno;
	}
	public void setMmno(int mmno) {
		this.mmno = mmno;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
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
	public String getDti_addr() {
		return dti_addr;
	}
	public void setDti_addr(String dti_addr) {
		this.dti_addr = dti_addr;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFoodtype() {
		return foodtype;
	}
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getLarea() {
		return larea;
	}
	public void setLarea(String larea) {
		this.larea = larea;
	}
	public String getMarea() {
		return marea;
	}
	public void setMarea(String marea) {
		this.marea = marea;
	}
	public String getSarea() {
		return sarea;
	}
	public void setSarea(String sarea) {
		this.sarea = sarea;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		sdate = form.format(jdate);
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
		setSdate();
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
		return "PcsVO [bno=" + bno + ", mno=" + mno + ", mmno=" + mmno + ", code=" + code + ", end=" + end + ", rest="
				+ rest + ", esti=" + esti + ", id=" + id + ", name=" + name + ", kakaoid=" + kakaoid + ", pw=" + pw
				+ ", mail=" + mail + ", tel=" + tel + ", addr=" + addr + ", dti_addr=" + dti_addr + ", oriname="
				+ oriname + ", dir=" + dir + ", savename=" + savename + ", city=" + city + ", foodtype=" + foodtype
				+ ", authkey=" + authkey + ", title=" + title + ", body=" + body + ", larea=" + larea + ", marea="
				+ marea + ", sarea=" + sarea + ", category=" + category + ", rname=" + rname + ", sdate=" + sdate
				+ ", jdate=" + jdate + ", file=" + Arrays.toString(file) + ", list=" + list + "]";
	}
	
}
