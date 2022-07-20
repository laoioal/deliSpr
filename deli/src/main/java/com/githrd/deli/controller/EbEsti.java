package com.githrd.deli.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.githrd.deli.dao.*;
import com.githrd.deli.vo.*;

@Controller
@RequestMapping("/review")
public class EbEsti {
	@Autowired
	EunbeeDao eDao;
	
	@RequestMapping("/rvList.dlv")
	public ModelAndView rvList(ModelAndView mv, HttpSession session, RedirectView rv, String id) {
		if(session.getAttribute("SID") == null) {
			rv.setUrl("/deli/main.dlv");
			mv.setView(rv);
			return mv;
		}
		
		id = (String)session.getAttribute("SID");
		List<EunbeeVO> list = eDao.getBinfo(id);
		session.setAttribute("RLIST", list);
		
		mv.setViewName("review/rvList");
		return mv;
	}
	
	@RequestMapping("/rvWrite.dlv")
	public ModelAndView rvWrite(ModelAndView mv, HttpSession session, RedirectView rv, EunbeeVO eVO) {
		if(session.getAttribute("SID") == null) {
			rv.setUrl("/deli/main.dlv");
			mv.setView(rv);
			return mv;
		}
		
		String id = (String)session.getAttribute("SID");
		eVO.setId(id);

		List<EunbeeVO> list = eDao.getEinfo(eVO);
		session.setAttribute("LLIST", list);
		
		mv.setViewName("review/rvWrite");
		return mv;
	}

}
