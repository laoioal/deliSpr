package com.githrd.deli.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.dao.AdminDao;
import com.githrd.deli.vo.adminVO;

public class AdminService {

	@Autowired
	private AdminDao adao;
	
	public adminVO selectId(String id) {
		return adao.selectId(id);
	}
	public adminVO selectPw(String pw) {
		return adao.selectId(pw);
	}
	public adminVO Login(String id, String pw) {
		return new adminVO(id,pw);
	}

	
	public String LoginMsg(String id, String pw) {
		String msg;
		adminVO vo = adao.selectId(id);
		System.out.println(vo);
		if(vo==null) {
			msg = "아이디를 잘못 입력했습니다.";
		}
		else {
			if(vo.getPw().equals(pw)) {
				msg = null;
			}
			else {
				msg = "비밀번호를 잘못 입력했습니다.";
			}
		}
		return msg;
	}
	
}