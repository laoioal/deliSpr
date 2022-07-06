package com.githrd.deli.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.dao.PayDao;
import com.githrd.deli.dao.YonghyunDao;
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
	public ModelAndView beforePay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO) {
		String sid = (String) session.getAttribute("SID");
		
		paVO = paDao.selMinfo(paVO);
		paVO = paDao.selPays(paVO.getBno());
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		return mv;
	}
	
	@RequestMapping("payProc.dlv")
	public ModelAndView payProc(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		String view = "/";
		
		 
		
		return mv;
	}
	
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO) {
		String sid = (String) session.getAttribute("SID");
		
		paVO = paDao.selMinfo(paVO);
		paVO = paDao.selPays(paVO.getBno());
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		return mv;
	}
}
