package com.kh.dim2.Service;

import java.util.List;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;

public interface AdminService {
	//유저 수 구하기
	public int getListCount();
	
	//유저 목록 보기
	public List<Member> getMemberList(int page, int limit, String search_word);
	
	//리뷰 수 구하기
	public int getReviewCount();
	
	//리뷰 리스트 가져오기
	public List<Review> getReviewList(int page, int limit, String orderBy);
}
