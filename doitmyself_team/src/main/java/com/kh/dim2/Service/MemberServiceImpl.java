package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.memberDAO;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.Seller;

@Service

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private memberDAO dao;
	
	@Override
	public Member memberInfo(String id) {
		return dao.memberInfo(id);
	}
	
	@Override
	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}

	@Override
	public int passCheck(String user_id, String user_password) {
		Member m = dao.memberInfo(user_id);
		if(m.getUSER_PASSWORD().equals(user_password)) {
			System.out.println("현재 비밀번호 맞음");
			return 1;
		} else {
			System.out.println("현재 비밀번호 틀림");
			return -1;
		}		
	}

	@Override
	public int passChange(String change_password, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("change_password", change_password);
		map.put("USER_ID", user_id);
		
		return dao.passChange(map);
	}

	@Override
	public int memberLeave(String user_id) {
		return dao.memberLeave(user_id);
	}

	@Override
	public int sellerChange(Seller seller) {
		return dao.sellerChange(seller);
	}

	@Override
	public int isSeller(String user_id) {
		return dao.isSeller(user_id);
	}

	@Override
	public int sellerNameCheck(String seller_name) {
		Seller seller = dao.sellerNameCheck(seller_name);
		return (seller == null) ? -1 : 1;
	}

	@Override
	public int wishcount(String user_id) {
		return dao.wishcount(user_id);
	}

	@Override
	public List<Product> wishlist(String user_id, int page, int limit) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.wishlist(map);
	}
	
	public int wishdelete(int p_no, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("P_NO", p_no);
		map.put("USER_ID", user_id);
		
		return dao.wishdelete(map);
	}

	@Override
	public int p_dibsupdate(int p_no) {
		return dao.p_dibsupdate(p_no);
	}

	@Override
	public List<Q_Product> qnalist(String user_id, String qnaCate) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		int startrow = (page - 1) * limit + 1;
//		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
//		map.put("start", startrow);
//		map.put("end", endrow);
		map.put("qnaCate", qnaCate);
		return dao.qnalist(map);
	}
	
	@Override
	public List<Q_Product> qnalist(String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("USER_ID", user_id);
		return dao.qnalist(map);
	}


	@Override
	public int qnacount(String user_id) {
		return dao.qnacount(user_id);
	}

	@Override
	public int ordercount(String user_id) {
		return dao.ordercount(user_id);
	}

	@Override
	public List<O_Product> orderlist(String user_id, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.orderlist(map);
	}

	@Override
	public List<O_Product> reviewablelist(String user_id, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.reviewablelist(map);
	}

	@Override
	public int reviewablecount(String user_id) {
		return dao.reviewablecount(user_id);
	}

	@Override
	public List<O_Product> reviewwritelist(String user_id, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.reviewwritelist(map);
	}

	@Override
	public int reviewwritecount(String user_id) {
		return dao.reviewwritecount(user_id);
	}

	@Override
	public O_Product reviewDetail(int p_no, int review_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("P_NO", p_no);
		map.put("REVIEW_NO", review_no);
		
		return dao.reviewDetail(map);
	}

	@Override
	public Product productDetail(int p_no) {
		return dao.productDetail(p_no);
	}

	@Override
	public int reviewWrite(Review review) {
		return dao.reviewWrite(review);
	}

	@Override
	public int reviewUpdate(Review review) {
		return dao.reviewUpdate(review);
	}

	@Override
	public int reviewDelete(int review_no) {
		return dao.reviewDelete(review_no);
	}

	@Override
	public List<O_Product> cancelreturnlist(String user_id, int page, int limit) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit -1;
		
		map.put("USER_ID", user_id);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.cancelreturnlist(map);
	}
	
	@Override
	public int cancelreturncount(String user_id) {
		return dao.cancelreturncount(user_id);
	}

	@Override
	public int cancelRegister(int order_no) {
		return dao.cancelRegister(order_no);
	}
	
	@Override
	public O_Product cancelDetail(int order_no) {
		return dao.cancelDetail(order_no);
	}

	@Override
	public int returnRegister(int order_no) {
		return dao.returnRegister(order_no);
	}

	

	


}
