package com.githrd.deli.controller;

import java.util.*;

import javax.servlet.http.*;


import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.githrd.deli.dao.*;
import com.githrd.deli.service.FileService;
import com.githrd.deli.vo.*;
import com.githrd.deli.util.*;

@Controller
@RequestMapping("/member")
public class PcsController {
	private static final Logger memberLog = LoggerFactory.getLogger(PcsController.class);
	
	@Autowired
	PcsDao PcDao;
	@Autowired
	FileService fSrvc;

	
	// 로그인 폼
	@RequestMapping("/login.dlv")
	public ModelAndView loginForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("member/login");
		return mv;
	}
	// 로그인 처리
	@RequestMapping(path="/loginProc.dlv", method=RequestMethod.POST, params= {"id", "pw"})
	public ModelAndView loginProc(ModelAndView mv, PcsVO pcVO, HttpSession session, RedirectView rv) {
		int cnt = PcDao.getLogin(pcVO);
		
		if(cnt == 1) {
			session.setAttribute("SID", pcVO.getId()); // 로그인 처리
			// 로그처리
			memberLog.info(pcVO.getId() + " 님이 로그인 했습니다.");
			rv.setUrl("/deli/main.dlv");
		} else {
			rv.setUrl("/deli/member/login.dlv");
		}
		mv.setView(rv);
		
		return mv;
	}
	
	// 로그아웃 처리
	@RequestMapping("logout.dlv")
	public ModelAndView logOut(ModelAndView mv, HttpSession session, String vw, String nowPage) {
		String sid = (String) session.getAttribute("SID");
		session.removeAttribute("SID");
		
		memberLog.info(sid + " 님이 로그아웃 했습니다.");
		
		if(vw == null) {
			vw = "/deli/main.dlv";
		}
		
		if(nowPage != null) {
			mv.addObject("NOWPAGE", nowPage);
		}
		
		mv.addObject("VIEW", vw);
		
		mv.setViewName("member/redirect");
		return mv;
	}
	
	// 글쓰기 폼
	@RequestMapping("/boardWrite.dlv")
	public ModelAndView boardWrite(ModelAndView mv, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		mv.setViewName("member/boardWrite");		
		return mv;
	}

	// 임시 회원정보 폼보기
	@RequestMapping("/myInfo.dlv")
	public ModelAndView infoForm(ModelAndView mv, HttpSession session, RedirectView rv) {
		// 세션에서 id 꺼내오고
		String id = (String) session.getAttribute("SID");
		
		if(id == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		// 데이터 가져오고
		PcsVO PcVO = PcDao.getIdInfo(id);
		
		mv.addObject("DATA", PcVO);
		mv.setViewName("member/myInfo");
		return mv;
	}

	// 회원가입 폼보기
	@RequestMapping("/join.dlv")
	public ModelAndView joinForm(ModelAndView mv, RedirectView rv, HttpSession session) {
		mv.setViewName("member/join");

		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			rv.setUrl("/deil/main.dlv");
			mv.setView(rv);
			return mv;
		}
		return mv;
	}
	
	// 회원가입 처리함수
	@RequestMapping("/joinProc.dlv")
	public ModelAndView joinFroc(ModelAndView mv, RedirectView rv, HttpSession session, PcsVO pcVO, FileVO fVO) {
		// 이미 로그인 되어있는 경우
		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			rv.setUrl("/deil/main.dlv");
			mv.setView(rv);
			return mv;
		}

		try {
			fSrvc.addMemberData(pcVO);
			// 정상적으로 등록작업에 성공한 경우
			session.setAttribute("SID", pcVO.getId());
			
			rv.setUrl("/deli/member/myInfo.dlv");
		} catch(Exception e) {
			// 게시글 등록에 실패한 경우
			// 결과적으로 롤백된 경우....
//			view = "/www/board/boardWrite.blp?nowPage=" + nowPage;
			
			rv.setUrl("/deli/member/join.dlv");
			e.printStackTrace();
		}
		System.out.println("pcVO : " + pcVO);
		System.out.println("fVO : " + fVO);
		
		mv.setView(rv);
		return mv;
	}

	
	@RequestMapping("/delMember.dlv")
	public ModelAndView delMember(ModelAndView mv, String id, RedirectView rv, HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		
		int cnt = PcDao.delMember(id);
		
		if(cnt == 1) {
			// 세션에 기억해둔 데이터를 삭제하고
			session.removeAttribute("SID");
			rv.setUrl("/deli/main.dlv");
		} else {
			rv.setUrl("/deli/main.dlv");
		}
		
		memberLog.info("회원 탈퇴 처리 되었습니다.");
		mv.setView(rv);
		return mv;
	}
	
	// 회원정보 수정 폼보기 함수
	@RequestMapping("editInfo")
	public ModelAndView editInfo(ModelAndView mv, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		
		PcsVO PcVO = PcDao.getIdInfo(sid);
		mv.addObject("DATA", PcVO);
		mv.setViewName("/member/editInfo");
		
		return mv;
	}
	
	// 회원정보 수정 처리 함수
	@RequestMapping("editProc")
	public ModelAndView editProc(ModelAndView mv, HttpSession session, RedirectView rv, PcsVO pcVO) {
		String sid = (String) session.getAttribute("SID");
		// 로그인이 되어있지 않은 경우
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		
		try {
			fSrvc.editMemberData(pcVO);
			rv.setUrl("/deli/member/myInfo.dlv");
		} catch(Exception e) {
			rv.setUrl("/deli/member/editInfo.dlv");
			e.printStackTrace();
		}
		
		mv.setView(rv);
		return mv;
	}
	
	// 아이디체크 함수
	@RequestMapping(path="/idCheck.dlv", method=RequestMethod.POST, params="id")
	@ResponseBody
	public Map<String, String> idCheck(String id){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = PcDao.idCnt(id);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
	}
}
