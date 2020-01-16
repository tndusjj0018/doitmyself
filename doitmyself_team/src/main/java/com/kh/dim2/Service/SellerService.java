package com.kh.dim2.Service;

import java.util.List;

import com.kh.dim2.domain.Seller;

public interface SellerService {
	//판매자 정보
	List<Seller> sellerInfo(String id);

}
