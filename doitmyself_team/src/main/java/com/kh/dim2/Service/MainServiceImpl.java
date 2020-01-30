package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.mainDAO;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	public mainDAO dao;

	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}

	@Override
	public int isId(String uSER_ID) {
		Member mb = dao.idcheck(uSER_ID);
		return (mb == null) ? -1 : 1;
	}

	@Override
	public int isEmail(String uSER_EMAIL) {
		Member mb = dao.emailcheck(uSER_EMAIL);
		return (mb == null) ? -1 : 1;
	}

	@Override
	public int isId(String uSER_ID, String uSER_PASSWORD) {
		Member mb = dao.login(uSER_ID , uSER_PASSWORD);
		int result = -1;
		if(mb != null) {
			if(mb.getUSER_PASSWORD().equals(uSER_PASSWORD)) {
				result = 1;
			} else {
				result = 0;
			}
		}
		return result;
	}

	@Override
	public int isSeller(String uSER_ID) {
		return dao.sellercheck(uSER_ID);
	}

	@Override
	public Member isAdmin(String uSER_ID) {
		return dao.admin_check(uSER_ID);
	}

	@Override
	public List<Product> getBestProduct_List() {
		return dao.getBestProduct_List();
	}

	@Override
	public List<Product> getNewProduct_List() {
		return dao.getNewProduct_List();
	}

	@Override
	public int cartCount(String id) {
		return dao.getCart_count(id);
	}
 
	@Override
	public int recentViewCount(String uSER_ID) {
		return dao.recentView_Count(uSER_ID);
	}

	@Override
	public List<Recent_View> getRecent_View_List(String uSER_ID) {
		return dao.getRecent_View_List(uSER_ID);
	}

	@Override
	public int NaverInsert(HashMap<String, String> map) {
		return dao.NaverInsert(map);
	}

	
}
