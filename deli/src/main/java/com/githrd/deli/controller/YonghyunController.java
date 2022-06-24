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
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.deli.dao.*;
import com.githrd.deli.service.YonghyunService;
import com.githrd.deli.util.*;
import com.githrd.deli.vo.*;

@Controller
@RequestMapping("/board")
public class YonghyunController {
	@Autowired
	YonghyunDao yDao;
	@Autowired
	YonghyunService ySrvc;
	
	// 게시판 리스트 불러오는 함수
	@RequestMapping("/boardList.dlv")
	public ModelAndView getBoardList(ModelAndView mv, PageUtil page) {

		if(page.getCcheck() != null && !page.getCcheck().equals("")) {
			if(!page.getCcheck().equals("writer")) {
				page.setSearch("%" + page.getSearch() + "%");
			}
		}
		int total = yDao.getBoardTotal(page);
		page.setPage(page.getNowPage(), total);
		List<YonghyunVO> list = yDao.getBoardList(page);
		
		mv.addObject("PAGE", page);
		mv.addObject("LIST", list);
		mv.setViewName("board/boardList");
		return mv;
	}
	
	// 게시판 세부내용 불러오는 함수
	@RequestMapping("/boardForm.dlv")
	public ModelAndView getBoard(ModelAndView mv, YonghyunVO yVO) {

		if(yVO.getCk() != 1) {
			int cnt = yDao.upClick(yVO);
			if(cnt != 1) {
				System.out.println("조회수 업데이트 실패");
			}
		}
	
		yVO = yDao.getBoard(yVO);
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		List<YonghyunVO> mVO = yDao.getMenu(yVO);

		mv.addObject("MAIN", yVO);
		mv.addObject("MEMBER", kVO);
		mv.addObject("MENU", mVO);
		mv.setViewName("board/boardForm");
		
		return mv;
	}
	
	// 게시판 공구신청 처리요청 함수
	@RequestMapping("/applyProc.dlv")
	public ModelAndView regiMem(ModelAndView mv, YonghyunVO yVO, HttpSession session) {
/* 로그인 처리 명령 확인 후 넣기
		if(session.getAttribute("SID") == null) {
			mv.setViewName("");
			return mv;
		}
*/		
		yVO.setId((String) session.getAttribute("SID"));

		// 공구 신청요청
		if(yVO.getRes() != 1) {
			int num = 0;
			List<YonghyunVO> kVO = yDao.selRegimem(yVO);
			for(YonghyunVO i : kVO) {
				if(i.getAid().equals((String) session.getAttribute("SID"))) {
					num++;
				}
			}
			
			if(num == 0) {
				int cnt = yDao.regiMem(yVO);
				if(cnt == 1) {
					mv.addObject("RESULT", 0);
					
				} else {
					mv.addObject("RESULT", 1);
				}
			} else {
				mv.addObject("RESULT", 2);
			}
		} else {
			// 공구 취소요청
			int num = 0;
			List<YonghyunVO> kVO = yDao.selRegimem(yVO);
			for(YonghyunVO i : kVO) {
				if(i.getAid().equals((String) session.getAttribute("SID"))) {
					num++;
				}
			}
			if(num == 0) {
				// 등록된 사람이 없어서 취소 불가
				mv.addObject("CANCLERESULT", 2);
			} else {
				// 신청자 확인되서 접수 취소 가능
				int cnt = yDao.cancleRegimem(yVO);
				if(cnt == 1) {
					// 취소 성공
					mv.addObject("CANCLERESULT", 1);
				} else {
					mv.addObject("CANCLERESULT", 0);
				}
			}
		}
		mv.addObject("CITY", yVO.getCity());
		mv.addObject("SEARCH", yVO.getSearch());
		mv.addObject("CHECK", yVO.getCheck());
		mv.addObject("VIEW", "/deli/board/boardForm.dlv");
		mv.setViewName("board/redirect");
		
		return mv;
	}
	
	// 친구추가 신청 함수
	@RequestMapping("/friend.dlv")
	@ResponseBody
	public String upFriend(YonghyunVO yVO, HttpSession session) {
		String id = (String) session.getAttribute("SID");	
		String result = ySrvc.selFriend(yVO, id);
		return result;
	}
	
	
}
