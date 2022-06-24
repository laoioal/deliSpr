package com.githrd.deli.controller;

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
	PayDao pDao;
	@Autowired
	YonghyunDao yDao;
	
	@RequestMapping("beforePay")
	public ModelAndView beforePay(ModelAndView mv, HttpSession session, PayVO pVO, YonghyunVO yVO) {
		String sid = (String) session.getAttribute("SID");
		
		
		
		return mv;
	}
	
	
}
