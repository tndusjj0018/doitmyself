package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class mainDAO {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
}
