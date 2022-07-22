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
	
	@RequestMapping("/rvWriteProc.dlv")
	public RedirectView rvWriteProc(ModelAndView mv, HttpSession session, RedirectView rv, EunbeeVO eVO) {
		String id = (String)session.getAttribute("SID");
		eVO.setId(id);
		
		session.setAttribute("IDB", eVO.getIdb());
		
		eDao.insEsti(eVO);
		eDao.upEtable(eVO);
		
		rv.setUrl("/deli/review/estiProc.dlv");
		return rv;
	}
	
	@RequestMapping("/estiProc.dlv")
	public ModelAndView estiProc(ModelAndView mv, HttpSession session, RedirectView rv, String idb) {
		idb = (String)session.getAttribute("IDB");
		
		EunbeeVO eVO = eDao.getPoint(idb);
		
		int cpts = eVO.getCpts();
		double spts = eVO.getSpts();
		
		double esti = (2.5 + spts) / (1 + cpts);
		
		eVO.setIdb(idb);
		eVO.setEsti(esti);
		
		eDao.upEsti(eVO);
		
		rv.setUrl("/deli/review/rvList.dlv");
		mv.setView(rv);
		return mv;
	}

}
