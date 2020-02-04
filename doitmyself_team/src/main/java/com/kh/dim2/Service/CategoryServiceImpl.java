package com.kh.dim2.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Product;
import com.kh.dim2.DAO.categoryDAO;
@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	categoryDAO categoryDAO;
	
	@Override
	public List<Product> getProductList(Map<String, Object> map) {
		return categoryDAO.getProductList(map);
	}


	@Override
	public int getProductListcount(Map<String, Object> map) {
		return categoryDAO.getProductListcount(map);
	}

	@Override
	public String checkDibs(Map<String,Object> map) {
		return categoryDAO.checkDibs(map);
	}

	@Override
	public int dibsInsert(Map<String, Object> map) {
		return categoryDAO.dibsInsert(map);
	}

	@Override
	public int dibsDelete(Map<String, Object> map) {
		return categoryDAO.dibsDelete(map);
	}
	
}
