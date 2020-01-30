package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.prdDAO;
import com.kh.dim2.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private prdDAO dao;

	@Override
	public Product getDetail(int num) {
		return dao.getDetail(num);
	}
	

	
}
