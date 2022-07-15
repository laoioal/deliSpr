package com.githrd.deli.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public ModelAndView getBoard(ModelAndView mv, YonghyunVO yVO, HttpSession session) {

		if(yVO.getCk() != 1) {
			int cnt = yDao.upClick(yVO);
			if(cnt != 1) {
				System.out.println("조회수 업데이트 실패");
			}
		}
		
	
		yVO = yDao.getBoard(yVO);
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		if(session.getAttribute("SID") != null) {
			for(YonghyunVO i : kVO) {
				if(session.getAttribute("SID").equals(i.getAid())) {
					mv.addObject("PAY", "OK");
				}
			}
		}
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		List<YonghyunVO> reboard = yDao.selReboard(yVO);
		
		mv.addObject("MAIN", yVO);
		mv.addObject("MEMBER", kVO);
		mv.addObject("MENU", mVO);
		mv.addObject("REBOARD", reboard);
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
	
	// 친구추가 수락 함수
	@RequestMapping("/apFriend.dlv")
	public ModelAndView apFriend(ModelAndView mv, YonghyunVO yVO, HttpSession session) {
		
		String view = "/deli/main.dlv";

		try {
			ySrvc.acceptFriend(yVO);
			mv.addObject("RESULT", "친구 수락에 성공했습니다.");
		} catch(Exception e) {
			mv.addObject("RESULT", "친구 수락에 실패했습니다.");
		}

		mv.addObject("VIEW", view);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	// 친구추가 거절 함수
	@RequestMapping("/denyFriend.dlv")
	public ModelAndView denyFriend(ModelAndView mv, YonghyunVO yVO, HttpSession session) {
		
		String view = "/deli/main.dlv";
		int cnt = yDao.denyFriend(yVO);
		if(cnt == 1) {
			// 친구거절 성공
			mv.addObject("RESULT", "친구 추가가 거절되었습니다.");
		} else {
			// 친구거절 실패
			mv.addObject("RESULT", "친구 추가 거절이 실패하였습니다.");
		}
		mv.addObject("VIEW", view);
		mv.setViewName("board/redirect");
		return mv;
	}

	// 친구 삭제 함수
	@RequestMapping("/delFriend.dlv")
	public ModelAndView delFriend(ModelAndView mv, YonghyunVO yVO) {
		String view = "/deli/main.dlv";
		int cnt = yDao.delFriend(yVO);
		if(cnt == 1) {
			// 친구삭제 성공
			mv.addObject("RESULT", "친구 삭제가 성공하였습니다.");
		} else {
			// 친구삭제 실패
			mv.addObject("RESULT", "친구 삭제가 실패하였습니다.");
		}
		
		mv.addObject("VIEW", view);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	// 메세지 리스트페이지 보기 함수
	@RequestMapping("/messageList.dlv")
	public ModelAndView messageList(ModelAndView mv, HttpSession session) {
		String id = (String) session.getAttribute("SID");
		List<YonghyunVO> list = yDao.messageList(id);
		
		mv.addObject("MESSAGE", list);
		mv.setViewName("board/message");
		return mv;
	}
	
	// 메세지 전송 폼보기 요청
	@RequestMapping("/msForm.dlv")
	public ModelAndView messageForm(ModelAndView mv) {
		
		mv.setViewName("board/messageForm");
		return mv;
	}
	// 메세지 전송 처리 함수
	@RequestMapping("/msProc.dlv")
	public ModelAndView sendMessage(ModelAndView mv, YonghyunVO yVO, HttpSession session) {
		yVO.setId((String) session.getAttribute("SID"));
		String view = "/deli/board/messageList.dlv";
		int cnt = yDao.sendMessage(yVO);
		mv.addObject("RESULT", "메세지 전송 성공");
		if(cnt != 1) {
			view = "/deli/board/msForm.dlv";
			mv.addObject("RESULT", "메세지 전송 실패");
		}
		
		mv.addObject("VIEW", view);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	// 메세지 읽음처리 함수
	@RequestMapping("/msRead.dlv")
	@ResponseBody
	public void msRead(YonghyunVO yVO, HttpSession session) {
		yVO.setId((String) session.getAttribute("SID"));
		yDao.messageRead(yVO);
	}
	
	// 채팅 로그 저장 함수
	@RequestMapping("/chatLog.dlv")
	@ResponseBody
	public Map<String, String> recordLog(YonghyunVO yVO) {
		Map<String, String> map = new HashMap<String, String>();
		int cnt = yDao.recordLog(yVO);
		if(cnt == 1) {
			map.put("result", "OK");
		}
		
		return map;
	}
	
	// 댓글 등록 처리 함수
	@RequestMapping("/reboard.dlv")
	public ModelAndView reboardProc(ModelAndView mv, YonghyunVO yVO, HttpSession session) {
		String view = "/deli/board/boardForm.dlv";
		yVO.setId((String) session.getAttribute("SID"));
		yDao.upReboard(yVO);
		mv.addObject("VIEW", view);
		mv.addObject("CITY", yVO.getCity());
		mv.addObject("SEARCH", yVO.getSearch());
		mv.addObject("CHECK", yVO.getCheck());
		mv.setViewName("board/redirect");
		return mv;
	}
	
	// 주변친구 추천
	@RequestMapping("/arrfriend.dlv")
	public ModelAndView friend(ModelAndView mv) {
		
		mv.setViewName("board/friend");
		return mv;
	}
	@RequestMapping("/test.dlv")
	public ModelAndView test(ModelAndView mv) {
		
		mv.setViewName("board/test");
		return mv;
	}
	@RequestMapping("/test02.dlv")
	public ModelAndView test02(ModelAndView mv) {
		
		mv.setViewName("board/test02");
		return mv;
	}
	// 주변친구 추천
	@RequestMapping("/arrfriendtest.dlv")
	public ModelAndView friendtest(ModelAndView mv, HttpSession session) {
		String id = (String) session.getAttribute("SID");
		YonghyunVO yVO = yDao.myAddr(id);
		List<YonghyunVO> list = yDao.arrFriend(yVO);
		mv.addObject("MYADDR", yVO);
		mv.addObject("LIST", list);
		mv.setViewName("board/friendtest");
		return mv;
	}
}
