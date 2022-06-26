package com.githrd.deli.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.githrd.deli.dao.MemberDao;
import com.githrd.deli.vo.guestVO;
import com.githrd.deli.vo.memberVO;

//아이디 존재여부 확인

public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public void searchById(guestVO guest) {
		memberVO memb = dao.selectOne(guest.getId());
		if(memb==null) {
			guest.setError("아이디를 다시 확인해주세요");
		}
		else {
			System.out.println(memb.getId()+" "+memb.getAddr());
			guest.setError(null);
			guest.setId(memb.getId());
			guest.setAddr(memb.getAddr());
		}
	}
	
}
