package com.kh.dim2.Service;

import java.util.List;
import java.util.Map;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;

public interface AdminService {
	//유저 수 구하기
	public int getListCount(String search_word, String search_col);
	
	//유저 목록 보기 - 검색어 입력 했을 때
	public List<Member> getMemberList(int page, int limit, String search_word, String search_col);
	
	//검색어를 입력 하지 않았을 때 유저 목록 보여주기 
	public List<Member> getMemberList(int num, int limit);
	//리뷰 수 구하기
	public int getReviewCount();
	
	//리뷰 리스트 가져오기
	public List<Review> getReviewList(int page, int limit, String orderBy);

	public int DeleteUser(int USER_NO);

	public int ModifyUser(int USER_NO);

	public Member getMemberInfo(int USER_NO);


}
