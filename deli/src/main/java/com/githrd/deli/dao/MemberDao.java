package com.githrd.deli.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.memberVO;

public class MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public memberVO selectOne(String id) {
		
		return sqlSession.selectOne("MDao.selectOne",id);
	}

	public List<memberVO> selectList() {
		List<memberVO> list = sqlSession.selectList("MDao.selectList");
		return list;
	}


}



