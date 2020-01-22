package com.kh.dim2.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Review;
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

	public Seller sellerNameCheck(String seller_name) {
		return sqlSession.selectOne("Member.sellerNameCheck", seller_name);
	}
	
	public int wishcount(String user_id) {
		return sqlSession.selectOne("Member.wishcount", user_id);
	}
	
	public List<Product> wishlist(String user_id) {
		return sqlSession.selectList("Member.wishlist", user_id);
	}
	
	public int wishdelete(Map<String, Object> map) {
		return sqlSession.delete("Member.wishdelete", map);
	}
	
	public int p_dibsupdate(int p_no) {
		return sqlSession.update("Member.p_dibsupdate", p_no);
	}

	public List<Q_Product> qnalist(String user_id){
		return sqlSession.selectList("Member.qnalist", user_id);
	}
		
	public int qnacount(String user_id) {
		return sqlSession.selectOne("Member.qnacount", user_id);
	}
	
	public List<O_Product> orderlist(String user_id){
		return sqlSession.selectList("Member.orderlist", user_id);
	}
	
	public int ordercount(String user_id) {
		return sqlSession.selectOne("Member.ordercount", user_id);
	}
	
	public List<O_Product> reviewablelist(String user_id){
		return sqlSession.selectList("Member.reviewablelist", user_id);
	}
	
	public int reviewablecount(String user_id) {
		return sqlSession.selectOne("Member.reviewablecount", user_id);
	}
	
	public List<O_Product> reviewwritelist(String user_id){
		return sqlSession.selectList("Member.reviewwritelist", user_id);
	}
	
	public int reviewwritecount(String user_id) {
		return sqlSession.selectOne("Member.reviewwritecount", user_id);
	}
	
	public O_Product reviewDetail(int p_no) {
		return sqlSession.selectOne("Member.reviewDetail", p_no);
	}
}
