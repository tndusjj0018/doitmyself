package com.kh.dim2.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Product;

@Repository
public class categoryDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Product> getProductList(Map<String, Object> map) {
		return sqlSession.selectList("Category.productList",map);
	}

	public int getProductListcount(Map<String, Object> map) {
		return sqlSession.selectOne("Category.getProductListcount",map);
	}

	public String checkDibs(Map<String,Object> map) {
		return sqlSession.selectOne("Category.dibsCheck",map);
	}

	public int dibsInsert(Map<String, Object> map) {
		return sqlSession.insert("Category.dibsInsert",map);
	}

	public int dibsDelete(Map<String, Object> map) {
		return sqlSession.delete("Category.dibsDelete",map);
	}
	
}
