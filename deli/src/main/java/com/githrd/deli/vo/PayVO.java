package com.githrd.deli.vo;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class PayVO {
	private int membmno, mno, rno, mimg, mprice, mino, olno,  oprice, omprice, quantity, esti, cname, omno, gorder, delpay, cnt, mtprice, myprice, bno, restno, minprice;
	private String mname1, result, membname, membmail, mname, mintro, miname, sname, dir, omenu, rname, addr, tel, stime, ono, sdate, paym, request, amname, id, membaddr, membtel;
	private List<PayVO> menu;
	
	private List<PayVO>[] mmenu;
	
	private int[] orprice;
	private String[] ormname;
	private int[] orq;
	
	
	public int getMinprice() {
		return minprice;
	}
	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}
	public String getMname1() {
		return mname1;
	}
	public void setMname1(String mname1) {
		this.mname1 = mname1;
	}
	public int[] getOrprice() {
		return orprice;
	}
	public void setOrprice(int[] orprice) {
		this.orprice = orprice;
	}
	public String[] getOrmname() {
		return ormname;
	}
	public void setOrmname(String[] ormname) {
		this.ormname = ormname;
	}
	public int[] getOrq() {
		return orq;
	}
	public void setOrq(int[] orq) {
		this.orq = orq;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public List<PayVO> getMenu() {
		return menu;
	}
	public void setMenu(List<PayVO> menu) {
		this.menu = menu;
	}
	public String getMembname() { 
		return membname;
	}
	public void setMembname(String membname) {
		this.membname = membname;
	}
	public String getMembmail() {
		return membmail;
	}
	public void setMembmail(String membmail) {
		this.membmail = membmail;
	}
    
	

	public List<PayVO>[] getMmenu() {
		return mmenu;
	}
	public void setMmenu(List<PayVO>[] mmenu) {
		this.mmenu = mmenu;
	}



	private Time rtime;
	private Date rdate;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getMimg() {
		return mimg;
	}
	public void setMimg(int mimg) {
		this.mimg = mimg;
	}
	public int getMprice() {
		return mprice;
	}
	public void setMprice(int mprice) {
		this.mprice = mprice;
	}
	public int getMino() {
		return mino;
	}
	public void setMino(int mino) {
		this.mino = mino;
	}
	
	public int getMembmno() {
		return membmno;
	}
	public void setMembmno(int membmno) {
		this.membmno = membmno;
	}
	public String getMembaddr() {
		return membaddr;
	}
	public void setMembaddr(String membaddr) {
		this.membaddr = membaddr;
	}
	public String getMembtel() {
		return membtel;
	}
	public void setMembtel(String membtel) {
		this.membtel = membtel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRestno() {
		return restno;
	}
	public void setRestno(int restno) {
		this.restno = restno;
	}
	public int getOlno() {
		return olno;
	}
	public void setOlno(int olno) {
		this.olno = olno;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public int getOmprice() {
		return omprice;
	}
	public void setOmprice(int omprice) {
		this.omprice = omprice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getEsti() {
		return esti;
	}
	public void setEsti(int esti) {
		this.esti = esti;
	}
	public int getCname() {
		return cname;
	}
	public void setCname(int cname) {
		this.cname = cname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMintro() {
		return mintro;
	}
	public void setMintro(String mintro) {
		this.mintro = mintro;
	}
	public String getMiname() {
		return miname;
	}
	public void setMiname(String miname) {
		this.miname = miname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getOmenu() {
		return omenu;
	}
	public void setOmenu(String omenu) {
		this.omenu = omenu;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Time getRtime() {
		return rtime;
	}
	public void setRtime(Time rtime) {
		this.rtime = rtime;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public void setStime() {
		SimpleDateFormat form = new SimpleDateFormat("HH24:mm:ss");
		stime = form.format(rtime);
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
		sdate = form.format(rdate);
	}
	public String getSdate() {
		return stime;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getPaym() {
		return paym;
	}
	public void setPaym(String paym) {
		this.paym = paym;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getOmno() {
		return omno;
	}
	public void setOmno(int omno) {
		this.omno = omno;
	}
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getGorder() {
		return gorder;
	}
	public void setGorder(int gorder) {
		this.gorder = gorder;
	}
	public int getDelpay() {
		return delpay;
	}
	public void setDelpay(int delpay) {
		this.delpay = delpay;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
	public int getMyprice() {
		return myprice;
	}
	public void setMyprice(int myprice) {
		this.myprice = myprice;
	}
	
	
	public int getMtprice() {
		return mtprice;
	}
	public void setMtprice(int mtprice) {
		this.mtprice = mtprice;
	}
	
	public String getAmname() {
		return amname;
	}
	public void setAmname(String amname) {
		this.amname = amname;
	}
	
	
	@Override
	public String toString() {
		return "PayVO [membmno=" + membmno + ", mno=" + mno + ", rno=" + rno + ", mimg=" + mimg + ", mprice=" + mprice
				+ ", mino=" + mino + ", olno=" + olno + ", oprice=" + oprice + ", omprice=" + omprice + ", quantity="
				+ quantity + ", esti=" + esti + ", cname=" + cname + ", omno=" + omno + ", gorder=" + gorder
				+ ", delpay=" + delpay + ", cnt=" + cnt + ", mtprice=" + mtprice + ", myprice=" + myprice + ", bno="
				+ bno + ", restno=" + restno + ", minprice=" + minprice + ", mname1=" + mname1 + ", result=" + result
				+ ", membname=" + membname + ", membmail=" + membmail + ", mname=" + mname + ", mintro=" + mintro
				+ ", miname=" + miname + ", sname=" + sname + ", dir=" + dir + ", omenu=" + omenu + ", rname=" + rname
				+ ", addr=" + addr + ", tel=" + tel + ", stime=" + stime + ", ono=" + ono + ", sdate=" + sdate
				+ ", paym=" + paym + ", request=" + request + ", amname=" + amname + ", id=" + id + ", membaddr="
				+ membaddr + ", membtel=" + membtel + ", menu=" + menu + ", mmenu=" + Arrays.toString(mmenu)
				+ ", orprice=" + Arrays.toString(orprice) + ", ormname=" + Arrays.toString(ormname) + ", orq="
				+ Arrays.toString(orq) + ", rtime=" + rtime + ", rdate=" + rdate + ", getMinprice()=" + getMinprice()
				+ ", getMname1()=" + getMname1() + ", getOrprice()=" + Arrays.toString(getOrprice()) + ", getOrmname()="
				+ Arrays.toString(getOrmname()) + ", getOrq()=" + Arrays.toString(getOrq()) + ", getResult()="
				+ getResult() + ", getMenu()=" + getMenu() + ", getMembname()=" + getMembname() + ", getMembmail()="
				+ getMembmail() + ", getMmenu()=" + Arrays.toString(getMmenu()) + ", getMno()=" + getMno()
				+ ", getRno()=" + getRno() + ", getMimg()=" + getMimg() + ", getMprice()=" + getMprice()
				+ ", getMino()=" + getMino() + ", getMembmno()=" + getMembmno() + ", getMembaddr()=" + getMembaddr()
				+ ", getMembtel()=" + getMembtel() + ", getId()=" + getId() + ", getRestno()=" + getRestno()
				+ ", getOlno()=" + getOlno() + ", getOno()=" + getOno() + ", getOprice()=" + getOprice()
				+ ", getOmprice()=" + getOmprice() + ", getQuantity()=" + getQuantity() + ", getEsti()=" + getEsti()
				+ ", getCname()=" + getCname() + ", getMname()=" + getMname() + ", getMintro()=" + getMintro()
				+ ", getMiname()=" + getMiname() + ", getSname()=" + getSname() + ", getDir()=" + getDir()
				+ ", getOmenu()=" + getOmenu() + ", getRname()=" + getRname() + ", getAddr()=" + getAddr()
				+ ", getTel()=" + getTel() + ", getRtime()=" + getRtime() + ", getStime()=" + getStime()
				+ ", getSdate()=" + getSdate() + ", getRdate()=" + getRdate() + ", getPaym()=" + getPaym()
				+ ", getRequest()=" + getRequest() + ", getOmno()=" + getOmno() + ", getBno()=" + getBno()
				+ ", getGorder()=" + getGorder() + ", getDelpay()=" + getDelpay() + ", getCnt()=" + getCnt()
				+ ", getMyprice()=" + getMyprice() + ", getMtprice()=" + getMtprice() + ", getAmname()=" + getAmname()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
	
	
	
}
