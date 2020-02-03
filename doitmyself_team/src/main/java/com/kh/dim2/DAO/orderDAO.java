package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Order;

@Repository
public class orderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertOrder(Order order) {

		return sqlSession.insert("order.insertOrder", order);
	}

}
