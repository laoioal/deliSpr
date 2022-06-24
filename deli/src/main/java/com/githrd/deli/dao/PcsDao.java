package com.githrd.deli.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.*;

/**
 * 이 클래스는 회원 관련 데이터베이스 작업을 전담해서 처리하는 클래스
 * @author	박찬슬
 * @since	2022.05.24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.24	-	회원 테이블 전담 함수 추가
 * 									담당자 ] 박찬슬
 * 				2022.05.25	-	회원 테이블 전담 함수 추가2
 * 									담당자 ] 박찬슬
 * 				2022.05.26	-	회원 테이블 전담 함수 추가2
 * 									담당자 ] 박찬슬
 * 
 *
 */

public class PcsDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리
	public int getLogin(PcsVO pcVO) {
		return sqlSession.selectOne("pcSQL.login", pcVO);
	}

	// 아이디로 회원정보 조회 전담 처리
	public PcsVO getIdInfo(String id) {
		return sqlSession.selectOne("pcSQL.getIdInfo", id);
	}
	
	// 회원탈퇴 처리
	public int delMember(String id) {
		return sqlSession.update("pcSQL.delMember", id);
	}
	
	// 아이디체크 처리
	public int idCnt(String id) {
		return sqlSession.selectOne("pcSQL.idCnt", id);
	}
	
	// 회원가입 처리
	public int addMember(PcsVO pcVO) {
		return sqlSession.insert("pcSQL.addMember", pcVO);
	}
	
	// 프로필사진 처리
	public int addProfile(FileVO fVO) {
		return sqlSession.insert("pcSQL.addProfile", fVO);
	}
}
