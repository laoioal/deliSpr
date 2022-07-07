package com.githrd.deli.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		
		mv.setViewName("payment/beforePay");
		
		return mv;
	}
	
	@RequestMapping("payProc.dlv")
	@ResponseBody
	public Map payProc(HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		Map result = new HashMap<String, String>();
		
		System.out.println(paVO);
		
		
		int odtcnt = paDao.insertOdt(paVO);
		int odlcnt = paDao.insertOdl(paVO);
		int odmcnt = paDao.insertOdm(paVO);
		if(odtcnt != 1) {
			System.out.println("오더 태스크 문제");
			System.out.println("odtcnt" + odtcnt); 
			result.put("result", "n");
		} else if(odlcnt != 1) {
			System.out.println("오더 리스트 문제");
			System.out.println("odlcnt" + odlcnt); 
			result.put("result", "n");
		} else if(odmcnt != 1) {
			System.out.println("오더 메뉴 문제");
			System.out.println("odmcnt" + odmcnt); 
			result.put("result", "n");
		}
		result.put("result", "y");

		return result;
	}
	
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String amname = (String) req.getParameter("mymenu");
		String mmprice = (String)req.getParameter("price1");
		int mtprice = Integer.parseInt(mmprice);
		System.out.println("paVO" + paVO);
		
		paVO.setAmname(amname);
		paVO.setMtprice(mtprice);
		paVO.setMyprice(mtprice);
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		
		mv.setViewName("payment/afterPay");
		
		return mv;
	}
}
