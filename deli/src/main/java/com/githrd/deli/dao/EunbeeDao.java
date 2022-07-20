package com.githrd.deli.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.githrd.deli.vo.*;

/**
 * 이 클래스는 데이터베이스 작업을 전담해서 처리하는 클래스
 * @author	안은비
 * @since	2022.05.24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.24	-	클래스제작
 * 				2022.05.24	-	getId()
 * 				2022.05.25	-	getMail()
 * 				2022.05.25	-	editPw()
 * 				2022.05.26	-	getAbInfo()
 * 				2022.05.27	-	getAid()
 * 				2022.05.28	-	updateEshow()
 * 				2022.05.28	-	addEsti()
 * 				2022.05.28	-	getNewEsti()
 * 				2022.05.28	-	updateEsti()
 * 				2022.05.28	-	getRegmen()
 * 									담당자 ] 안은비
 *
 */

public class EunbeeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String getId(String mail) {
		return sqlSession.selectOne("eSQL.selId", mail);
	}
	
	public String getMail(EunbeeVO eVO) {
		return sqlSession.selectOne("eSQL.selMail", eVO);
	}
	
	public int editPw(EunbeeVO eVO) {
		return sqlSession.update("eSQL.upPw", eVO);
	}
	
	public List<EunbeeVO> getBinfo(String id) {
		return sqlSession.selectList("eSQL.selBinfo", id);
	}
	
	public int insEtableA(EunbeeVO eVO) {
		return sqlSession.insert("eSQL.insEtableA", eVO);
	}
	
	public int insEtableB(EunbeeVO eVO) {
		return sqlSession.insert("eSQL.insEtableB", eVO);
	}
	
	public List<EunbeeVO> getEinfo(EunbeeVO eVO) {
		return sqlSession.selectList("eSQL.selEinfo", eVO);
	}

}
