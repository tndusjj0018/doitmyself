package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Cart;

@Repository
public class cartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Cart cart) {
		return sqlSession.insert("cart.insert", cart);
	}
	

}
