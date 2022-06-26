package com.githrd.deli.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.restaurantVO;

	public class RestaurantDao {
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		

		public restaurantVO selectRname(String rname) {
			return sqlSession.selectOne("RDao.selectRname",rname);
		}
	
		public restaurantVO selectAddr(String addr) {
			return sqlSession.selectOne("RDao.selectAddr",addr);
		}
		
		public restaurantVO selectMcode(int mcode) {
			return sqlSession.selectOne("RDao.selectMcode",mcode);
		}

		
		public restaurantVO selectRestno(int restno) {
			return sqlSession.selectOne("RDao.selectRestno",restno);
		}
		

		public List<restaurantVO> selectAll() {
			List<restaurantVO> list = sqlSession.selectList("RDao.selectAll");
			return list;
		}
		
		public List<restaurantVO> selectCname(int cname){
			List<restaurantVO> list = sqlSession.selectList("RDao.selectCname",cname);
			return list;
		}
		
		//integer : 카테고리
		//mcode : 지역번호
		public List<restaurantVO> selectList(Map<Integer, List<restaurantVO>> rMap) {
			List<restaurantVO> list = sqlSession.selectList("RDao.selectList",rMap);
			
			return list;
		}
}
