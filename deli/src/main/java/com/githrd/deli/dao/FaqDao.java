package com.githrd.deli.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.faqVO;

	public class FaqDao {

		
		@Autowired
		private SqlSessionTemplate sqlSession;

		public faqVO selectNum(int no) {
			return sqlSession.selectOne("FDao.selectNum",no);
		}
		public List<faqVO> selectList() {
			List<faqVO> list = sqlSession.selectList("FDao.selectList");
			return list;
		}
		public int insert(faqVO vo) {
			return sqlSession.insert("FDao.insert", vo);
		}
		
		public int update(faqVO vo) {
			return sqlSession.update("FDao.update",vo);
		}
		
		public int delete(int no) {
			return sqlSession.delete("FDao.delete", no);
		}
		
		
		
}
