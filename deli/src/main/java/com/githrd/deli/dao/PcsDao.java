package com.githrd.deli.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

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
 * 				2022.06.30  -   회원, 글쓰기 테이블 전담 함수 추가
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
	
	// 회원정보 수정 처리
	public int editMember(PcsVO pcVO) {
		return sqlSession.update("pcSQL.editMember", pcVO);
	}
	
	// 프로필사진 수정 처리
	public int editProfile(FileVO fVO) {
		return sqlSession.update("pcSQL.editProfile", fVO);
	}
	
	// 지역 대분류 요청 함수
	public List<PcsVO> largeArea(){
		return sqlSession.selectList("pcSQL.largeArea");
	}
	
	// 지역 중분류 요청 함수
	public List<PcsVO> middleArea(PcsVO pcVO){
		return sqlSession.selectList("pcSQL.middleArea", pcVO);
	}
	
	// 지역 소분류 요청함수
	public List<PcsVO> smallArea(PcsVO pcVO){
		return sqlSession.selectList("pcSQL.smallArea", pcVO);
	}
	
	// 메뉴 카테고리 요청함수
	public List<PcsVO> menuCate(){
		return sqlSession.selectList("pcSQL.menu");
	}
	
	// 음식점 리스트 요청 함수
	public List<PcsVO> rest(PcsVO pcVO){
		return sqlSession.selectList("pcSQL.rest", pcVO);
	}
	
	// 메일 인증키 생성 요청함수
	public void createAuthKey(String memberEmail,String authKey) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlSession.selectOne("memberMapper.createAuthKey", map);
		
	}
	
	// 메일 인증 확인 처리함수
	public void memberAuth(String memberEmail) throws Exception{
		sqlSession.update("memberMapper.memberAuth", memberEmail);
	}
	
	// 글쓰기 처리요청
	public int addBoard(PcsVO pcVO) {
		return sqlSession.insert("pcSQL.insertBoard", pcVO);
	}
	
	// 회원번호 조회 질의명령
	public int getMno(String id) {
		return sqlSession.selectOne("pcSQL.getMno", id);
	}
	
	// 공동구매 등록 처리요청
	public int addRegimem(PcsVO pcVO) {
		return sqlSession.insert("pcSQL.insertRegimem", pcVO);
	}
}
