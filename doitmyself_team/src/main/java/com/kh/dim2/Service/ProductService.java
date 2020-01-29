package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Product;

@Service
public interface ProductService {

	public Product getDetail(int num);
	
	



}
