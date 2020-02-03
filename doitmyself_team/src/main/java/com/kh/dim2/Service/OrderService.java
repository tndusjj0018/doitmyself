package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Order;

@Service
public interface OrderService {

    //결제 완료시 주문테이블에 주문 정보 입력
	public int insertOrder(Order order);
	
	



}
