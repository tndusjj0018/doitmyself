package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.SellerDAO;
import com.kh.dim2.domain.Seller;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	private SellerDAO sellerDAO;

	@Override
	public List<Seller> sellerInfo(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return sellerDAO.getSellerInfo(map);
	}

}
