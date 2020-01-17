package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Seller;

@Repository
public class SellerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Seller> getSellerInfo(HashMap<String, String> map) {
		return sqlSession.selectList("Seller.SellerInfo", map);
	}

}