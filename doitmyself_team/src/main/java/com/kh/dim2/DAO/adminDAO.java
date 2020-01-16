package com.kh.dim2.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;

@Repository
public class adminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		System.out.println("여기는 adminDAO getListCount()");
		return sqlSession.selectOne("Admin.memberListCount");
	}

	public List<Member> getMemberList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.memberList",map);
	}

	public int getReviewCount() {
		return sqlSession.selectOne("Admin.reviewCount");
	}

	public List<Review> getReviewList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.reviewList",map);
	}
}
