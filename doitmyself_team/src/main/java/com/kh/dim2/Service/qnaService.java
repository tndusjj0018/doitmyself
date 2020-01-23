package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Qna;

@Repository
public interface qnaService {
	
	//문의글 작성
	public void insertQna(Qna qna);

	//문의글 갯수 구하기
	public int getListCount();

	//문의글 목록 보기
	public List<Qna> getQnaList(int page, int limit);



}
