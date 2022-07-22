package com.githrd.deli.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.service.AdminService;
import com.githrd.deli.service.FaqService;
import com.githrd.deli.vo.adminVO;
import com.githrd.deli.vo.faqVO;
/*
 * 이 클래스는 faq 페이지 관련 controller
 * 작성자 : 고하늘
 */
@Controller
@RequestMapping("/faq")
public class FaqController {
	
	//admin 계정 로그인을 처리해주는 서비스함수
	@Autowired	private AdminService adminService;
	//faq 테이블의 생성,수정,삭제를 처리해주는 서비스함수
	@Autowired 	private FaqService faqService;

	private static adminVO admin;
	private static List<faqVO> list;
	
	// faq 테이블 보기
	@GetMapping("/board.dlv")
	public String boardView(Model model) {
		String uri = "/deli/faq/board.dlv";
		List<faqVO> list = faqService.selectList();
		list =	faqService.cutContent(faqService.selectList());
		model.addAttribute("list", list);
		model.addAttribute("admin",admin);
		return faqService.findViewPage(uri);
	}
	
//	faq 페이지를 수정하기 위해서는 관리자계정 로그인을 해야함
	@GetMapping("/admin/board/login.dlv")
	public ModelAndView content() {

		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("faq/admin/adminLogin");
			return mv;
	}
	

	
	//로그인에 성공하면 수정,삭제,입력 버튼이 보이고 아니면 메세지가 하단에 표시됨.
	@PostMapping("/admin/board/login.dlv")
	public String login(Model model, @Param("id")String id, @Param("pw")String pw) {
	
		String msg = adminService.LoginMsg(id, pw);
		if(msg==null) {
			admin = adminService.selectId(id);
			model.addAttribute("admin",admin);
			return "redirect:/faq/board.dlv";
		}
		else {
			return	faqService.findViewPage("/deli/faq/admin/board/login.dlv");
		}
	}

	//테이블을 추가하거나,  logout 버튼을 누르게되면 faq 테이블이 있는 페이지로 이동
	@RequestMapping(value={"/admin/board/insert.dlv","/admin/board/logout.dlv"})
	public String beforeInsert(HttpServletRequest request,Model model) {
		String uri = request.getRequestURI();
		
	//	List<faqVO> list =	faqService.cutContent(faqService.selectList());
		
		model.addAttribute("list", list);
		
		if(uri.contains("insert")) {
			//테이블 추가하면 admin 객체를 전달
		model.addAttribute("admin", admin);
		}
		//그렇지 않으면 admin 객체는 null값으로 반환
		else {
			admin = null;
		}
		return faqService.findViewPage(uri);
	}
	
	
	//insert 입력-> faq 메인화면으로 이동
	@PostMapping("/admin/board/insert.dlv")
	public String afterInsert(Model model, @Param("id")String id, @Param("pw")String pw, @Param("title")String title,@Param("content")String content) {
		faqVO faq = new faqVO(id,pw,title,content);
		faqService.insert(faq);
		//List<faqVO> list =	faqService.cutContent(faqService.selectList());
		model.addAttribute("list", list);
		return "/faq/faqList";
	}
	
	//글번호로 파라미터 값이 동일하여 한개의 메소드로 묶음
	@RequestMapping(value = {"/board/detail.dlv", "/admin/board/delete.dlv","/admin/board/update.dlv","/admin/board/update2.dlv"})
	public String detailView(HttpServletRequest request, @Param("no")int no,Model model) {
		faqVO faq = faqService.selectNum(no);
		String uri = request.getRequestURI();	//요청받은 uri
		model.addAttribute("admin",admin);	//admin 객체 전달
		
		if(uri.equals("/deli/faq/admin/board/update2.dlv"))
		{	
			faqService.update(no, request.getParameter("title"), request.getParameter("content"));
			
		}		
		if(uri.equals("/deli/faq/admin/board/delete.dlv"))
		{
			faqService.delete(no);
		}
		model.addAttribute("faq", faq);
		return faqService.findViewPage(uri);
	}
	
}
