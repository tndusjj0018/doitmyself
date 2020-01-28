package com.kh.dim2.Service;

import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Product;

@Repository
public interface ProductService {

	Product getDetail(int num);
	
	



}
