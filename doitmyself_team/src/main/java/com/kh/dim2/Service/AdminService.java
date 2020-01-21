package com.kh.dim2.Service;

import java.util.List;
import java.util.Map;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.SubCategory;

public interface AdminService {
	//유저 수 구하기
	public int getListCount(String search_word, String search_col, String option);
	
	//유저 목록 보기 - 검색어 입력 했을 때
	public List<Member> getMemberList(int page, int limit, String search_word, String search_col, String option);
	
	//검색어를 입력 하지 않았을 때 유저 목록 보여주기 
	public List<Member> getMemberList(int num, int limit, String option);
	
	//리뷰 수 구하기
	public int getReviewCount();
	
	
	//리뷰 리스트 가져오기
	public List<Review> getReviewList(int page, int limit, String orderBy);

	//유저 삭제
	public int DeleteUser(int USER_NO);
	
	//유저 정보 수정 
	public int ModifyUser(Member member);
	
	//수정 폼에 유저 정보 가져오기 
	public Member getMemberInfo(int USER_NO);


	public int updateAdminPrivilege(int USER_NO, int USER_IS_ADMIN);

	public List<Category> getMajorCategoryList();

	public List<SubCategory> getSubCategoryList();


}
