package com.kh.dim2.DAO;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Seller;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member memberInfo(String id) {
		return sqlSession.selectOne("Member.readinfo", id);
	}

	public int memberUpdate(Member m) {
		return sqlSession.update("Member.updateinfo", m);
	}
	
	public String passCheck(String user_id) {
		return sqlSession.selectOne("Member.passcheck", user_id);
	}
	
	public int passChange(Map<String, Object> map) {
		return sqlSession.update("Member.passchange", map);
	}
	
	public int memberLeave(String user_id) {
		return sqlSession.delete("Member.memberLeave", user_id);
	}

	public int sellerChange(Seller seller) {
		return sqlSession.insert("Member.sellerChange", seller);
	}
	
	public int isSeller(String user_id) {
		return sqlSession.selectOne("Member.isSeller", user_id);
	}

}
