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
	
	public int qnaUpdate(Qna qna) {
		return sqlSession.update("qna.update", qna);
	}
	

	public int insertQna(Qna qna) {
		return sqlSession.insert("qna.insert", qna);		
	}


	public List<Qna> getQnaList(HashMap<String, Integer> map) {
		return sqlSession.selectList("qna.list", map);
	}


	public int getListCount() {
		return sqlSession.selectOne("qna.count");
	}


	public Qna getDetail(int num) {
		return sqlSession.selectOne("qna.detail", num);
	}


	public int qnaDelete(int qna_no) {
		return sqlSession.selectOne("qna.delete", qna_no);
	}

}
