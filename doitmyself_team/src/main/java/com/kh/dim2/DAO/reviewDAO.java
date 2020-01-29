package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Review;

@Repository
public class reviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Review> getReviewList(HashMap<String, Integer> map) {
		return sqlSession.selectList("review.list", map);
	}

	public int getListCount() {
		return sqlSession.selectOne("review.count");
	}

}
