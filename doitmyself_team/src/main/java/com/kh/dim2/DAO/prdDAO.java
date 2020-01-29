package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Product;

@Repository
public class prdDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Product getDetail(int num) {
		return sqlSession.selectOne("Product.detail", num);
	}

}
