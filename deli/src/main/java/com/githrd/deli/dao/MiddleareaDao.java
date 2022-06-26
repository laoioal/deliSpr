package com.githrd.deli.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.middleareaVO;

	public class MiddleareaDao {

		@Autowired
		private SqlSessionTemplate sqlSession;
		

		
		public middleareaVO selectCode(String city) {
			return sqlSession.selectOne("MiddleDao.selectCode",city);
		}
		
		public List<middleareaVO> selectCodeList(int code){
			return sqlSession.selectList("MiddleDao.selectCodeList",code);
		}
		
		
}
