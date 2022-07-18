package com.githrd.deli.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.adminVO;

	public class AdminDao {

		@Autowired
		private SqlSessionTemplate sqlSession;
		

		public adminVO selectId(String id) {
			return sqlSession.selectOne("ADao.selectId",id);
		}
		public adminVO selectPw(String pw) {
			return sqlSession.selectOne("ADao.selectPw",pw);
		}
		
}
