package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.C_Product;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Refund;
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
	
	public List<Product> wishlist(HashMap<String, Object> map) {
		return sqlSession.selectList("Member.wishlist", map);
	}
	
	public int wishdelete(Map<String, Object> map) {
		return sqlSession.delete("Member.wishdelete", map);
	}
	
	public int p_dibsupdate(int p_no) {
		return sqlSession.update("Member.p_dibsupdate", p_no);
	}

	public List<Q_Product> qnalist(HashMap<String, Object> map){
		return sqlSession.selectList("Member.qnalist", map);
	}
		
	public int qnacount(String user_id) {
		return sqlSession.selectOne("Member.qnacount", user_id);
	}
	
	public List<O_Product> orderlist(HashMap<String, Object> map){
		return sqlSession.selectList("Member.orderlist", map);
	}
	
	public int ordercount(String user_id) {
		return sqlSession.selectOne("Member.ordercount", user_id);
	}
	
	public List<O_Product> reviewablelist(HashMap<String, Object> map){
		return sqlSession.selectList("Member.reviewablelist", map);
	}
	
	public int reviewablecount(String user_id) {
		return sqlSession.selectOne("Member.reviewablecount", user_id);
	}
	
	public List<O_Product> reviewwritelist(HashMap<String, Object> map){
		return sqlSession.selectList("Member.reviewwritelist", map);
	}
	
	public int reviewwritecount(String user_id) {
		return sqlSession.selectOne("Member.reviewwritecount", user_id);
	}
	
	public O_Product reviewDetail(Map<String, Object> map) {
		return sqlSession.selectOne("Member.reviewDetail", map);
	}
	
	public Product productDetail(int p_no) {
		return sqlSession.selectOne("Member.productDetail", p_no);
	}
	
	public int reviewWrite(Review review) {
		return sqlSession.insert("Member.reviewWrite", review);
	}
	
	public int reviewUpdate(Review review) {
		return sqlSession.update("Member.reviewUpdate", review);
	}
	
	public int reviewDelete(int review_no) {
		return sqlSession.delete("Member.reviewDelete", review_no);
	}
	
	public List<O_Product> cancelreturnlist(HashMap<String, Object> map){
		return sqlSession.selectList("Member.cancelreturnlist", map);
	}
	
	public int cancelreturncount(String user_id) {
		return sqlSession.selectOne("Member.cancelreturncount", user_id);
	}
	
	public int cancelRegister(int order_no) {
		return sqlSession.update("Member.cancelregister", order_no);
	}
	
	public O_Product cancelDetail(int order_no) {
		return sqlSession.selectOne("Member.cancelDetail", order_no);
	}
	
	public int returnRegister(int order_no) {
		return sqlSession.update("Member.returnregister", order_no);
	}
	
	public int refundinsert(Refund refund) {
		return sqlSession.insert("Member.refundinsert", refund);
	}

	public int cartcount(String user_id) {
		return sqlSession.selectOne("Member.cartcount", user_id);
	}

	public List<C_Product> cartlist(HashMap<String, Object> map) {
		return sqlSession.selectList("Member.cartlist", map);
	}

	public int cartdelete(Map<String, Object> map) {
		return sqlSession.delete("Member.cartdelete", map);
	}
}
