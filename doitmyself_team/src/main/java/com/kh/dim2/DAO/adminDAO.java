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
	
	public int getListCount(Map<String, Object> map) {
		System.out.println("여기는 adminDAO getListCount()");
		return sqlSession.selectOne("Admin.memberListCount", map);
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

	public int DeleteUser(int USER_NO) {
		return sqlSession.delete("Admin.deleteUser", USER_NO);
	}

	public int ModifyUser(Member member) {
		System.out.println("여기는 adminDAO ModifyUser()"+member);
		return sqlSession.update("Admin.modifyUser", member);
	}

	public Member getMemberInfo(int USER_NO) {
		System.out.println("adminDAO의 getMemberInfo");
		return sqlSession.selectOne("Admin.userinfo",USER_NO);
	}


	public int updateAdminPrivilege(Map<String, Object> map) {
		return sqlSession.update("Admin.updatePrivilege", map);
	}
	
}
