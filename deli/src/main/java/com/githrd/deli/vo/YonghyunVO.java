package com.githrd.deli.vo;

/**
 * @author	이용현
 * @since	2022/05/24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.24	-	클래스제작
 * 								담당자 : 이용현
 */


import java.text.SimpleDateFormat;
import java.util.Date;

public class YonghyunVO {
	private int rno, bno, bmno, click, end, restno, mprice, fno, myno, frino, mno, nowPage, ck, res;
	private double endalert, esti, pesti;
	private String title, body, sdate, larea, marea, sarea, category, id, endtime, rname, mname, city, area, search, check, aid, kid, name;
	private Date wdate, wenddate;
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBmno() {
		return bmno;
	}
	public void setBmno(int bmno) {
		this.bmno = bmno;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getRestno() {
		return restno;
	}
	public void setRestno(int restno) {
		this.restno = restno;
	}
	public int getMprice() {
		return mprice;
	}
	public void setMprice(int mprice) {
		this.mprice = mprice;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getMyno() {
		return myno;
	}
	public void setMyno(int myno) {
		this.myno = myno;
	}
	public int getFrino() {
		return frino;
	}
	public void setFrino(int frino) {
		this.frino = frino;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getCk() {
		return ck;
	}
	public void setCk(int ck) {
		this.ck = ck;
	}
	public double getEsti() {
		return esti;
	}
	public void setEsti(double esti) {
		this.esti = esti;
	}
	public double getEndalert() {
		return endalert;
	}
	public void setEndalert(double endalert) {
		this.endalert = endalert;
	}
	public double getPesti() {
		return pesti;
	}
	public void setPesti(double pesti) {
		this.pesti = pesti;
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
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		sdate = form1.format(wdate);
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public void setEndtime() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		endtime = form1.format(wenddate);
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getKid() {
		return kid;
	}
	public void setKid(String kid) {
		this.kid = kid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setSdate();
	}

	public Date getWenddate() {
		return wenddate;
	}
	public void setWenddate(Date wenddate) {
		this.wenddate = wenddate;
		setEndtime();
	}
	@Override
	public String toString() {
		return "YonghyunVO [rno=" + rno + ", bno=" + bno + ", bmno=" + bmno + ", click=" + click + ", end=" + end
				+ ", restno=" + restno + ", mprice=" + mprice + ", fno=" + fno + ", myno=" + myno + ", frino=" + frino
				+ ", mno=" + mno + ", nowPage=" + nowPage + ", ck=" + ck + ", res=" + res + ", endalert=" + endalert
				+ ", esti=" + esti + ", pesti=" + pesti + ", title=" + title + ", body=" + body + ", sdate=" + sdate
				+ ", larea=" + larea + ", marea=" + marea + ", sarea=" + sarea + ", category=" + category + ", id=" + id
				+ ", endtime=" + endtime + ", rname=" + rname + ", mname=" + mname + ", city=" + city + ", area=" + area
				+ ", search=" + search + ", check=" + check + ", aid=" + aid + ", kid=" + kid + ", name=" + name
				+ ", wdate=" + wdate + ", wenddate=" + wenddate + "]";
	}





	
	
}
