package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.SellerDAO;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Qna;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	private SellerDAO sellerDAO;

	@Override
	public List<Seller> sellerInfo(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return sellerDAO.getSellerInfo(map);
	}

	@Override
	public int infoUpdate(Seller s) {
		return sellerDAO.seller_infoUpdate(s);
	}

	@Override
	public List<Category> productCategory() {
		return sellerDAO.getProductCategory();
	}

	@Override
	public List<SubCategory> productSubCategory(int c_no) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("c_no", c_no);
		return sellerDAO.getProductSubCategory(map);
	}

	@Override
	public void insertProduct(Product product) {
		sellerDAO.insertProduct(product);
	}

	@Override
	public List<Order> getOrderList(String USER_ID, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page-1) * limit + 1;
		int endrow = startrow + limit -1;
		map.put("USER_ID", USER_ID);
		map.put("start", startrow);
		map.put("end", endrow);
		return sellerDAO.getOrderList(map);
	}

	@Override
	public String getSellerName(String USER_ID) {
		return sellerDAO.getSellerName(USER_ID);
	}

	@Override
	public int getOrderListCount(String USER_ID) {
		return sellerDAO.getOrderListCount(USER_ID);
	}

	@Override
	public List<Product> SaleList(String USER_ID, String saleSelect) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("USER_ID", USER_ID);
		map.put("saleSelect", saleSelect);
		return sellerDAO.SaleSelect(map);
	}

	@Override
	public Product productInfo(int P_NO) {
		return sellerDAO.productInfo(P_NO);
	}

	@Override
	public int productUpdate(Product product) {
		return sellerDAO.productUpdate(product);
	}

	@Override
	public int orderStatus(int P_NO, String ORDER_TRNO, int orderDeliveryVal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("P_NO", P_NO);
		map.put("ORDER_TRNO", ORDER_TRNO);
		map.put("orderDeliveryVal", orderDeliveryVal);
		return sellerDAO.orderStatus(map);
	}

	@Override
	public List<Qna> sellerQna(String USER_ID) {
		return sellerDAO.sellerQna(USER_ID);
	}

	@Override
	public Qna QnaReplyView(int q_p_no) {
		return sellerDAO.QnaReplyView(q_p_no);
	}

	@Override
	public int QnaUpdate(int QnaNo, String QnaAnswer) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("QnaNo", QnaNo);
		map.put("QnaAnswer", QnaAnswer);		
		
		return sellerDAO.QnaUpdate(map);
	}
	
	@Override
	public int productDelete(int P_NO) {
		return sellerDAO.productDelete(P_NO);
	}

	@Override
	public int OrderAmountM(int ORDER_AMOUNT, int ORDER_P_NO) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ORDER_AMOUNT", ORDER_AMOUNT);
		map.put("ORDER_P_NO", ORDER_P_NO);		
		return sellerDAO.OrderAmountM(map);
	}

}
