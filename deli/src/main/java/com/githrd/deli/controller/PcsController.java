package com.githrd.deli.controller;


import java.io.*;
import java.text.*;

/**
 * @author 박찬슬
 * @since	2022/06/30
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 					2022/06/30	- 담당자 : 박찬슬
 * 									회원관련, 글쓰기 클래스 제작
 */

import java.util.*;

import javax.servlet.http.*;


import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.githrd.deli.dao.*;
import com.githrd.deli.service.*;
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
	@Autowired
	private MailSendService mailService;

	
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
			mv.setViewName("member/redirect");
			mv.addObject("MODAL", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mv.addObject("VIEW", "/deli/member/login.dlv");
			return mv;
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
	public ModelAndView boardWrite(ModelAndView mv, HttpSession session, RedirectView rv, PcsVO pcVO) {
		List<PcsVO> llist = PcDao.largeArea();
		List<PcsVO> menu = PcDao.menuCate();
		
		mv.addObject("MENU", menu);
		mv.addObject("LARGE", llist);
		mv.setViewName("member/boardWrite");		
		return mv;
	}
	
	// 음식점 카테고리
	@RequestMapping("/rest.dlv")
	@ResponseBody
	public List<PcsVO> rest(PcsVO pcVO){
		List<PcsVO> list = PcDao.rest(pcVO);
		return list;
	}
	
	// 지역 중분류
	@RequestMapping("/mArea.dlv")
	@ResponseBody
	public List<PcsVO> mArea(PcsVO pcVO){
		List<PcsVO> list = PcDao.middleArea(pcVO);
		return list;
	}

	// 지역 소분류
	@RequestMapping("/sArea.dlv")
	@ResponseBody
	public List<PcsVO> sArea(PcsVO pcVO){
		List<PcsVO> list = PcDao.smallArea(pcVO);
		return list;
	}
	
	// 글쓰기 등록 요청
	@RequestMapping("/boardWriteProc.dlv")
	public ModelAndView boardWrietProc(ModelAndView mv, PcsVO pcVO, HttpSession session, String nowPage) {
		String view = "/deli/board/boardForm.dlv";
		String sid = (String) session.getAttribute("SID");
		
		pcVO.setMno(PcDao.getMno(sid));
		
		int cnt = PcDao.addBoard(pcVO);
		if(cnt == 1) {
			System.out.println("pcVO : " + pcVO);
			PcDao.addRegimem(pcVO);
			nowPage = "1";
			mv.addObject("NOWPAGE", nowPage);
			mv.addObject("VIEW", view);
			mv.setViewName("member/redirect");
		} else {
			mv.setViewName("member/boardWrite");
		}
		return mv;
	}

	// 임시 회원정보 폼보기
	@RequestMapping("/myInfo.dlv")
	public ModelAndView infoForm(ModelAndView mv, HttpSession session, RedirectView rv) {
		// 세션에서 id 꺼내오고
		String id = (String) session.getAttribute("SID");
		/*
		if(id == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		*/
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
		/*
		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			rv.setUrl("/deil/main.dlv");
			mv.setView(rv);
			return mv;
		}
		*/
		return mv;
	}
	
	// 회원가입 처리함수
	@RequestMapping("/joinProc.dlv")
	public ModelAndView joinFroc(ModelAndView mv, RedirectView rv, HttpSession session, PcsVO pcVO, FileVO fVO) {
		/*
		// 이미 로그인 되어있는 경우
		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			rv.setUrl("/deil/main.dlv");
			mv.setView(rv);
			return mv;
		}
		*/

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

	// 이메일 인증
	@GetMapping("/mailCertified")
	@ResponseBody
	public String mailCertified(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);		
	}
	
	// 회원탈퇴
	@RequestMapping("/delMember.dlv")
	public ModelAndView delMember(ModelAndView mv, String id, RedirectView rv, HttpSession session) {
		/*
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		*/
		
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
	@RequestMapping("editInfo.dlv")
	public ModelAndView editInfo(ModelAndView mv, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		/*
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		*/
		
		PcsVO PcVO = PcDao.getIdInfo(sid);
		mv.addObject("DATA", PcVO);
		mv.setViewName("/member/editInfo");
		
		return mv;
	}
	
	// 회원정보 수정 처리 함수
	@RequestMapping("editProc")
	public ModelAndView editProc(ModelAndView mv, HttpSession session, RedirectView rv, PcsVO pcVO) {
		/*
		String sid = (String) session.getAttribute("SID");
		// 로그인이 되어있지 않은 경우
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		*/
		
		try {
			fSrvc.editMemberData(pcVO);
			rv.setUrl("/deli/member/myInfo.dlv");
		} catch(Exception e) {
			rv.setUrl("/deli/member/editInfo.dlv");
			System.out.println(pcVO);
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
	
	// 이메일체크 함수
	@RequestMapping(path="/mailCheck.dlv", method=RequestMethod.POST, params="mail")
	@ResponseBody
	public Map<String, String> mailCheck(String mail){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = PcDao.mailCnt(mail);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
	}
	
	// 스마트에디터 단일파일 업로드
	@RequestMapping("/bWriteProc.dlv")
	public String photoUpload(HttpServletRequest req, BphotoVO bpVO) {
		String callback = bpVO.getCallback();
		String callback_func = bpVO.getCallback_func();
		String file_result = "";
		try {
			if(bpVO.getFiledate() != null && bpVO.getFiledate().getOriginalFilename() != null && !bpVO.getFiledate().getOriginalFilename().contentEquals("")) {
				// 동일한 파일이 존재할떄
				String oriname = bpVO.getFiledate().getOriginalFilename();
				String ext = oriname.substring(oriname.lastIndexOf(".")+1);
				// 파일 기본경로
				String defaultPath = req.getSession().getServletContext().getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String path = defaultPath + "resources" + File.pathSeparator + "bUpload" + File.separator;
				File file = new File("path:" + path);
				System.out.println("path : " + path);
				// 디렉토리가 존재하지 않을 경우 디렉토리 생성
				if(!file.exists()) {
					file.mkdirs();
				}
				// 서버에 업로드 할 파일 명(한글문제로 인해 원본파일은 올리지 않는것이 좋다.)
				String rename = UUID.randomUUID().toString() + "." + ext;
				
			//////////////// 서버에 파일쓰기 ///////////////////////
				bpVO.getFiledate().transferTo(new File(path+rename));
				file_result += "&bNewLine=true&sFileName="+oriname+"sFileURL=/resources/bUpload"+rename;
			} else {
				file_result += "&errstr=error";
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("callback_func : " + callback_func);
		System.out.println("callback : " + callback);
		return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	// 다중파일업로드
	@RequestMapping("/bMulitWriteProc.dlv")
	public void bMulitWriteProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일 명을 받는다 - 일반 원본파일 명
			String filename = req.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			// 확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = req.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로_상세경로
			String filePath = dftFilePath + "resources" + File.separator + "bUpload" + File.separator;
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			////////// 서버에 파일쓰기 /////////////
			InputStream is = req.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(req.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1){
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////////// 서버에 파일쓰기 /////////////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName="+ filename;
			sFileInfo += "&sFileURL="+"/deli/resources/bUpload/"+realFileNm;
			PrintWriter print = resp.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
