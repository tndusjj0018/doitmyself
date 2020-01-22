package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Repository
public class SellerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Seller> getSellerInfo(HashMap<String, String> map) {
		return sqlSession.selectList("Seller.SellerInfo", map);
	}

	public int seller_infoUpdate(Seller s) {
		return sqlSession.update("Seller.SellerInfoUpdate", s);
	}

	public List<Category> getProductCategory() {
		return sqlSession.selectList("Seller.ProductCategory");
	}

	public List<SubCategory> getProductSubCategory(HashMap<String, Integer> map) {
		return sqlSession.selectList("Seller.ProductSubCategory", map);
	}

}
