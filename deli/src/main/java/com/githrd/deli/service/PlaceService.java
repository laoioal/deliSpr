package com.githrd.deli.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.dao.MiddleareaDao;
import com.githrd.deli.dao.PlaceDao;
import com.githrd.deli.vo.placeVO;

public class PlaceService {
	@Autowired PlaceDao dao;
	@Autowired MiddleareaDao mdao;
	
	//코드번호를 알아내기 위하여 주소 문자열을 잘라서
	public String substrPickupPlace(placeVO place) {
		String strName;
			String address = place.getAddress();
			String[] temp = address.split(" ");
			strName = temp[1];
		return strName;
	}
	
	//코드로 반환
	public int getCode(placeVO place) {
		return mdao.selectCode(substrPickupPlace(place)).getCode();
	}

	
	public placeVO selectOne(String name) {
		return dao.selectOne(name);
	}
	
	public List<placeVO> selectList(){
		return dao.selectList();
	}
	
	
}
