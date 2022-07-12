package com.githrd.deli.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.githrd.deli.dao.PayDao;
import com.githrd.deli.vo.PayVO;

@Service
public class PayService {
	@Autowired
	PayDao paDao;
	
	@Transactional
	public void insertAllM(PayVO paVO) {
		//	할일
		//	데이터 입력
		paDao.insertOdt(paVO);
		paDao.insertOdl(paVO);
		paDao.insertOdm(paVO);
		
	}
}
