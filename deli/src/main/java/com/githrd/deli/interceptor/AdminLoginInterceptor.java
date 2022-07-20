package com.githrd.deli.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.vo.adminVO;

public class AdminLoginInterceptor implements HandlerInterceptor {
	// 컨트롤러 호출 후 처리
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("--------------------------------------preHandle");
		HttpSession session = request.getSession();
		adminVO admin = (adminVO)session.getAttribute("admin");
		if(admin==null) {
			String url= session.getServletContext().getContextPath()+"/faq/admin/board/login.dlv";
			System.out.println("******"+url);
			response.sendRedirect(url);
			return false;
		}
//---------------------------------------------------------------------------		
//		String uri = request.getRequestURI();
//		System.out.println(uri);
//		adminVO admin = (adminVO)request.getAttribute("admin");
//		if(admin==null) {
//			uri = "/deli/faq/admin/board/login.dlv";
//			response.sendRedirect(uri);
//			System.out.println("uri : "+uri);
//			
//		}
		return true;
		

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("--------------------------------------postHandle");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("--------------------------------------afterCompletion");

	}
}
