package com.githrd.deli.service;

import org.aspectj.lang.annotation.*;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.stereotype.*;


@Service
@Aspect
public class YonghyunLog {
	private static Logger YonghyunLog = LoggerFactory.getLogger("YonghyunLog");

	/* aop 예시
	@After("execution(* com.githrd.www.controller.Member.logout(..))")
	public void loggoutRecird(JoinPoint join) {
		MemberVO mVO = (MemberVO) join.getArgs()[2];
		String id = mVO.getId();
		String result = mVO.getResult();
		
		if(result != null && result.contentEquals("OK")) {
			loginLog.info(id + " 님 로그아웃");
		}
	}
	*/
}
