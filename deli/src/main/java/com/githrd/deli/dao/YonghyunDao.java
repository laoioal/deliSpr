package com.githrd.deli.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.util.PageUtil;
import com.githrd.deli.vo.ChatVO;
import com.githrd.deli.vo.YonghyunVO;

/**
 * 이 클래스는 회원 관련 데이터베이스 작업을 전담해서 처리하는 클래스
 * @author	이용현
 * @since	2022.05.25
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.25	-	클래스제작
 * 									담당자 ] 이용현
 *
 */

public class YonghyunDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<YonghyunVO> getBoardList(PageUtil page) {
		return sqlSession.selectList("ySQL.boardList", page);
	}
	
	public int getBoardTotal(PageUtil page) {
		return sqlSession.selectOne("ySQL.boardTotal", page);
	}
	// 게시물 보여주는 함수
	public YonghyunVO getBoard(YonghyunVO yVO) {
		return sqlSession.selectOne("ySQL.boardForm", yVO);
	}
	// 게시물 등록된 메뉴 불러오는 함수
	public List<YonghyunVO> getMenu(YonghyunVO yVO) {
		return sqlSession.selectList("ySQL.getMenu", yVO);
	}
	
	// 게시물 조회수 올려주는 함수
	public int upClick(YonghyunVO yVO) {
		return sqlSession.update("ySQL.upClick", yVO);
	}
	// 게시물 내 공구신청한 사람 조회 함수
	public List<YonghyunVO> selRegimem(YonghyunVO yVO) {
		return sqlSession.selectList("ySQL.selRegimem", yVO);
	}
	
	// 등록된 게시물에 공구 신청접수 함수
	public int regiMem(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.regiMem", yVO);
	}
	
	// 등록된 게시물에 공구 접수 취소 요청 함수
	public int cancleRegimem(YonghyunVO yVO) {
		return sqlSession.update("ySQL.cancleRegimem", yVO);
	}
	
	// 친구 추가 가능여부 조회 함수
	public int selFriend(YonghyunVO yVO ) {
		return sqlSession.selectOne("ySQL.selFriend", yVO);
	}

	// 친구 추가 처리요청 함수
	public int upFriend(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.upFriend", yVO);
	}
	
	// 메인페이지 내정보 불러오는 함수
	public YonghyunVO myInfo(String id) {
		return sqlSession.selectOne("ySQL.myInfo", id);
	}
	
	// 내친구 불러오는 함수
	public List<YonghyunVO> myFrined(String id) {
		return sqlSession.selectList("ySQL.myFrined", id);
	}
	
	// 친구 수락대기인원 불러오는 함수
	public List<YonghyunVO> aplFrined(String id) {
		return sqlSession.selectList("ySQL.aplFrined", id);
	}
	
	// 탑5 게시물 불러오는 함수
	public List<YonghyunVO> topBoard(){
		return sqlSession.selectList("ySQL.topBoard");
	}
	
	// 친구추가 수락시 친구 추가시키는 함수
	public int inFriend(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.inFriend", yVO);
	}
	
	// 친구추가 수락시 수락상태로 변경하는 함수
	public int apFriend(YonghyunVO yVO) {
		return sqlSession.update("ySQL.apFriend", yVO);
	}
	
	// 친구추가 거절 함수
	public int denyFriend(YonghyunVO yVO) {
		return sqlSession.update("ySQL.denyFriend", yVO);
	}
	
	// 친구삭제 함수
	public int delFriend(YonghyunVO yVO) {
		return sqlSession.update("ySQL.delFriend", yVO);
	}
	
	// 메세지 전송 함수
	public int sendMessage(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.sendMessage", yVO);
	}
	
	// 받은 메세지 리스트 조회 함수
	public List<YonghyunVO> messageList(String id){
		return sqlSession.selectList("ySQL.messageList", id);
	}
	
	// 메인페이지 받은 메세지 개수 조회 함수
	public YonghyunVO messageCnt(String id) {
		return sqlSession.selectOne("ySQL.messageCnt", id);
	}
	
	// 쪽지 읽음처리 함수
	public int messageRead(YonghyunVO yVO) {
		return sqlSession.update("ySQL.messageRead", yVO);
	}
	
	// 채팅 로그 저장 함수
	public int recordLog(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.recordLog", yVO);
	}
	
	// 채팅기록 불러오는 함수
	public List<YonghyunVO> getChatRecord(){
		return sqlSession.selectList("ySQL.getChatRecord");
	}
	
	// 게시판 댓글 달기 함수
	public int upReboard(YonghyunVO yVO) {
		return sqlSession.insert("ySQL.upReboard", yVO);
	}
	
	// 게시판 댓글 불러오기 함수
	public List<YonghyunVO> selReboard(YonghyunVO yVO){
		return sqlSession.selectList("ySQL.selReboard", yVO);
	}
	
	// 내주소 불러오기 함수
	public YonghyunVO myAddr(String id) {
		return sqlSession.selectOne("ySQL.myAddr", id);
	}
	
	// 친구주소 불러오기 함수
	public List<YonghyunVO> arrFriend(YonghyunVO yVO) {
		return sqlSession.selectList("ySQL.arrFriend", yVO);
	}
	
}
