package com.githrd.deli.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.categoryVO;

	public class CategoryDao {

		@Autowired
		private SqlSessionTemplate sqlSession;
		

		public categoryVO selectOne(String category_name) {
			return sqlSession.selectOne("CDao.selectOne",category_name);
		}
		public categoryVO selectNum(int category_no) {
			return sqlSession.selectOne("CDao.selectNum",category_no);
		}

		public List<categoryVO> selectList() {
			List<categoryVO> list = sqlSession.selectList("CDao.selectList");
			return list;
		}
		
}
