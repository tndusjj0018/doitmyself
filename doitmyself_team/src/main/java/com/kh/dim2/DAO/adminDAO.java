package com.kh.dim2.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Refund;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Repository
public class adminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(Map<String, Object> map) {
		System.out.println("여기는 adminDAO getListCount()");
		return sqlSession.selectOne("Admin.memberListCount", map);
	}

	public List<Member> getMemberList(Map<String, Object> map) {
		System.out.println("여기는 adminDAO의 getMemberList" + map.toString());
		return sqlSession.selectList("Admin.memberList",map);
	}

	public int getReviewCount() {
		return sqlSession.selectOne("Admin.reviewCount");
	}

	
	public List<Review> getReviewList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.reviewList",map);
	}

	public int DeleteUser(int USER_NO) {
		return sqlSession.delete("Admin.deleteUser", USER_NO);
	}

	public int ModifyUser(Member member) {
		System.out.println("여기는 adminDAO ModifyUser()"+member);
		return sqlSession.update("Admin.modifyUser", member);
	}

	public Member getMemberInfo(int USER_NO) {
		System.out.println("adminDAO의 getMemberInfo");
		return sqlSession.selectOne("Admin.userinfo",USER_NO);
	}


	public int updateAdminPrivilege(Map<String, Object> map) {
		return sqlSession.update("Admin.updatePrivilege", map);
	}

	public List<Category> getMajorCategoryList() {
		return sqlSession.selectList("Admin.MajorCategoryList");
	}

	public List<SubCategory> getSubCategoryList() {
		return sqlSession.selectList("Admin.SubCategoryList");
	}

	public String getMaxMajorCategoryNo() {
		return sqlSession.selectOne("Admin.getMaxMajorCategoryNo");
	}
	
	public String getMaxSubCategoryNo(int SC_NO_REF) {
		System.out.println("AdminDAO SC_NO_REF = "+SC_NO_REF);
		return sqlSession.selectOne("Admin.getMaxSubCategoryNo", SC_NO_REF);
	}

	public String C_NameCheck(String C_NAME) {
		return sqlSession.selectOne("Admin.C_NameCheck",C_NAME);
	}

	public int addSubCategory(SubCategory sub) {
		System.out.println("adminDAO 의  addsubCategory" + sub.getSC_NO());
		return sqlSession.insert("Admin.addSubCategory",sub);
	}

	public int addMajorCategory(Category major) {
		System.out.println("adminDAO 의  addMajorCategory" + major.getC_NO());
		return sqlSession.insert("Admin.addMajorCategory",major);
	}

	public String SC_NameCheck(String SC_NAME) {
		return sqlSession.selectOne("Admin.SC_NameCheck", SC_NAME);
	}

	public int deleteReview(int REVIEW_NO) {
		return sqlSession.delete("Admin.deleteReview", REVIEW_NO);
	}

	public List<Seller> getSellerList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getSellerList",map);
	}

	public int getSellerListCount() {
		return sqlSession.selectOne("Admin.getSellerListCount");
	}

	public Seller SellerInfoView(int SELLER_NO) {
		return sqlSession.selectOne("Admin.SellerInfoView", SELLER_NO);
	}

	public int DeleteSeller(int SELLER_NO) {
		return sqlSession.delete("Admin.DeleteSeller",SELLER_NO);
	}

	public List<Order> getOrderList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getOrderList",map);
	}

	public int updateMajorCategory(Map<String, Object> map) {
		return sqlSession.update("Admin.updateMajorCategory",map);
	}

	public int updateSubCategory(Map<String, Object> map) {
		return sqlSession.update("Admin.updateSubCategory",map);
	}

	public int DeleteSubCategory(String category_name) {
		return sqlSession.delete("Admin.DeleteSubCategory",category_name);
	}
	public int DeleteMajorCategory(String category_name) {
		return sqlSession.delete("Admin.DeleteMajorCategory",category_name);
	}

	public List<Refund> getRefundList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getRefundList",map);
	}

	public List<Order> getExchangeList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getExchangeList",map);
	}

	public List getCategoryNoList() {
		return sqlSession.selectList("Admin.getCategoryNoList");
	}

	public List getCategoryName() {
		return sqlSession.selectList("Admin.getCategoryName");
	}

	public Object getCategoryStatics(Object category) {
		return sqlSession.selectOne("Admin.getCategoryStatics",category);
	}

	public int getOrderListCount() {
		return sqlSession.selectOne("Admin.getOrderListCount");
	}

	public int getRefundListCount() {
		return sqlSession.selectOne("Admin.getRefundListCount");
	}

	public int getExchangeListCount() {
		return sqlSession.selectOne("Admin.getExchangeListCount");
	}

	public Object getOrderStatics(int i) {
		return sqlSession.selectOne("Admin.getOrderStatics",i);
	}
	
	

}
