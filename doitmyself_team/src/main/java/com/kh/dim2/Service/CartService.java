package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Cart;
import com.kh.dim2.domain.Review;

@Service
public interface CartService {

    //장바구니 테이블에 입력
	public int insert(Cart cart);
	
	



}
