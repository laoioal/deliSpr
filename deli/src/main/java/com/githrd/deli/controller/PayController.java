package com.githrd.deli.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.dao.PayDao;
import com.githrd.deli.dao.YonghyunDao;
import com.githrd.deli.vo.MembVO;
import com.githrd.deli.vo.PayVO;
import com.githrd.deli.vo.YonghyunVO;

@Controller
@RequestMapping("/payment")
public class PayController {
	@Autowired
	PayDao paDao;
	@Autowired
	YonghyunDao yDao;
	
	//	결제전 페이지 폼 보기 처리함수
	@RequestMapping("beforePay.dlv")
	public ModelAndView beforePay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String mname = (String)req.getParameter("mname1");
		String mmprice = (String)req.getParameter("price1");
		int mtprice = Integer.parseInt(mmprice);
		
		paVO.setAmname(mname);
		paVO.setMtprice(mtprice);
		paVO.setMyprice(mtprice);
		System.out.println(paVO);
		
		
		System.out.println("mname :" + mname);
		
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		MembVO membVO = paDao.selMinfo(sid);
		System.out.println("paVO1 :" + paVO);
		System.out.println("paVO2 :" + membVO);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		
		mv.setViewName("payment/beforePay");
		
		return mv;
	}
	
	@RequestMapping("payProc.dlv")
	@ResponseBody
	public void payProc(HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		String view = "/";
		
		System.out.println(paVO);
		
		
		int odtcnt = paDao.insertOdt(paVO);
		int odlcnt = paDao.insertOdl(paVO);
		System.out.println("odtcnt" + odtcnt);
		System.out.println("odlcnt" + odtcnt);
		
		
	}
	
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO) {
		String sid = (String) session.getAttribute("SID");
		/*
		paVO = paDao.selMinfo(sid);
		paVO = paDao.selPays(paVO);
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		*/
		return mv;
	}
}
