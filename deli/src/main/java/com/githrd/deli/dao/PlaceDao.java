package com.githrd.deli.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.placeVO;


public class PlaceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public placeVO selectOne(String name) {
		return sqlSession.selectOne("PDao.selectOne",name);
	}

	public List<placeVO> selectList() {
		List<placeVO> list = sqlSession.selectList("PDao.selectList");
		return list;
	}
	
}
