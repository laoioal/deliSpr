package com.githrd.deli.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.dao.RestaurantDao;
import com.githrd.deli.vo.restaurantVO;

public class RestaurantService {
	@Autowired RestaurantDao dao;
	
	
	public Map<Integer,List<restaurantVO>> sortMap(int cname,int mcode){
		Map<Integer,List<restaurantVO>> map = new HashMap<>();
		//map을 만든다
		
		//1차 : 카테고리로 걸러줌
		List<restaurantVO> list = dao.selectCname(cname);
		System.out.println(list);
		List<restaurantVO> sortList = new ArrayList<>();
		//2차 : 걸러진 카테고리 중 mcode가 같으면 list에 넣어줌		
		for(int i = 0; i<list.size();i++) {
			if(list.get(i).getMcode()==mcode) {
				sortList.add(list.get(i));
			}
		}
		//담았던 list를 토대로 map에 넣어줌
		map.put(mcode, sortList);
		System.out.println("===================================");
		return map;
	}
	
	public List<restaurantVO> sortList(List<restaurantVO> list){
	
		System.out.println("****************************************");
		return new ArrayList<>(list);
	}
	
	
}
