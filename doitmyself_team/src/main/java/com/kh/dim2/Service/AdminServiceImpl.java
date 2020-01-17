package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.adminDAO;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private adminDAO adminDAO;
	
	@Override
	public int getListCount(String search_word, String search_col) {
		System.out.println("여기는 AdminServiceImpl getListCount");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_word", search_word);
		map.put("search_col", search_col);
		return adminDAO.getListCount(map);
	}
	
	// 검색을 했을 때 유저 목록 보기
	@Override
	public List<Member> getMemberList(int page, int limit,String search_word, String search_col) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		if(!search_word.equals("")) {
			map.put("search_word", search_word);
			map.put("search_col", search_col);
		}
		return adminDAO.getMemberList(map);
	}
	//검색어를 입력하지 않았을 때 유저 목록 전체 보여주기
	@Override
	public List<Member> getMemberList(int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		return adminDAO.getMemberList(map);
	}
	
	@Override
	public int getReviewCount() {
		System.out.println("여기는 AdminServiceImpl의 getReviewCount()");
		return adminDAO.getReviewCount();
	}

	@Override
	public List<Review> getReviewList(int page, int limit, String orderBy) {
		System.out.println("여기는 AdminServiceImpl의 getReviewList()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		map.put("orderBy", orderBy);
		return adminDAO.getReviewList(map);
	}

	@Override
	public int DeleteUser(int USER_NO) {
		return adminDAO.DeleteUser(USER_NO);
	}

	@Override
	public Member getMemberInfo(int USER_NO) {
		System.out.println("AdminServiceImpl의 getMemberInfo");
		return adminDAO.getMemberInfo(USER_NO);
	}
	
	@Override
	public int ModifyUser(int USER_NO) {
		return 0;
	}


}
