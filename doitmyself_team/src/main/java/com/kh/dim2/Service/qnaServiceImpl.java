package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.qnaDAO;
import com.kh.dim2.domain.Qna;

@Service
public class qnaServiceImpl implements qnaService {

	@Autowired
	private qnaDAO dao;
	
	@Override
	public void insertQna(Qna qna) {
		dao.insertQna(qna);		
	}
	
}
