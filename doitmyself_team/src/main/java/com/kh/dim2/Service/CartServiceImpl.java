package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.cartDAO;
import com.kh.dim2.domain.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private cartDAO dao;

	@Override
	public int insert(Cart cart) {
		return dao.insert(cart);
	}

	
	



}
