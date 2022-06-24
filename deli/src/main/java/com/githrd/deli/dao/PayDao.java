package com.githrd.deli.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.PayVO;

/**
 * 결제를 위한 Dao
 * @author 이형준
 * @since  2022.05.25
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.23	-	클래스제작
 * 									담당자 ] 이형준	
 */

public class PayDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//	odertask 채우기 전담 처리 함수
	public int insertOdt(PayVO paVO) {
		return sqlSession.insert("paSQL.insertOdt", paVO);
	}
	
	//	oderlist 채우기 전담 처리 함수
	public int insertOdl(PayVO paVO) {
		return sqlSession.insert("paSQL.insertOdl", paVO);
	}
	
	//	odermenu 채우기 전담 처리 함수
	public int insertOdm(PayVO paVO) {
		return sqlSession.insert("paSQL.insertOdm", paVO);
	}
	
	//	비용 조회 전담 처리 함수
	public PayVO selPays(int bno) {
		return sqlSession.selectOne("paSQL.selPays", bno);
	}
	
	//	사용자 조회 전담 처리 함수
	public PayVO selMinfo(PayVO paVO) {
		return sqlSession.selectOne("paSQL.selMinfo", paVO);
	}
	
	//	식당 조회 전담 처리 함수
	public PayVO selRest(int bno) {
		return sqlSession.selectOne("paSQL.selRest", bno);
	}
}


