package com.githrd.deli.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * @author 이용현
 * @since	2022/06/11
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 					2022/06/11	- 담당자 : 이용현
 * 									메인 컨트롤러 제작
 */
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.githrd.deli.dao.*;
import com.githrd.deli.vo.YonghyunVO;

@Controller
public class MainController {
	@Autowired
	YonghyunDao yDao;
	
	@RequestMapping("/main.dlv")
	public ModelAndView getMain(ModelAndView mv, HttpSession session) {
		String id = (String) session.getAttribute("SID");
		List<YonghyunVO> topList = yDao.topBoard();
		mv.addObject("TLIST", topList);
		if(id != null) {
			YonghyunVO yVO = yDao.myInfo(id);
			List<YonghyunVO> list = yDao.myFrined(id);
			List<YonghyunVO> alist = yDao.aplFrined(id);
			mv.addObject("MYINFO", yVO);
			mv.addObject("MYFRIEND", list);
			mv.addObject("AFRIEND", alist);
		}
		mv.setViewName("remain");
		return mv;
	}
	
	
}
