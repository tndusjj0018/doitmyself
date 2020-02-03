package com.kh.dim2.Service;

import java.util.List;
import java.util.Map;

import com.kh.dim2.domain.Product;

public interface CategoryService {
	public List<Product> getProductList(Map<String, Object> map);

	public int getProductListcount(Map<String, Object> map);
	
	public String checkDibs(Map<String,Object> map);
	
	public int dibsInsert(Map<String, Object> map);
	
	public int dibsDelete(Map<String, Object> map);
}
