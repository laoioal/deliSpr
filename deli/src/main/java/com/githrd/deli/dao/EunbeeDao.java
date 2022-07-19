package com.githrd.deli.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.vo.EunbeeVO;

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

}
