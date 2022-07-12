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
import com.githrd.deli.service.PayService;
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
	@Autowired
	PayService paSrvc;
	
	//	메뉴판 페이지 폼 보기 처리함수
	@RequestMapping("menu.dlv")
	public ModelAndView menu(ModelAndView mv) {
		
		
		
		mv.setViewName("/menu/menu");
		
		return mv;
	}
	
	
	//	결제전 페이지 폼 보기 처리함수
	@RequestMapping("beforePay.dlv")
	public ModelAndView beforePay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String mname = (String)req.getParameter("mname1");
		String mmprice = (String)req.getParameter("price1");
		int mtprice = Integer.parseInt(mmprice);
		
		paVO.setAmname(mname);
		paVO.setMyprice(mtprice);
		
		
		int cnt = paDao.abnoCnt(paVO.getBno());
			
		int delpay = (paVO.getDelpay() != 0) ? paVO.getDelpay() / cnt : 0;
		paVO.setMtprice(mtprice + delpay);
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("DLP", delpay);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		mv.addObject("MEMBER", kVO);		
		
		mv.setViewName("payment/beforePay");
		
		return mv;
	}
	
	@RequestMapping("payProc.dlv")
	@ResponseBody
	public Map payProc(HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		Map result = new HashMap<String, String>();
		
		System.out.println(paVO);
		
		try {
			paSrvc.insertAllM(paVO);
			result.put("result", "y");
		} catch (Exception e) {
			result.put("result", "n");
		}
		return result;
	}
	
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String amname = (String) req.getParameter("mymenu");
		String mmprice = (String)req.getParameter("amount");
		String rq = (String)req.getParameter("rq");
		
		int mtprice = Integer.parseInt(mmprice);
		System.out.println("paVO" + paVO);
		
		paVO.setAmname(amname);
		paVO.setMyprice(mtprice);
		
		int cnt = paDao.abnoCnt(paVO.getBno());
		
		int delpay = (paVO.getDelpay() != 0) ? paVO.getDelpay() / cnt : 0;
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		
		paVO.setMtprice(mtprice + delpay);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("RQ", rq);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		mv.addObject("MEMBER", kVO);
		mv.addObject("DLP", delpay);
		
		mv.setViewName("payment/afterPay");
		
		return mv;
	}
}
