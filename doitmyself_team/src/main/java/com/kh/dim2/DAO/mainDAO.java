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
		return sqlSession.insert("Member.insert" , member);
	}

	public int idcheck(String uSER_ID) {
		return sqlSession.selectOne("Memeber.idcheck" , uSER_ID);
	}
}
