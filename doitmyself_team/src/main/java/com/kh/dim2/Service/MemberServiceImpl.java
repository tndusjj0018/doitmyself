package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.memberDAO;
import com.kh.dim2.domain.DIBS;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Qna;
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
	public List<Product> wishlist(String user_id) {
		return dao.wishlist(user_id);
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
	public List<Q_Product> qnalist(String user_id) {
		return dao.qnalist(user_id);
	}


	@Override
	public int qnacount(String user_id) {
		return dao.qnacount(user_id);
	}

	
}
