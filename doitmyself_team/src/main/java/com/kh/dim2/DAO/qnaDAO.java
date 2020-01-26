package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;

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


	public List<Qna> getQnaList(HashMap<String, Integer> map) {
		return sqlSession.selectList("qna.list", map);
	}


	public int getListCount() {
		return sqlSession.selectOne("qna.count");
	}

}
