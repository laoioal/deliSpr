package com.githrd.deli.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.dao.FaqDao;
import com.githrd.deli.vo.faqVO;

/*
 * faq 페이지 관련 서비스 클래스
 * 작성자 : 고하늘
 */	
public class FaqService {
	///
	@Autowired private FaqDao fdao;	
	public Map<String,String> controllerMap = new HashMap<>(); //key : url , value : view 주소 
	public FaqService() {
		controllerMap.put("/deli/faq/board.dlv", "/faq/faqList");
		controllerMap.put("/deli/faq/admin/board/login.dlv", "redirect:/faq/board.dlv");
		//controllerMap.put("/deli/faq/admin/board/login2.dlv", "redirect:/faq/board.dlv");
		controllerMap.put("/deli/faq/board/detail.dlv", "/faq/faqDetail");
		controllerMap.put("/deli/faq/admin/board/insert.dlv", "/faq/admin/faqInsert");
		controllerMap.put("/deli/faq/admin/board/logout.dlv", "redirect:/faq/board.dlv");
		controllerMap.put("/deli/faq/admin/board/delete.dlv", "redirect:/faq/board.dlv");
//		controllerMap.put("/deli/faq/admin/board/delete.dlv", "/faq/board.dlv");
		controllerMap.put("/deli/faq/admin/board/update.dlv", "/faq/admin/faqUpdate");
		controllerMap.put("/deli/faq/admin/board/update2.dlv", "redirect:/faq/board.dlv");
//		controllerMap.put("/deli/faq/admin/board/update2.dlv", "/faq/board.dlv");

	}
	
	//해당 객체가 생성되면 자연스럽게 findViewPage 메소드로 호출 가능하도록 생성자에 key/value 값 담아줌
	public String findViewPage(String uri) {
		String viewPage = controllerMap.get(uri);
		viewPage = cutUri(viewPage);

		return viewPage;
	}
	
	//Content 길이가 너무 길면 메인화면에 지저분하게 보여 일정부분 잘라내주는 메소드
	public List<faqVO> cutContent(List<faqVO> list) {
		List<faqVO> faqlist = new ArrayList<>();
		for(int i = 0; i<list.size();i++) {
			if(list.get(i).getContent().length()>10) {
				StringTokenizer token = new StringTokenizer(list.get(i).getContent());
				String content = token.nextToken(".");
				list.get(i).setContent(content+"...");
			}		
			faqlist.add(list.get(i));
		}
		return faqlist;
	}
	
//uri값이 변형 되어버리면 controllerMap 객체에 value값을 찾을 수가 없기 때문에 이를 방지하고자 uri값을 잘라주는 메소드 
	public String cutUri(String uri) {
		if(uri.contains(";")) {
			StringTokenizer token = new StringTokenizer(uri);
			uri = token.nextToken(";");
		}
		return uri;
	}
	
	
	public faqVO selectNum(int no) {
		return fdao.selectNum(no);
	}
	
	public List<faqVO> selectList(){
		if(fdao.selectList().size()<1) {
			return null;
		}
		return fdao.selectList();
	}
	
	//로그인이 틀리면 faqVO는 null값이 되며, 메세지가 표시되고 아니면 faqVO 객체로 반환
	public faqVO login(int no,String pw) {
		faqVO faq = selectNum(no);
		if(faq.getPw().equals(pw)) {
			faq.setMessage(null);
		}
		else {
			faq.setMessage("비밀번호가 틀렸습니다.");
		}
		
		return faq;
	}
	
	public int insert(faqVO vo) {
		 int no = fdao.insert(vo);
		if(no!=1) {
			vo.setMessage("입력 실패");
			return 0;
		}
		else {
			vo.setMessage(null);
			return no;
		}
	}
	
	public int update(int no,String title,String content) {
		faqVO vo=selectNum(no);
		vo.setTitle(title);
		vo.setContent(content);
		return fdao.update(vo);
	}
	
	public int delete(int no) {
		return fdao.delete(no);
	}
	
	
	
	
	
}
