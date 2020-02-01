package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.adminDAO;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Refund;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private adminDAO adminDAO;
	
	@Override
	public int getListCount(String search_word, String search_col, String option) {
		System.out.println("여기는 AdminServiceImpl getListCount");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_word", search_word);
		map.put("search_col", search_col);
		if(!option.equals("") && option != null) {
			map.put("option", option);
		}
		return adminDAO.getListCount(map);
	}
	
	
	// 검색을 했을 때 유저 목록 보기
	@Override
	public List<Member> getMemberList(int page, int limit,String search_word, String search_col, String option) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		if(!search_word.equals("")) {
			map.put("search_word", search_word);
			map.put("search_col", search_col);
		}

		if(!option.equals("") && option != null) {
			map.put("option", option);
		}
		return adminDAO.getMemberList(map);
	}
	//검색어를 입력하지 않았을 때 유저 목록 전체 보여주기
	@Override
	public List<Member> getMemberList(int page, int limit, String option) {
		System.out.println("검색어를 입력하지 않았을 때의 memberList 가져오기 option = "+option);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		if(!option.equals("") && option != null) {
			map.put("option", option);
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
	public int ModifyUser(Member member) {
		System.out.println("AdminServiceImpl의 ModifyUser");
		return adminDAO.ModifyUser(member);
	}

	@Override
	public int updateAdminPrivilege(int USER_NO, int USER_IS_ADMIN) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("USER_NO", USER_NO);
		map.put("USER_IS_ADMIN", USER_IS_ADMIN);
		return adminDAO.updateAdminPrivilege(map);

	}


	@Override
	public List<Category> getMajorCategoryList() {
		return adminDAO.getMajorCategoryList();
	}


	@Override
	public List<SubCategory> getSubCategoryList() {
		return adminDAO.getSubCategoryList();

	}


	@Override
	public String getMaxMajorCategoryNo() {
		return adminDAO.getMaxMajorCategoryNo();
	}


	@Override
	public String getMaxSubCategoryNo(int SC_NO_REF) {
		System.out.println("AdminServiceImpl SC_NO_REF = "+SC_NO_REF);
		return adminDAO.getMaxSubCategoryNo(SC_NO_REF);
	}


	@Override
	public String C_NameCheck(String C_NAME) {
		System.out.println("여기는 AdminServiceImpl C_NameCheck" + C_NAME);
		return adminDAO.C_NameCheck(C_NAME);
	}


	@Override
	public int addSubCategory(SubCategory sub) {
		return adminDAO.addSubCategory(sub);
	}


	@Override
	public int addMajorCategory(Category major) {
		return adminDAO.addMajorCategory(major);
	}


	@Override
	public String SC_NameCheck(String SC_NAME) {
		return adminDAO.SC_NameCheck(SC_NAME);
	}


	@Override
	public int deleteReview(int REVIEW_NO) {
		return adminDAO.deleteReview(REVIEW_NO);
	}


	@Override
	public List<Seller> getSellerList(Map<String, Object> map) {//검색어가 없을 때 판매자 리스트 뽑기
		return adminDAO.getSellerList(map);
	}


	@Override
	public int getSellerListCount() {
		return adminDAO.getSellerListCount();
	}


	@Override
	public Seller SellerInfoView(int SELLER_NO) {
		return adminDAO.SellerInfoView(SELLER_NO);
	}


	@Override
	public int DeleteSeller(int SELLER_NO) {
		return adminDAO.DeleteSeller(SELLER_NO);
	}


	@Override
	public List<Order> getOrderList() {
		return adminDAO.getOrderList();
	}


	@Override
	public int updateMajorCategory(Map<String, Object> map) {
		return adminDAO.updateMajorCategory(map);
	}


	@Override
	public int updateSubCategory(Map<String, Object> map) {
		return adminDAO.updateSubCategory(map);
	}


	@Override
	public int DeleteMajorCategory(String category_name) {
		return adminDAO.DeleteMajorCategory(category_name);
	}


	@Override
	public int DeleteSubCategory(String category_name) {
		return adminDAO.DeleteSubCategory(category_name);
	}


	@Override
	public List<Refund> getRefundList() {
		return adminDAO.getRefundList();
	}


	@Override
	public List<Order> getExchangeList() {
		return adminDAO.getExchangeList();
	}

	@Override
	public List<Product> getProductList(Map<String, Object> map) {
		return adminDAO.getProductList(map);
	}

}
