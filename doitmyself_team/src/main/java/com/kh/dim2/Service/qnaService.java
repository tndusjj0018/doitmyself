package com.kh.dim2.Service;

import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Qna;

@Repository
public interface qnaService {
	
	//문의글 작성
	public void insertQna(Qna qna);


}
