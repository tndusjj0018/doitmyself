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
	public int getListCount() {
		System.out.println("여기는 AdminServiceImpl getListCount");
		return adminDAO.getListCount();
	}

	@Override
	public List<Member> getMemberList(int page, int limit,String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		if(!search_word.equals("")) {
			map.put("search_word", search_word);
		}
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
}
