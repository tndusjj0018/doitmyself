package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.orderDAO;
import com.kh.dim2.domain.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private orderDAO dao;

	@Override
	public int insertOrder(Order order) {

		return dao.insertOrder(order);
	}
	

	
}
