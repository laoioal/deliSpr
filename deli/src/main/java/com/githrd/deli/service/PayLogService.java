package com.githrd.deli.service;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.dao.*;
import com.githrd.deli.vo.*;

@Service
@Aspect
public class PayLogService {
	private static Logger payLog = LoggerFactory.getLogger("payLog");
	
	
	@Autowired
	PayDao paDao;
	
	@Pointcut("execution(* com.githrd.deli.controller.PayController.beforePay(..))")
	public void recordLogin() {
		System.out.println("###### aop start ########");
	}
	
	@After("execution(* com.githrd.deli.controller.PayController.afterPay(..))")
	public void payCom(JoinPoint join) {
		MembVO membVO = (MembVO) join.getArgs()[6];
		String id = membVO.getId();
		String result = membVO.getResult();
		System.out.println(result);
		if(result != null && result.equals("OK")) {
			payLog.info(id + " 님이 주문을 완료했습니다.");
		}
	}
	
}
