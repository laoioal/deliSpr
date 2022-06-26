package com.githrd.deli.service;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import com.githrd.deli.dao.*;
import com.githrd.deli.vo.*;

public class YonghyunService {
	@Autowired
	YonghyunDao yDao;
	
	public String selFriend(YonghyunVO yVO, String id) {
		StringBuffer buff = new StringBuffer();
		yVO.setId(id);

		int cnt = yDao.selFriend(yVO);
		
		buff.append("{ \"result\" : \"");
		
		if(cnt == 0) {
			// 친구추가 가능
			int num = yDao.upFriend(yVO);

			if(num == 1) {
				// 친구추가 성공
				buff.append("OK");
			} else {
				// 친구추가 실패
				buff.append("NO");
			}
		} else {
			// 이미 신청
			buff.append("AL");
		}
		buff.append("\" }");

		return buff.toString();
	}
	
	@Transactional
	public void acceptFriend(YonghyunVO yVO) {
		yDao.inFriend(yVO);
		yDao.apFriend(yVO);
	}
	
}
