package com.githrd.deli.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.githrd.deli.dao.*;

@Controller
@RequestMapping("/find")
public class EbFind {
	@Autowired
	EunbeeDao eDao;
	
	@RequestMapping("/idFind.dlv")
	public ModelAndView idFind(ModelAndView mv) {
		mv.setViewName("find/idFind");
		return mv;
	}
}
