package com.kh.dim2.Service;

import java.util.List;
import java.util.Map;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Refund;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.Seller;
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
	public List<Review> getReviewList(Map<String, Object> map);

	//유저 삭제
	public int DeleteUser(int USER_NO);
	
	//유저 정보 수정 
	public int ModifyUser(Member member);

	//수정 폼에 유저 정보 가져오기 
	public Member getMemberInfo(int USER_NO);
	
	public int updateAdminPrivilege(int USER_NO, int USER_IS_ADMIN);

	public List<Category> getMajorCategoryList();

	public List<SubCategory> getSubCategoryList();
	
	//메인 카테고리 넘버 큰것 구하기 - 카테고리 추가
	public String getMaxMajorCategoryNo();
	//서브 카테고리 넘버 큰것 구하기 - 카테고리 추가
	public String getMaxSubCategoryNo(int SC_NO_REF);
	//
	public String C_NameCheck(String C_NAME);

	public String SC_NameCheck(String SC_NAME);
	
	public int addSubCategory(SubCategory sub);

	public int addMajorCategory(Category major);

	public int deleteReview(int REVIEW_NO);

	public List<Seller> getSellerList(Map<String, Object> map);

	public int getSellerListCount();

	public Seller SellerInfoView(int SELLER_NO);

	public int DeleteSeller(int SELLER_NO);

	public List<Order> getOrderList(Map<String, Object> map);

	public int updateMajorCategory(Map<String, Object> map);

	public int updateSubCategory(Map<String, Object> map);

	public int DeleteMajorCategory(String category_name);
	
	public int DeleteSubCategory(String category_name);

	public List<Refund> getRefundList(Map<String, Object> map);

	public List<Order> getExchangeList(Map<String, Object> map);

	public List getCategoryNoList();

	public List getCategoryName();

	public Object getCategoryStatics(Object category);

	public int getOrderListCount();

	public int getRefundListCount();
	
	public int getExchangeListCount();

	public Object getOrderStatics(int i);

}
