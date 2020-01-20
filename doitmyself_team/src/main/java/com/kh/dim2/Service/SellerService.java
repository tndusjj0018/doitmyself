package com.kh.dim2.Service;

import java.util.List;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

public interface SellerService {
	//판매자 정보
	List<Seller> sellerInfo(String id);

	//판매자 정보 수정
	int infoUpdate(Seller s);

	//카테고리 불러오기
	List<Category> productCategory();

	//서브카테고리 불러오기
	List<SubCategory> productSubCategory(int c_no);

}
