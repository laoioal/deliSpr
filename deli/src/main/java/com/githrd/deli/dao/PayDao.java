package com.githrd.deli.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.MembVO;
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
	/*
	public int insertOdm(java.util.Map map) {
		return sqlSession.insert("paSQL.insertOdm", map);
	}
	*/ 
	 
	//	비용 조회 전담 처리 함수
	public PayVO selPays(PayVO paVO) {
		return sqlSession.selectOne("paSQL.selPays", paVO);
	}
	
	//	사용자 조회 전담 처리 함수
	public MembVO selMinfo(String sid) {
		return sqlSession.selectOne("paSQL.selMinfo", sid);
	}
	
	//	식당 조회 전담 처리 함수
	public PayVO selRest(int bno) {
		return sqlSession.selectOne("paSQL.selRest", bno);
	}
	
	//	식당 이름과 메뉴이름으로 메뉴번호 찾기
	public PayVO selMenuMno(PayVO paVO) {
		return sqlSession.selectOne("paSQL.selMenuMno", paVO);
	}
	
	//	메뉴번호로 메뉴 정보 찾기
	public PayVO selMenu(int mno) {
		return sqlSession.selectOne("paSQL.selMenu", mno);
	}
	
	//	모인 인원수 구하는 함수
	public int abnoCnt(int abno) {
		return sqlSession.selectOne("paSQL.selAbnoCnt", abno);
	}
	
	//	ODT isshow N 처리 함수
	public int delOdt(String ono) {
		return sqlSession.update("paSQL.delOdt", ono);
	}
	
	//	ODL isshow N 처리 함수
	public int delOdl(String ono) {
		return sqlSession.update("paSQL.delOdl", ono);
	}
	
	//	ODM isshow N 처리 함수
	public int delOdm(String ono) {
		return sqlSession.update("paSQL.delOdm", ono);
	}
}


