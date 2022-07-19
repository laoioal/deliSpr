package com.githrd.deli.interceptor;
/**
 * 회원 관련 요청을 할 때
 * 로그인이 되어있지 않은 경우 로그인 페이지로
 * 돌려보내는 작업을 처리할 인터셉터 클래스
 * @author	박찬슬
 * @since	2022.06.30
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022/06.24	-	담당자 : 박찬슬
 * 									클래스 제작
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginRedirectInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		if(req.getSession().getAttribute("SID") == null) {
			resp.sendRedirect("/deli/member/login.dlv");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}