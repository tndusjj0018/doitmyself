package com.kh.dim2.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Qna;

@Repository
public class qnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public void insertQna(Qna qna) {
		sqlSession.insert("qna.insert", qna);		
	}

}
