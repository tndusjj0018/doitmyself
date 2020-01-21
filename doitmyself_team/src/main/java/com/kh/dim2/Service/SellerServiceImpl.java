package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.SellerDAO;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Product;
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

}
