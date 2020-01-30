package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;

@Service
public interface MainService {

	int insert(Member member);
	int isId(String uSER_ID);
	int isEmail(String uSER_EMAIL);
	int isId(String uSER_ID, String uSER_PASSWORD);
	int isSeller(String uSER_ID);
	Member isAdmin(String uSER_ID);
	List<Product> getBestProduct_List();
	List<Product> getNewProduct_List();
	int cartCount(String id);
	int recentViewCount(String uSER_ID);
	List<Recent_View> getRecent_View_List(String uSER_ID);
	int NaverInsert(HashMap<String, String> map);
}
