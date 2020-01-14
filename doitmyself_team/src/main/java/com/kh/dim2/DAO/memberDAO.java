package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member memberInfo(String id) {
		return sqlSession.selectOne("Member.readinfo", id);
	}

}
