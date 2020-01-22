package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;

@Repository
public class mainDAO {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	public int insert(Member member) {
		return sqlSession.insert("Main.insert" , member);
	}

	public Member idcheck(String uSER_ID) {
		return sqlSession.selectOne("Main.idcheck" , uSER_ID);
	}

	public Member emailcheck(String uSER_EMAIL) {
		return sqlSession.selectOne("Main.emailcheck" , uSER_EMAIL);
	}

	public Member login(String uSER_ID, String uSER_PASSWORD) {
		return sqlSession.selectOne("Main.login" , uSER_ID);
	}

	public int sellercheck(String uSER_ID) {
		return sqlSession.selectOne("Main.sellercheck" , uSER_ID);
	}

	public Member admin_check(String uSER_ID) {
		return sqlSession.selectOne("Main.admin_check" , uSER_ID);
	}
}
