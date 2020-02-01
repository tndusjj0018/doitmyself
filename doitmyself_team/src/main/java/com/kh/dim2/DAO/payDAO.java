package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;

@Repository
public class payDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member locInfo(String id) {	
		return sqlSession.selectOne("pay.locInfo", id);
	}

	public Product prdInfo(int p_NO) {
		return sqlSession.selectOne("pay.prdInfo",p_NO);
	}

}
