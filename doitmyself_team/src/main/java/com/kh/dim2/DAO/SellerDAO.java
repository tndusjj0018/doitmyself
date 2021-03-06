package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Qna;
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

	public void insertProduct(Product product) {
		sqlSession.insert("Seller.ProductInsert", product);
	}

	public List<Order> getOrderList(HashMap<String, Object> map) {
		return sqlSession.selectList("Seller.OrderList", map);
	}

	public String getSellerName(String USER_ID) {
		return sqlSession.selectOne("Seller.SellerName", USER_ID);
	}

	public int getOrderListCount(String USER_ID) {
		return sqlSession.selectOne("Seller.OrderCount", USER_ID);
	}

	public List<Product> SaleSelect(HashMap<String, String> map) {
		return sqlSession.selectList("Seller.SaleSelect", map);
	}

	public Product productInfo(int P_NO) {
		return sqlSession.selectOne("Seller.productInfo", P_NO);
	}

	public int productUpdate(Product product) {
		return sqlSession.update("Seller.productUpdate", product);
	}

	public int orderStatus(HashMap<String, Object> map) {
		return sqlSession.update("Seller.orderDelivery", map);
	}

	public List<Qna> sellerQna(String USER_ID) {
		return sqlSession.selectList("Seller.sellerQna", USER_ID);
	}

	public Qna QnaReplyView(int q_p_no) {
		return sqlSession.selectOne("Seller.QnaReplyView", q_p_no);
	}

	public int QnaUpdate(HashMap<String, Object> map) {
		return sqlSession.update("Seller.QnaUpdate", map);
	}

	public int OrderAmountM(HashMap<String, Integer> map) {
		return sqlSession.update("Seller.OrderAmountM", map);
	}

	public int productDelete(int P_NO) {
		return sqlSession.delete("Seller.productDelete", P_NO);
	}

	public String productNameCheck(String p_name) {
		return sqlSession.selectOne("Seller.productNameCheck", p_name);
	}

	public List<Order> CancelList(HashMap<String, Object> map) {
		return sqlSession.selectList("Seller.CancelList", map);
	}

}
