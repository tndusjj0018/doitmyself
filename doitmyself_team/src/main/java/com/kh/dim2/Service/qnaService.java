package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Qna;

@Service
public interface qnaService {
	
	//문의글 작성
	public int insertQna(Qna qna);

	//문의글 갯수 구하기
	public int getListCount(int p_no, String cate);

	//문의글 목록 보기
	public List<Qna> getQnaList(int p_no, int page, int limit, String cate);

	//문의글 수정
	public int qnaUpdate(Qna qna);

	//문의글 수정을 위해 불러올 원문글  번호
	public Qna getDetail(int num);

	//문의글 삭제
	public int qnaDelete(int qna_no);



}
